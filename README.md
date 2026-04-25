Airtel Inventory Management System
----------------------------------
Group Members
-------------

1. IRADUKUNDA Kagame Alain
2. Ntegerejimana Emmerance

Default Login:
--------------

Username: 24rp02639
password: 24rp09144

HOW TO ACCESS IT Open Browser:

http://localhost:8080/login.html

3. Configure application.properties
spring.application.name=inventory-system

spring.datasource.url=${DB_URL:jdbc:mysql://localhost:3306/inventory_db}
spring.datasource.username=${DB_USER:root}
spring.datasource.password=${DB_PASS:}
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

server.port=${PORT:8080}