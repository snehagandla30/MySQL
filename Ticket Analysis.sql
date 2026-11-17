
-- ============================================================
-- PROJECT: ANIME CUSTOMER SUPPORT & TICKET ANALYSIS
-- DATABASE: CustomerSupportDB
-- TOOL: MySQL Workbench
-- DATASET: 20 Synthetic Customer Support Records
-- ============================================================



-- ============================================================
-- PART 1: DATABASE CREATION
-- Create a database for customer support analysis
-- ============================================================

CREATE DATABASE CustomerSupportDB;

USE CustomerSupportDB;



-- ============================================================
-- PART 2: TABLE CREATION
-- Create a table to store customer support ticket information
-- ============================================================

CREATE TABLE support_tickets (
    ticket_id VARCHAR(10) PRIMARY KEY,
    created_at DATETIME,
    customer_segment VARCHAR(30),
    region VARCHAR(20),
    issue_type VARCHAR(50),
    channel VARCHAR(20),
    priority VARCHAR(15),
    assigned_agent VARCHAR(30),
    status VARCHAR(20),
    resolved_at DATETIME,
    customer_rating INT
);



-- ============================================================
-- PART 3: DATA INSERTION
-- Insert 20 synthetic customer support records
-- Anime characters are used as support agents
-- ============================================================

INSERT INTO support_tickets
(ticket_id, created_at, customer_segment, region, issue_type,
 channel, priority, assigned_agent, status, resolved_at, customer_rating)
VALUES

('T001','2026-01-01 09:00:00','Retail','South','Payment Issue','Email','High','Levi Ackerman','Resolved','2026-01-01 11:00:00',5),

('T002','2026-01-01 10:30:00','Corporate','North','Login Issue','Phone','Medium','L Lawliet','Resolved','2026-01-01 13:30:00',4),

('T003','2026-01-02 08:45:00','Retail','East','Delivery Delay','Chat','High','Mikasa Ackerman','Open',NULL,NULL),

('T004','2026-01-02 12:00:00','Small Business','West','Refund','Email','Low','Light Yagami','Resolved','2026-01-03 10:00:00',3),

('T005','2026-01-03 09:15:00','Corporate','South','Payment Issue','Phone','High','Eren Yeager','In Progress',NULL,NULL),

('T006','2026-01-03 11:00:00','Retail','North','Login Issue','Chat','Medium','Armin Arlert','Resolved','2026-01-03 12:00:00',5),

('T007','2026-01-04 14:00:00','Small Business','East','Technical Error','Email','High','Gojo Satoru','Resolved','2026-01-04 17:00:00',4),

('T008','2026-01-04 16:30:00','Retail','West','Delivery Delay','Phone','Low','Killua Zoldyck','Open',NULL,NULL),

('T009','2026-01-05 10:00:00','Corporate','South','Refund','Chat','Medium','Itachi Uchiha','Resolved','2026-01-05 14:00:00',5),

('T010','2026-01-05 13:00:00','Retail','North','Payment Issue','Email','High','Erwin Smith','Resolved','2026-01-05 16:00:00',3),

('T011','2026-01-06 09:30:00','Corporate','East','Account Access','Phone','Low','Levi Ackerman','Resolved','2026-01-06 10:30:00',4),

('T012','2026-01-06 11:15:00','Retail','South','Technical Error','Chat','High','L Lawliet','In Progress',NULL,NULL),

('T013','2026-01-07 08:00:00','Small Business','West','Refund','Email','Medium','Mikasa Ackerman','Resolved','2026-01-07 12:00:00',2),

('T014','2026-01-07 15:00:00','Corporate','North','Login Issue','Phone','High','Light Yagami','Resolved','2026-01-07 17:00:00',5),

('T015','2026-01-08 10:45:00','Retail','Central','Delivery Delay','Chat','Low','Eren Yeager','Open',NULL,NULL),

('T016','2026-01-08 12:30:00','Small Business','South','Payment Issue','Email','Medium','Armin Arlert','Resolved','2026-01-08 15:30:00',4),

('T017','2026-01-09 09:00:00','Corporate','West','Account Access','Phone','Low','Gojo Satoru','Resolved','2026-01-09 10:00:00',5),

('T018','2026-01-09 14:00:00','Retail','East','Technical Error','Chat','High','Killua Zoldyck','In Progress',NULL,NULL),

('T019','2026-01-10 11:00:00','Small Business','Central','Refund','Email','Medium','Itachi Uchiha','Resolved','2026-01-10 16:00:00',3),

('T020','2026-01-10 16:00:00','Corporate','South','Login Issue','Phone','High','Erwin Smith','Resolved','2026-01-10 18:00:00',4);



-- ============================================================
-- PART 4: DATA VERIFICATION
-- View all records and check the total number of tickets
-- ============================================================

-- Display all customer support records

SELECT *
FROM support_tickets;


-- Count the total number of records

SELECT COUNT(*) AS total_records
FROM support_tickets;



-- ============================================================
-- PART 5: SQL DATA ANALYSIS
-- ============================================================


-- 1. TICKET STATUS OVERVIEW
-- Objective: Count tickets based on their current status
-- Concepts: COUNT(), GROUP BY, ORDER BY

SELECT
    status,
    COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY status
ORDER BY total_tickets DESC;



-- 2. MOST COMMON CUSTOMER ISSUES
-- Objective: Identify the most frequently reported issue types
-- Concepts: COUNT(), GROUP BY, ORDER BY

SELECT
    issue_type,
    COUNT(*) AS issue_count
FROM support_tickets
GROUP BY issue_type
ORDER BY issue_count DESC;



-- 3. SUPPORT AGENT PERFORMANCE
-- Objective: Find the number of resolved tickets handled by each agent
-- Concepts: WHERE, COUNT(), GROUP BY, ORDER BY

SELECT
    assigned_agent,
    COUNT(*) AS resolved_tickets
FROM support_tickets
WHERE status = 'Resolved'
GROUP BY assigned_agent
ORDER BY resolved_tickets DESC;



-- 4. REGIONAL TICKET ANALYSIS
-- Objective: Identify regions with the highest number of support tickets
-- Concepts: COUNT(), GROUP BY, ORDER BY

SELECT
    region,
    COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY region
ORDER BY total_tickets DESC;



-- 5. CUSTOMER SATISFACTION ANALYSIS
-- Objective: Calculate the average customer rating for each support agent
-- Concepts: AVG(), ROUND(), WHERE, GROUP BY

SELECT
    assigned_agent,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM support_tickets
WHERE status = 'Resolved'
GROUP BY assigned_agent
ORDER BY average_rating DESC;



-- 6. HIGH-PRIORITY UNRESOLVED TICKETS
-- Objective: Identify urgent tickets that still need attention
-- Concepts: WHERE, AND, IN

SELECT
    ticket_id,
    issue_type,
    assigned_agent,
    region
FROM support_tickets
WHERE priority = 'High'
AND status IN ('Open', 'In Progress');



-- 7. TICKET RESOLUTION TIME
-- Objective: Calculate how long each resolved ticket took in minutes
-- Concepts: TIMESTAMPDIFF(), WHERE, AS

SELECT
    ticket_id,
    assigned_agent,
    TIMESTAMPDIFF(MINUTE, created_at, resolved_at)
        AS resolution_minutes
FROM support_tickets
WHERE status = 'Resolved';



-- 8. OVERALL SUPPORT PERFORMANCE
-- Objective: Calculate total tickets, ticket statuses and average rating
-- Concepts: COUNT(), SUM(), AVG(), ROUND()

SELECT
    COUNT(*) AS total_tickets,
    SUM(status = 'Resolved') AS resolved_tickets,
    SUM(status = 'Open') AS open_tickets,
    SUM(status = 'In Progress') AS in_progress_tickets,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM support_tickets;



-- 9. CHANNEL-WISE TICKET ANALYSIS
-- Objective: Compare ticket volume across different support channels
-- Concepts: COUNT(), SUM(), GROUP BY, ORDER BY

SELECT
    channel,
    COUNT(*) AS total_tickets,
    SUM(status = 'Resolved') AS resolved_tickets
FROM support_tickets
GROUP BY channel
ORDER BY total_tickets DESC;



-- 10. AGENTS WITH LOW CUSTOMER RATINGS
-- Objective: Identify agents with an average rating below 4
-- Concepts: AVG(), ROUND(), WHERE, GROUP BY, HAVING

SELECT
    assigned_agent,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM support_tickets
WHERE status = 'Resolved'
GROUP BY assigned_agent
HAVING AVG(customer_rating) < 4
ORDER BY average_rating ASC;



-- ============================================================
-- END OF ANIME CUSTOMER SUPPORT ANALYSIS PROJECT
-- ============================================================
