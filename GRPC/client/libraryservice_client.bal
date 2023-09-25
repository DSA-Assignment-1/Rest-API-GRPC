import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
addbook();
updatebook();
removebook();
locatebook();
borrowbook();
listofbooks();
createuser();
}
    function  addbook(){

string userTitle= io:readln("Enter  title");
  string author_1= io:readln("Enter  author");
   string author_2= io:readln("Enter  author_2");
    string location= io:readln("Enter  location");
     string isbn= io:readln("Enter  isbn");
      string status= io:readln("Enter  status:(True/False)");


      


 Book add_bookRequest = {

        title: userTitle,
         author_1: author_1, 
         author_2: author_2, 
         location: location,
          isbn: isbn, 
          status: true};
    Book add_bookResponse = check ep->add_book(add_bookRequest);
    io:println(add_bookResponse);
    }
    function updatebook(){
        
 string usertitle= io:readln("Enter  title");
  string author_1= io:readln("Enter  author");
   string author_2= io:readln("Enter  author_2");
    string location= io:readln("Enter  location");
     string isbn= io:readln("Enter  isbn");
      string status= io:readln("Enter  status:(True/False)");
        
        UpdateBook update_bookRequest = {isbn: "",
         updatedBook: {title: "My Journey",
          author_1: "Mac Kliffer",
           author_2: "Mary Tomon",
            location: "Section C:Shelf 3",
             isbn: "ballerina", 
             status: true}};
    Book update_bookResponse = check ep->update_book(update_bookRequest);
    io:println(update_bookResponse);
    }
    function removebook(){RemoveBookRequest remove_bookRequest = {isbn: "4422-96966-88"};
    Book remove_bookResponse = check ep->remove_book(remove_bookRequest);
    io:println(remove_bookResponse);
    }
    function locatebook(){LocateBook locate_bookRequest = {isbn: "4422-96966-88"};
    LocateBookResponse locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);
    }

    function borrowbook(){BorrowBook borrow_bookRequest = {userId: "236", isbn: "4422-96966-88"};
    BorrowBookResponse borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    io:println(borrow_bookResponse);
    }
   
function listofbooks() returns error? {
    var list_available_booksRequest = <Empty>{};
    stream<Book, error?> list_available_booksResponse = check ep->list_available_books(list_available_booksRequest);
    check list_available_booksResponse.forEach(function (Book value) {
        io:println(value);
    });
}
 

    
   function createuser(){
    string userid= io:readln("Enter  user id");
    string useriprofile= io:readln("Enter  user profile");

    User create_usersRequest = {userId: userid, profile: useriprofile};
    

    Create_usersStreamingClient create_usersStreamingClient = check ep->create_users();
    check create_usersStreamingClient->sendUser(create_usersRequest);
    check create_usersStreamingClient->complete();
    User? create_usersResponse = check create_usersStreamingClient->receiveUser();
    io:println(create_usersResponse);

   }




