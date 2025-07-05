# Task:8 Stored Procedures and Functions

This task introduces the use of **Stored Procedures** and **Functions** in MySQL to write reusable SQL logic, pass parameters, and return values.

---

### Stored Procedure

**`GetBooksByAuthor(IN authorName)`**
- Takes an author's name as input
- Returns books written by them

### Functions

**`GetLoanCountByMember(memberId)`**
- Takes a member ID and returns total number of loans

**`IsBookAvailable(bookId)`**
- Returns `TRUE` if the book is not currently loaned (based on `return_date IS NULL`)

---


This task is a part of 30 days sql developer internship
