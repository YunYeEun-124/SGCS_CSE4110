# 📘 Database System  
**데이터베이스시스템 (CSE4110)**  
**2025년 1학기**

---

## 🏪 Projects for Convenience Store Database System

| Week      | Contents                                      |
|-----------|-----------------------------------------------|
| Project 1 | E-R Design & Relational Schema Design         |
| Project 2 | Normalization & Query Processing              |

---

## ✨ Description in the Context of a Convenience Store

| Week      | Contents                                                                                      |
|-----------|-----------------------------------------------------------------------------------------------|
| Project 1 | Design an **E-R diagram** and **relational schema** for a convenience store. Entities may include stores, employees, customers, products, and sales. Define relationships such as “a store sells products” or “an employee manages sales.” |
| Project 2 | Normalize the relational schema (up to **3NF or BCNF**) to remove redundancy. Implement **SQL queries** to retrieve data like “total sales by product,” “inventory per store,” or “employees working at each branch.” |

---

## ⚙️ Development Environment

- **OS**: Windows 11  
- **Compiler**: gcc (MinGW)  
- **Editor**: VSCode  
- **DBMS**: MySQL 8.0  
- **MySQL Connector/C**: mysql-connector-c-6.1.11-winx64  
- **Dynamic Library**: `libmysql.dll`  

---

## 📌 Build Instructions

1. Create the `store` database in MySQL  
2. Create necessary tables and insert sample data  
3. Run the following build command:

   ```bash
   gcc -fdiagnostics-color=always -g ^
   -I C:/mysql-connector-c-6.1.11-winx64/include ^
   -L C:/mysql-connector-c-6.1.11-winx64/lib ^
   main.c -lmysql -o main.exe
