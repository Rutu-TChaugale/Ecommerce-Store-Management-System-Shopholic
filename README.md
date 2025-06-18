
# 🛍️ Shopolic – Ecommerce Store Management System

Shopolic is a robust Java-based ecommerce management platform built for learning and real-world application. It enables store administrators to manage products and customers to shop with ease — all in a desktop-style web experience powered by Java and Servlet-based backend.

---

## 📌 Project Overview

**Shopolic** simulates a mini online shopping system that covers both administrative control and customer-facing interfaces. The project showcases the integration of Java with database handling (via Hibernate), session management, JSP pages, and dynamic cart/order functionality.

---

## ⚙️ Tech Stack

| Layer      | Technology Used            |
| ---------- | -------------------------- |
| Backend    | Java (Servlets, JSP)       |
| ORM        | Hibernate                  |
| Build Tool | Manual / Eclipse-based     |
| Database   | MySQL                      |
| Frontend   | JSP, HTML, CSS, JavaScript |
| Server     | Apache Tomcat              |
| IDE        | Eclipse                    |

---

## 🧩 Major Modules

### 🔐 User Authentication

* Customer registration/login
* Admin login panel

### 🛒 Product Management

* Admin can **add**, **update**, **delete**, and **view** products.
* Customers can **browse**, **search**, and **view** product details.

### 🧺 Shopping Cart

* Logged-in customers can add/remove items from cart.
* Quantity adjustment, total price auto-calculated.

### 📦 Order Management

* Checkout process with order history tracking.
* Order records maintained in database.

### 👤 Admin Dashboard

* View all registered users.
* Manage orders and inventory in one place.

---

## 🗂️ Project Structure (Simplified)

```
Shopolic/
│
├── src/
│   └── main/
│       └── java/             # Java backend classes
│       └── resources/        # Hibernate config, db.properties
│
├── WebContent/
│   ├── login.jsp             # Login page
│   ├── register.jsp          # User registration
│   ├── admin.jsp             # Admin dashboard
│   ├── cart.jsp              # Cart view
│   └── css/, js/, img/       # Static assets
│
├── hibernate_jar/            # Hibernate libraries
├── build/                    # Compiled classes (output)
├── .classpath, .project      # Eclipse-specific files
```

---

## 🧰 Setup Instructions

### ✅ Prerequisites

* Java JDK 8 or higher
* Eclipse IDE (or any Java IDE)
* MySQL database
* Apache Tomcat 9+
* Hibernate libraries

### 🔧 Steps to Run

1. **Clone or Download** this repo.
2. Open the project in **Eclipse** as a Java EE Project.
3. Configure **Tomcat Server** in Eclipse.
4. Create a database in MySQL (e.g., `shopolic_db`) and import `schema.sql` (if available).
5. Set DB credentials in `hibernate.cfg.xml` and `db.properties`.
6. Add Hibernate JARs from the `hibernate_jar` folder to project build path.
7. Run the project on Tomcat.
8. Visit: `http://localhost:8080/Shopolic/`

---

## 🧑‍💻 Sample Credentials

```bash
Admin:
  Username: admin
  Password: admin123

User:
  Register yourself via register.jsp
```

## 🗃️ Entity Relationship Diagram (ERD)

```plaintext
+-----------+      +-------------+       +-----------+
|   Users   |      |   Products  |       |   Orders  |
+-----------+      +-------------+       +-----------+
| id (PK)   |      | id (PK)     |       | id (PK)   |
| name      |      | name        |       | user_id   |
| email     |      | price       |       | date      |
| password  |      | description |       | status    |
| role      |      | image       |       +-----------+
+-----------+      +-------------+
       |                  |
       |                  |
       |                  |
       |           +-------------+
       +----------<  Cart        |
                   +-------------+
                   | user_id     |
                   | product_id  |
                   | quantity    |
                   +-------------+
```

---

## 🧱 System Architecture Diagram

```plaintext
+----------------+         +---------------------+
|   Client (UI)  | <-----> |  JSP Pages (Views)  |
|  (Browser)     |         +---------------------+
+----------------+                    |
                                      v
                            +---------------------+
                            |   Servlet Controller |
                            +---------------------+
                                      |
                                      v
                           +----------------------+
                           |  Service Layer (Java) |
                           +----------------------+
                                      |
                                      v
                         +---------------------------+
                         |     Hibernate ORM Layer   |
                         +---------------------------+
                                      |
                                      v
                             +------------------+
                             |  MySQL Database  |
                             +------------------+
```


## 🧱 Database Design (Sample Tables)

* `users`: id, name, email, password, role
* `products`: id, name, price, description, image
* `cart`: user\_id, product\_id, quantity
* `orders`: order\_id, user\_id, order\_date, status

---

## 📈 Future Enhancements

* 🔐 Add password encryption for users
* 💳 Integrate payment gateways (PayPal/Stripe)
* 📧 Email notifications for order status
* 📊 Sales analytics dashboard for admins
* 🌐 Multi-language support and PWA version

---

## 🤝 Contributions

Pull requests and suggestions are welcome. For major changes, please open an issue first to discuss what you’d like to change.

---

## 📜 License

This project is for educational purposes. You may modify and use it freely.

---

## 🙋‍♀️ Developed By

**Rutika Chaugale**
💼 Passionate Java Developer | Building full-stack projects
📬 \[Add your contact or GitHub link here]

---

Let me know if you'd like to include diagrams (like ERD or architecture) or screenshots — I can generate them for you based on what’s inside.
