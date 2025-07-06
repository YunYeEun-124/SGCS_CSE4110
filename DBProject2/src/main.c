#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mysql.h>

const char *server = "localhost";
const char *user = "root";
const char *password = "1234";
const char *database = "store";

void error_exit(MYSQL *conn) {
    fprintf(stderr, "SQL error: %s\n", mysql_error(conn));
    mysql_close(conn);
    exit(1);
}

void executeQuery(MYSQL *conn, const char *query) {   
    if (mysql_query(conn, query)) {
        error_exit(conn);
    }
    MYSQL_RES *res = mysql_store_result(conn);

    if (res == NULL) {
        printf("Query failed.\n");
        return;
    }

    if (mysql_num_rows(res) == 0) {
        printf("No result.\n");
        mysql_free_result(res);
        return;
    }

    int num_fields = mysql_num_fields(res);
    MYSQL_FIELD *fields = mysql_fetch_fields(res);
    
    // 컬럼명 출력 
    for (int i = 0; i < num_fields; i++) {
        printf("%-20s", fields[i].name);
    }
    printf("\n");

    // 구분선 출력
    for (int i = 0; i < num_fields; i++) {
        printf("--------------------");
    }
    printf("\n");

    MYSQL_ROW row;
    while ((row = mysql_fetch_row(res))) {
        for (int i = 0; i < num_fields; i++) {
            printf("%-20s", row[i] ? row[i] : "NULL");
        }
        printf("\n");
    }

    mysql_free_result(res);
}


// TYPE 1: Product Availability
// TYPE 1 최종 완전체
void executeType1(MYSQL *conn) {
    char input[100];
    char field[10];

    printf("------- TYPE 1 -------\n");
    printf("** Which stores currently carry a certain product (by UPC,name, or brand), and how much inventory do they have? ** \n");    
    
    printf("Enter product : ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = '\0';
  
    printf("Enter product identifier: ");
    fgets(field, sizeof(field), stdin);
    field[strcspn(field, "\n")] = '\0';


    char query[1024];

    if (strcmp(field, "upc") == 0 || strcmp(field, "name") == 0 || strcmp(field, "brand") == 0) {
        sprintf(query,
            "SELECT s.name AS StoreName, p.name AS ProductName, p.brand, i.quantity "
            "FROM Store s JOIN Inventory i ON s.store_id = i.store_id "
            "JOIN Product p ON i.upc = p.upc "
            "WHERE LOWER(p.%s) LIKE LOWER('%%%s%%');",
            field, input);
    } else {
        printf("Invalid field name. \n");
        return;
    }

    executeQuery(conn, query);
}

// TYPE 2: Top Selling Items
void executeType2(MYSQL *conn) {
    printf("------- TYPE 2 -------\n");
    printf("**Which products have the highest sales volume in each store over the past month? ** \n");    
    
    char query[4096];  // 복잡한 쿼리니까 길이 넉넉히

    sprintf(query,
        "WITH SalesPerProductPerStore AS ("
            "SELECT st.store_id, sd.upc, SUM(sd.quantity) AS volume "
            "FROM SaleTransaction st "
            "JOIN SaleDetail sd ON st.saleTransaction_id = sd.saleTransaction_id "
            "GROUP BY st.store_id, sd.upc "
        ") "
        "SELECT s.store_id AS StoreID, s.name AS StoreName, p.upc AS UPC, p.name AS ProductName, sq.volume AS Volume "
        "FROM SalesPerProductPerStore sq "
        "JOIN Store s ON s.store_id = sq.store_id "
        "JOIN Product p ON p.upc = sq.upc "
        "WHERE sq.volume = ( "
            "SELECT MAX(sub.volume) "
            "FROM ( "
                "SELECT st2.store_id, sd2.upc, SUM(sd2.quantity) AS volume "
                "FROM SaleTransaction st2 "
                "JOIN SaleDetail sd2 ON st2.saleTransaction_id = sd2.saleTransaction_id "
                "WHERE st2.store_id = sq.store_id "
                "GROUP BY st2.store_id, sd2.upc "
            ") AS sub "
        ") "
        "ORDER BY s.store_id;"
    );

    executeQuery(conn, query);
}


// TYPE 3: Store Performance
void executeType3(MYSQL *conn) {
    printf("------- TYPE 3 -------\n");
    printf("**Which store has generated the highest overall revenue this quarter? ** \n");    
    
    char query[1024];
    sprintf(query,
        "SELECT s.store_id, s.name AS StoreName, "
        "SUM(sd.quantity * sd.unit_price * (1 - sd.discount_rate / 100)) AS total_revenue "
        "FROM SaleTransaction st "
        "JOIN SaleDetail sd ON st.saleTransaction_id = sd.saleTransaction_id "
        "JOIN Store s ON st.store_id = s.store_id "
        "WHERE QUARTER(st.transaction_time) = QUARTER(CURDATE()) "
        "AND YEAR(st.transaction_time) = YEAR(CURDATE()) "
        "GROUP BY s.store_id, s.name "
        "ORDER BY total_revenue desc limit 1;"
    );

    executeQuery(conn, query);
}

// TYPE 4: Vendor Statistics
void executeType4(MYSQL *conn) {
    printf("------- TYPE 4 -------\n");
    printf("** Which vendor supplies the most products across the chain, and how many total units have been sold? ** \n");    
    
    char query[1024];
    sprintf(query,
        "SELECT v.vendor_id, v.name AS VendorName, "
        "COUNT(p.upc) AS total_products, "
        "SUM(sd.quantity) AS total_sold "
        "FROM Vendor v "
        "JOIN Product p ON v.vendor_id = p.vendor_id "
        "JOIN SaleDetail sd ON p.upc = sd.upc "
        "GROUP BY v.vendor_id, v.name "
        "ORDER BY total_sold DESC "
        "LIMIT 1;"
    );
    executeQuery(conn, query);
}

// TYPE 5: Inventory Reorder Alerts
void executeType5(MYSQL *conn) {
    printf("------- TYPE 5 -------\n");
    printf("** Which products in each store are below the reorder threshold and need restocking? ** \n");    
    
    char query[1024];
     sprintf(query,
        "SELECT s.store_id, s.name AS StoreName, "
        "p.upc, p.name AS ProductName, "
        "i.quantity, i.reorder_threshold "
        "FROM Inventory i "
        "JOIN Store s ON i.store_id = s.store_id "
        "JOIN Product p ON i.upc = p.upc "
        "WHERE i.quantity < i.reorder_threshold;"
    );
    executeQuery(conn, query);
}

// TYPE 6: Customer Purchase Patterns
void executeType6(MYSQL *conn) {
   
    printf("------- TYPE 6 -------\n");
    printf("** List the top 3 items that loyalty program customers typically purchase with coffee. ** \n");    

    char query[2048];
    sprintf(query,
        "SELECT p.name AS ProductName, SUM(sd.quantity) AS total_quantity "
        "FROM SaleTransaction st "
        "JOIN SaleDetail sd ON st.saleTransaction_id = sd.saleTransaction_id "
        "JOIN Product p ON sd.upc = p.upc "
        "JOIN Membership m ON st.customer_id = m.customer_id "
        "WHERE m.level IS NOT NULL "
        "AND st.saleTransaction_id IN ( "
            "SELECT sd2.saleTransaction_id "
            "FROM SaleDetail sd2 "
            "JOIN Product p2 ON sd2.upc = p2.upc "
            "WHERE p2.category = 'Coffee' "
        ") "
        "AND p.category <> 'Coffee' "
        "GROUP BY p.name "
        "ORDER BY total_quantity DESC "
        "LIMIT 3;"

    );
    executeQuery(conn, query);
}


// TYPE 7: Franchise Comparison
void executeType7(MYSQL *conn) {
    printf("------- TYPE 7 -------\n");
    printf("Among franchise-owned stores, which one offers the widest variety of products, and how does that compare to corporate-owned stores? \n");    

    
    char query[4096];
    sprintf(query,
        "("
            "SELECT s.store_id, s.ownership_type, s.name AS StoreName, COUNT(DISTINCT i.upc) AS product_variety "
            "FROM Store s "
            "JOIN Inventory i ON s.store_id = i.store_id "
            "WHERE s.ownership_type = 'Franchise' "
            "GROUP BY s.store_id, s.name "
            "ORDER BY product_variety DESC "
            "LIMIT 1"
        ") "
        "UNION ALL "
        "("
            "SELECT s.store_id, s.ownership_type, s.name AS StoreName, COUNT(DISTINCT i.upc) AS product_variety "
            "FROM Store s "
            "JOIN Inventory i ON s.store_id = i.store_id "
            "WHERE s.ownership_type = 'Corporate' "
            "GROUP BY s.store_id, s.name "
            "ORDER BY product_variety DESC "
            "LIMIT 1"
        ");"
    );
    executeQuery(conn, query);
}


int main() {
    MYSQL *conn = mysql_init(NULL);

    if (conn == NULL) {
        fprintf(stderr, "mysql_init() failed\n");
        return 1;
    }

    unsigned int ssl_mode = SSL_MODE_DISABLED;
    mysql_options(conn, MYSQL_OPT_SSL_MODE, &ssl_mode);


    if (mysql_real_connect(conn, server, user, password, database, 0, NULL, 0) == NULL) {
        error_exit(conn);
    }

    while (1) {
        printf("\n------------ SELECT QUERY TYPES ------------\n");
        printf("1. TYPE 1\n");
        printf("2. TYPE 2\n");
        printf("3. TYPE 3\n");
        printf("4. TYPE 4\n");
        printf("5. TYPE 5\n");
        printf("6. TYPE 6\n");
        printf("7. TYPE 7\n");
        printf("0. QUIT \n");

        printf("Select: ");

        int choice;
        scanf("%d", &choice);

        int ch;
        while ((ch = getchar()) != '\n' && ch != EOF); // 버퍼 비우기


        switch (choice) {
            case 1: executeType1(conn); break;
            case 2: executeType2(conn); break;
            case 3: executeType3(conn); break;
            case 4: executeType4(conn); break;
            case 5: executeType5(conn); break;
            case 6: executeType6(conn); break;
            case 7: executeType7(conn); break;
            case 0: 
                mysql_close(conn);
                printf("Program terminated.\n");
                return 0;
            default:
                printf("Invalid choice.\n");
        }
    }

    mysql_close(conn);
    return 0;
}
