import ballerina/grpc;
import ballerina/io;

listener grpc:Listener ep = new (9090);


type Books record{
    string title;
    readonly string isbn;

};

type UpdateBooks record {
    readonly string isbn;
    
};
table<Book> key(isbn) bookTable = table [];
table<UpdateBook>key(isbn) updateTable=table[];
table<User>key(userId) userTable=table[];



function getBookByISBN(string s) returns Book?|() {  

    // Check if the book with the given ISBN exists in the library
        if (bookTable.hasKey(s)) {
            return bookTable[s];
        } else {
            return ();
        }
}




@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function add_book(Book value) returns Book|error {
 error? addResult = bookTable.add(value);
    if (addResult is error) {
        return addResult;
    } else {
        io:println("Book successfully added"+value.isbn);
        return value;
    }



    }
    remote function update_book(UpdateBook value) returns Book?|error {

         // Update the book details if it exists
       error? addResult = updateTable.add(value);

    if (addResult is error) {
        // If there's an error, return the error
        return addResult;
    } else {
        // If successful, return the updated book
        Book? updatedBook = bookTable[value.isbn];
        return updatedBook;
    }

    }
    remote function remove_book(RemoveBookRequest value) returns Book|error {

        if (bookTable.hasKey(value.isbn)) {
         Book removedBook = bookTable.remove(value.isbn);
        return removedBook;
    } else {
        return error("Book not found");
    }

    }
    remote function locate_book(LocateBook value) returns LocateBookResponse|error {

// Retrieve the book by ISBN using the getBookByISBN function
Book? locatedBook = getBookByISBN(value.isbn);
if (locatedBook != null) {
    // Create a response with the book's location and availability status
    LocateBookResponse response = {
        location: locatedBook.location,
        is_available: locatedBook.status};
    return response;


    }
    else{
        return error ("Book Not Found") ;
    }
    }
    remote function borrow_book(BorrowBook value) returns BorrowBookResponse|error {

 // Check if the book with the given ISBN is available
    Book? book = getBookByISBN(value.isbn);
    if (book != null && book.status) {
        // Mark the book as borrowed (update its status)
        book.status = false;
        // Return a successful response
        BorrowBookResponse response = { success: true };
        return response;
    } else {
        // Return an error response if the book is not available
        return error("Book is not available for borrowing");
    }


    }
   remote function create_users(stream<User, grpc:Error?> clientStream) returns User|error {
     while (true) {
        // Read a user from the client stream
        User|grpc:Error? userOrError = check clientStream.next();
        
        if (userOrError is User) {
            // Process the received user (you can save it to your data store here)
            User receivedUser = userOrError;

            // You can handle saving the user to your data store here
            // For now, we're just printing the received user
            io:println("Received User: " + receivedUser.toString());

        } else if (userOrError is error) {
            // Handle any errors that occur during the streaming
            return userOrError;
        } else {
            // End of stream, all users have been received
            break;
        }
    }

    // After processing all received users, you can return a response or user if needed
    User responseUser = {
        userId: "123",
        profile: "Student"
    };

    return responseUser;
}

    



    //remote function list_available_books(Empty value) returns stream<Book, error?>|error {



        // Create a new stream to send available books to the client
    //stream<Book, error?> bookStream = new;

    // Iterate over the book map and send available books to the client
   // foreach var isbn, book in bookTable{
       // if (bookStream is error) {
            // If the book is available, send it to the client
           // return io:("Failed to return book");
           // if (sendResult is error) {
                // Handle any errors that occur while sending
                //return sendResult;
         //  }
       // }
   // }

    // Close the stream to signal the end of available books
    //error?? close = bookStream.close();
   // if close is error {

   // }

   // return bookStream;

   // }
}