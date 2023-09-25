import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C696272617279229A010A04426F6F6B12140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F7232121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280952046973626E12160A06737461747573180620012808520673746174757322380A045573657212160A06757365724964180120012809520675736572496412180A0770726F66696C65180220012809520770726F66696C6522510A0A557064617465426F6F6B12120A046973626E18012001280952046973626E122F0A0B75706461746564426F6F6B18022001280B320D2E6C6962726172792E426F6F6B520B75706461746564426F6F6B22270A1152656D6F7665426F6F6B5265717565737412120A046973626E18012001280952046973626E22070A05456D70747922200A0A4C6F63617465426F6F6B12120A046973626E18012001280952046973626E22530A124C6F63617465426F6F6B526573706F6E7365121A0A086C6F636174696F6E18012001280952086C6F636174696F6E12210A0C69735F617661696C61626C65180220012808520B6973417661696C61626C6522380A0A426F72726F77426F6F6B12160A06757365724964180120012809520675736572496412120A046973626E18022001280952046973626E222E0A12426F72726F77426F6F6B526573706F6E736512180A07737563636573731801200128085207737563636573733292030A0E4C6962726172795365727669636512280A086164645F626F6F6B120D2E6C6962726172792E426F6F6B1A0D2E6C6962726172792E426F6F6B122E0A0C6372656174655F7573657273120D2E6C6962726172792E557365721A0D2E6C6962726172792E55736572280112310A0B7570646174655F626F6F6B12132E6C6962726172792E557064617465426F6F6B1A0D2E6C6962726172792E426F6F6B12380A0B72656D6F76655F626F6F6B121A2E6C6962726172792E52656D6F7665426F6F6B526571756573741A0D2E6C6962726172792E426F6F6B12370A146C6973745F617661696C61626C655F626F6F6B73120E2E6C6962726172792E456D7074791A0D2E6C6962726172792E426F6F6B3001123F0A0B6C6F636174655F626F6F6B12132E6C6962726172792E4C6F63617465426F6F6B1A1B2E6C6962726172792E4C6F63617465426F6F6B526573706F6E7365123F0A0B626F72726F775F626F6F6B12132E6C6962726172792E426F72726F77426F6F6B1A1B2E6C6962726172792E426F72726F77426F6F6B526573706F6E7365620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function add_book(Book|ContextBook req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/add_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function add_bookContext(Book|ContextBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/add_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function update_book(UpdateBook|ContextUpdateBook req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBook message;
        if req is ContextUpdateBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/update_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function update_bookContext(UpdateBook|ContextUpdateBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBook message;
        if req is ContextUpdateBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/update_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function remove_book(RemoveBookRequest|ContextRemoveBookRequest req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function remove_bookContext(RemoveBookRequest|ContextRemoveBookRequest req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function locate_book(LocateBook|ContextLocateBook req) returns LocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBook message;
        if req is ContextLocateBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <LocateBookResponse>result;
    }

    isolated remote function locate_bookContext(LocateBook|ContextLocateBook req) returns ContextLocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBook message;
        if req is ContextLocateBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <LocateBookResponse>result, headers: respHeaders};
    }

    isolated remote function borrow_book(BorrowBook|ContextBorrowBook req) returns BorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBook message;
        if req is ContextBorrowBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BorrowBookResponse>result;
    }

    isolated remote function borrow_bookContext(BorrowBook|ContextBorrowBook req) returns ContextBorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBook message;
        if req is ContextBorrowBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BorrowBookResponse>result, headers: respHeaders};
    }

    isolated remote function create_users() returns Create_usersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("library.LibraryService/create_users");
        return new Create_usersStreamingClient(sClient);
    }

    isolated remote function list_available_books(Empty|ContextEmpty req) returns stream<Book, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.LibraryService/list_available_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookStream outputStream = new BookStream(result);
        return new stream<Book, grpc:Error?>(outputStream);
    }

    isolated remote function list_available_booksContext(Empty|ContextEmpty req) returns ContextBookStream|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.LibraryService/list_available_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookStream outputStream = new BookStream(result);
        return {content: new stream<Book, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public client class Create_usersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUser() returns User|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <User>payload;
        }
    }

    isolated remote function receiveContextUser() returns ContextUser|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <User>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class BookStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|Book value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|Book value;|} nextRecord = {value: <Book>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextBookStream record {|
    stream<Book, error?> content;
    map<string|string[]> headers;
|};

public type ContextLocateBook record {|
    LocateBook content;
    map<string|string[]> headers;
|};

public type ContextBorrowBook record {|
    BorrowBook content;
    map<string|string[]> headers;
|};

public type ContextLocateBookResponse record {|
    LocateBookResponse content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextUpdateBook record {|
    UpdateBook content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookRequest record {|
    RemoveBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookResponse record {|
    BorrowBookResponse content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    Book content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBook record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBook record {|
    string userId = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookResponse record {|
    string location = "";
    boolean is_available = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type User record {|
    string userId = "";
    string profile = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UpdateBook record {|
    string isbn = "";
    Book updatedBook = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookResponse record {|
    boolean success = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Book record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    string isbn = "";
    boolean status = false;
|};

