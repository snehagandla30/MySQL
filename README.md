# Anime Customer Support & Ticket Analysis

## About the Project

I created this project to practice SQL using a customer support dataset. The idea was to understand how customer support teams handle tickets, what issues customers report most often, and how efficiently those tickets are resolved.

I used anime characters as fictional support agents to make the dataset a little more interesting while learning.

## Tools Used

- MySQL
- SQL
- MySQL Workbench

## About the Dataset

The dataset contains 20 sample customer support tickets. Each ticket includes details such as:

- Ticket ID and creation date
- Customer segment and region
- Type of issue reported
- Support channel and priority
- Assigned support agent
- Ticket status and resolution time
- Customer rating

## What I Worked On

I wrote SQL queries to explore the data and answer some basic business questions, such as:

1. How many tickets are resolved, open, or still in progress?
2. Which customer issues are reported most frequently?
3. How many tickets has each support agent resolved?
4. Which regions receive the most support tickets?
5. What is the average customer rating for each agent?
6. Which high-priority tickets are still unresolved?
7. How much time does it take to resolve a ticket?
8. How do different support channels compare?
9. Which agents have an average customer rating below 4?

## What I Learned

While working on this project, I got hands-on practice with:

- Creating databases and tables in MySQL.
- Inserting and retrieving records.
- Filtering and sorting data.
- Grouping records using `GROUP BY`.
- Working with aggregate functions like `COUNT()`, `SUM()`, and `AVG()`.
- Using `HAVING` to filter grouped results.
- Calculating ticket resolution time using `TIMESTAMPDIFF()`.

## Project Files

```text
Anime-Customer-Support-Analysis/
│
├── database_setup.sql
├── anime_customer_support_analysis.sql
└── README.md
```

- **database_setup.sql:** Contains the database, table creation, and sample data.
- **anime_customer_support_analysis.sql:** Contains the queries used for analysis.
- **README.md:** Provides an overview of the project.

## A Small Note

This is a beginner-level SQL project built using a fictional dataset of 20 records. The main goal was to improve my understanding of SQL and learn how to use queries to explore data and answer practical questions.
