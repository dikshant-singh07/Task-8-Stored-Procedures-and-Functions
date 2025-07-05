USE LibraryDB;

--  Create a Stored Procedure: Get all books by a specific author
DELIMITER //

CREATE PROCEDURE GetBooksByAuthor(IN authorName VARCHAR(100))
BEGIN
    SELECT b.title, b.published_year
    FROM Books b
    JOIN Book_Author ba ON b.book_id = ba.book_id
    JOIN Authors a ON ba.author_id = a.author_id
    WHERE a.name = authorName;
END //

DELIMITER ;

-- Call it:
CALL GetBooksByAuthor('George Orwell');

-- Create a Function: Calculate total loans by a member
DELIMITER //

CREATE FUNCTION GetLoanCountByMember(memberId INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE loanCount INT;
    SELECT COUNT(*) INTO loanCount
    FROM Loans
    WHERE member_id = memberId;
    RETURN loanCount;
END //

DELIMITER ;

-- Use it:
SELECT name, GetLoanCountByMember(member_id) AS total_loans
FROM Members;

-- Another Function Example: Check if a book is available (not loaned currently)
DELIMITER //

CREATE FUNCTION IsBookAvailable(bookId INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE activeLoanCount INT;
    SELECT COUNT(*) INTO activeLoanCount
    FROM Loans
    WHERE book_id = bookId AND return_date IS NULL;
    RETURN activeLoanCount = 0;
END //

DELIMITER ;

-- Use it:
SELECT title, IsBookAvailable(book_id) AS is_available
FROM Books;
