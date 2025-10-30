# CustomerInfoAPI (MuleSoft) - Beginner Project

markdown
![MuleSoft](https://img.shields.io/badge/MuleSoft-4.x-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-Completed-success)

**Project Goal**
Build a simple REST API using MuleSoft (Anypoint Studio / Mule Runtime 4.x) that:
- Accepts a customer ID via HTTP `GET` request
- Fetches customer details from a MySQL database
- Returns the details in JSON format
- Includes a POST endpoint to add new customers and basic error handling

**What you'll find in this repo**
- Mule project files (`src/main/mule/*.xml`)
- A sample `pom.xml` for Mule 4 projects
- `src/main/resources/sql/init.sql` — SQL script to create `customerdb` and insert sample rows
- `src/main/resources/db-config.properties` — DB connection properties
- `README.md` — this file

**Defaults used (as requested)**
- MySQL host: `localhost`
- MySQL port: `3306`
- Database name: `customerdb`
- DB user: `root`
- DB password: `password`

---

## Setup (local)

1. Install **Anypoint Studio** (Mule 4 compatible).
2. Install **MySQL** and start it locally.
3. Create the database and sample data:

```bash
# using mysql client
mysql -u root -p
# when prompted enter password: password

SOURCE src/main/resources/sql/init.sql;
```

Alternatively, copy & paste the contents of `src/main/resources/sql/init.sql` into your MySQL client.

4. Import the Mule project into Anypoint Studio:
- File → Import → Mule → Anypoint Studio Project from File System
- Select the folder `CustomerInfoAPI`

5. Update the DB connector if needed:
- The project uses properties from `src/main/resources/db-config.properties`.
- Defaults are set as above.

6. Run the project in Anypoint Studio (Right-click → Run As → Mule Application)

---

## API Endpoints

### GET /api/customer/{id}
Fetch customer by ID.

Example:
```
GET http://localhost:8081/api/customer/101
```

Response:
```json
{
  "customerId": 101,
  "name": "John Doe",
  "email": "john.doe@gmail.com",
  "phone": "9876543210"
}
```

If not found, response:
```json
{
  "error": "Customer not found",
  "customerId": 999
}
```

### POST /api/customer
Create a new customer (JSON body):

```json
{
  "customerId": 200,
  "name": "New User",
  "email": "new.user@example.com",
  "phone": "7000000000"
}
```

Response: `201 Created` with created customer JSON.

---
