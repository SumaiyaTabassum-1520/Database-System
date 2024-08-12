CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(255),
    ISBN VARCHAR2(13) UNIQUE,
    AuthorID NUMBER,
    PublisherID NUMBER,
    YearPublished NUMBER,
    Genre VARCHAR2(100),
    TotalCopies NUMBER,
    AvailableCopies NUMBER,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE Authors (
    AuthorID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(100),
    LastName VARCHAR2(100)
);

CREATE TABLE Publishers (
    PublisherID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Address VARCHAR2(255),
    ContactNumber VARCHAR2(20)
);

CREATE TABLE Members (
    MemberID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(100),
    LastName VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE,
    PhoneNumber VARCHAR2(20),
    JoinDate DATE
);

CREATE TABLE Librarians (
    LibrarianID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(100),
    LastName VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE,
    PhoneNumber VARCHAR2(20),
    EmploymentDate DATE
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    BookID NUMBER,
    MemberID NUMBER,
    IssueDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FineAmount NUMBER,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Reservations (
    ReservationID NUMBER PRIMARY KEY,
    BookID NUMBER,
    MemberID NUMBER,
    ReservationDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Books (BookID, Title, ISBN, AuthorID, PublisherID, YearPublished, Genre, TotalCopies, AvailableCopies)
VALUES (1, '1984', '9780451524935', 1, 1, 1949, 'Dystopian', 10, 10),
       (2, 'To Kill a Mockingbird', '9780060935467', 2, 2, 1960, 'Fiction', 8, 8),
       (3, 'Harry Potter and the Philosopher Stone', '9780747532743', 3, 3, 1997, 'Fantasy', 15, 15);
       (4, 'The Great Gatsby', '9780743273565', 4, 4, 1925, 'Fiction', 7, 7),
       (5, 'The Lord of the Rings', '9780544003415', 5, 5, 1954, 'Fantasy', 10, 10),
       (6, 'Pride and Prejudice', '9780679783268', 6, 6, 1813, 'Romance', 12, 12),
       (7, 'Adventures of Huckleberry Finn', '9780486280615', 7, 7, 1884, 'Adventure', 9, 9),
       (8, 'War and Peace', '9781400079988', 8, 8, 1869, 'Historical', 6, 6),
       (9, 'The Old Man and the Sea', '9780684830490', 9, 9, 1952, 'Literature', 8, 8),
       (10, 'A Tale of Two Cities', '9780141439600', 10, 10, 1859, 'Historical', 10, 10);

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (1, 'George', 'Orwell'),
       (2, 'Harper', 'Lee'),
       (3, 'J.K.', 'Rowling');
       (4, 'F. Scott', 'Fitzgerald'),
       (5, 'J.R.R.', 'Tolkien'),
       (6, 'Jane', 'Austen'),
       (7, 'Mark', 'Twain'),
       (8, 'Leo', 'Tolstoy'),
       (9, 'Ernest', 'Hemingway'),
       (10, 'Charles', 'Dickens');

INSERT INTO Publishers (PublisherID, Name, Address, ContactNumber)
VALUES (1, 'Penguin Books', '375 Hudson St, New York, NY 10014', '212-366-2000'),
       (2, 'HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000'),
       (3, 'Bloomsbury', '50 Bedford Square, London WC1B 3DP', '+44 20 7631 5600');
       (4, 'Random House', '1745 Broadway, New York, NY 10019', '212-782-9000'),
       (5, 'Houghton Mifflin Harcourt', '125 High Street, Boston, MA 02110', '617-351-5000'),
       (6, 'Oxford University Press', '198 Madison Avenue, New York, NY 10016', '212-726-6000'),
       (7, 'Macmillan Publishers', '120 Broadway, New York, NY 10271', '646-307-5151'),
       (8, 'Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000'),
       (9, 'Scholastic', '557 Broadway, New York, NY 10012', '212-343-6100'),
       (10, 'Harvard University Press', '79 Garden Street, Cambridge, MA 02138', '617-495-2600');

INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, JoinDate)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '555-1234', TO_DATE('2023-01-15', 'YYYY-MM-DD')),
       (2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', TO_DATE('2023-02-10', 'YYYY-MM-DD')),
       (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', TO_DATE('2023-03-05', 'YYYY-MM-DD'));
       (4, 'Robert', 'Wilson', 'robert.wilson@example.com', '555-2468', TO_DATE('2023-04-12', 'YYYY-MM-DD')),
       (5, 'Emily', 'Davis', 'emily.davis@example.com', '555-1357', TO_DATE('2023-05-25', 'YYYY-MM-DD')),
       (6, 'Daniel', 'Martinez', 'daniel.martinez@example.com', '555-6789', TO_DATE('2023-06-18', 'YYYY-MM-DD')),
       (7, 'Sophia', 'Anderson', 'sophia.anderson@example.com', '555-9876', TO_DATE('2023-07-05', 'YYYY-MM-DD')),
       (8, 'James', 'Taylor', 'james.taylor@example.com', '555-3214', TO_DATE('2023-08-14', 'YYYY-MM-DD')),
       (9, 'Olivia', 'Thomas', 'olivia.thomas@example.com', '555-4567', TO_DATE('2023-09-10', 'YYYY-MM-DD')),
       (10, 'William', 'Moore', 'william.moore@example.com', '555-6543', TO_DATE('2023-10-01', 'YYYY-MM-DD'));

INSERT INTO Librarians (LibrarianID, FirstName, LastName, Email, PhoneNumber, EmploymentDate)
VALUES (1, 'Emily', 'Clark', 'emily.clark@example.com', '555-4321', TO_DATE('2022-09-01', 'YYYY-MM-DD')),
       (2, 'Michael', 'Brown', 'michael.brown@example.com', '555-8769', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
       (3, 'Linda', 'Taylor', 'linda.taylor@example.com', '555-7890', TO_DATE('2023-03-10', 'YYYY-MM-DD')),
       (4, 'Kevin', 'Martinez', 'kevin.martinez@example.com', '555-0123', TO_DATE('2023-04-20', 'YYYY-MM-DD')),
       (5, 'Sarah', 'Lee', 'sarah.lee@example.com', '555-4568', TO_DATE('2023-05-30', 'YYYY-MM-DD')),
       (6, 'David', 'Clark', 'david.clark@example.com', '555-2345', TO_DATE('2023-06-25', 'YYYY-MM-DD')),
       (7, 'Karen', 'Miller', 'karen.miller@example.com', '555-9870', TO_DATE('2023-07-10', 'YYYY-MM-DD')),
       (8, 'Brian', 'Lopez', 'brian.lopez@example.com', '555-6780', TO_DATE('2023-08-15', 'YYYY-MM-DD')),
       (9, 'Megan', 'Hall', 'megan.hall@example.com', '555-3456', TO_DATE('2023-09-20', 'YYYY-MM-DD')),
       (10, 'Richard', 'Allen', 'richard.allen@example.com', '555-5432', TO_DATE('2023-10-05', 'YYYY-MM-DD'));

INSERT INTO Loans (LoanID, BookID, MemberID, IssueDate, DueDate, ReturnDate, FineAmount)
VALUES (1, 1, 1, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-15', 'YYYY-MM-DD'), NULL, NULL),
       (2, 2, 2, TO_DATE('2024-08-02', 'YYYY-MM-DD'), TO_DATE('2024-08-16', 'YYYY-MM-DD'), NULL, NULL);
       (3, 3, 3, TO_DATE('2024-08-03', 'YYYY-MM-DD'), TO_DATE('2024-08-17', 'YYYY-MM-DD'), NULL, NULL),
       (4, 4, 4, TO_DATE('2024-08-04', 'YYYY-MM-DD'), TO_DATE('2024-08-18', 'YYYY-MM-DD'), NULL, NULL),
       (5, 5, 5, TO_DATE('2024-08-05', 'YYYY-MM-DD'), TO_DATE('2024-08-19', 'YYYY-MM-DD'), NULL, NULL),
       (6, 6, 6, TO_DATE('2024-08-06', 'YYYY-MM-DD'), TO_DATE('2024-08-20', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO Reservations (ReservationID, BookID, MemberID, ReservationDate)
VALUES (1, 3, 3, TO_DATE('2024-08-03', 'YYYY-MM-DD')),
       (2, 1, 2, TO_DATE('2024-08-04', 'YYYY-MM-DD'));
