# SQL Joins & Relational Database Analysis

## Overview

This project demonstrates the use of SQL JOIN operations on the PostgreSQL DVD Rental sample database. The objective is to understand relational database design, identify relationships between normalized tables, and retrieve meaningful business information by combining data from multiple related tables.

---

# Objectives

* Understand database normalization.
* Identify Primary Keys and Foreign Keys.
* Explore one-to-one and one-to-many relationships.
* Practice SQL JOIN operations.
* Analyze business data using SQL queries.

---

# Database

**Database:** DVD Rental Sample Database (PostgreSQL)

The database contains information about:

* Customers
* Films
* Actors
* Categories
* Rentals
* Payments
* Inventory
* Stores
* Cities
* Countries

---

# Primary Keys

| Table         | Primary Key            |
| ------------- | ---------------------- |
| actor         | actor_id               |
| address       | address_id             |
| category      | category_id            |
| city          | city_id                |
| country       | country_id             |
| customer      | customer_id            |
| film          | film_id                |
| film_actor    | (actor_id, film_id)    |
| film_category | (film_id, category_id) |
| inventory     | inventory_id           |
| language      | language_id            |
| payment       | payment_id             |
| rental        | rental_id              |
| staff         | staff_id               |
| store         | store_id               |

---

# Foreign Keys

| Table         | Foreign Key(s)                      |
| ------------- | ----------------------------------- |
| address       | city_id                             |
| city          | country_id                          |
| customer      | address_id, store_id                |
| film          | language_id                         |
| film_actor    | actor_id, film_id                   |
| film_category | film_id, category_id                |
| inventory     | film_id, store_id                   |
| payment       | customer_id, rental_id, staff_id    |
| rental        | customer_id, inventory_id, staff_id |
| staff         | address_id, store_id                |
| store         | address_id, manager_staff_id        |

---

# SQL JOINs Used

## INNER JOIN

Returns only the rows that have matching values in both tables.

## LEFT JOIN

Returns all rows from the left table and the matching rows from the right table. If no match exists, `NULL` values are returned.

## RIGHT JOIN

Returns all rows from the right table and the matching rows from the left table.

## FULL OUTER JOIN

Returns all matching and non-matching rows from both joined tables.

## SELF JOIN

Joins a table with itself to compare records within the same table.

---

# Business Questions Solved

1. Display Customer Name, Email, City, and Country.
2. Display Every Payment with Customer Name, Film Title, and Amount Paid.
3. Display Every Payment with Customer Name, Film Title, and Amount Paid.
4. Find the Top 10 Customers Based on Total Amount Spent.
5. Display Each Film with Its Category and Rental Rate.
6. Find All Actors Who Appeared in Each Film.
7. Count How Many Films Belong to Each Category.
8. Determine Which Categories Generated the Highest Revenue.
9. Find Customers Who Rented More Than 20 Films.
10. Determine Which Cities Generated the Highest Rental Revenue.

---

# Bonus Challenge

Determine which actor generated the highest total rental revenue by identifying the shortest join path between the `actor` and `payment` tables.

**Join Path**

```text
Actor
   ↓
Film_Actor
   ↓
Film
   ↓
Inventory
   ↓
Rental
   ↓
Payment
```



# Technologies Used

* PostgreSQL
* pgAdmin 4
* SQL

---

# Key Concepts

* Database Normalization
* Primary Keys
* Foreign Keys
* Entity Relationships (ER)
* SQL JOIN Operations
* Aggregate Functions (`SUM`, `COUNT`)
* `GROUP BY`
* `HAVING`
* `ORDER BY`


# Author

**Mehreen Fatima**
