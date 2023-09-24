import ballerina/io;
import ballerina/http;

type Lecturer readonly & record {
    int staffNumber;
    int officeNumber;
    string staffName;
    string courseName;
};

public function main() returns error? {
    http:Client lecturerClient = check new ("localhost:9090/lecturers");

    io:println("1. Add Lecturer");
    io:println("2. Update Lecturer record");
    io:println("3. Delete Lecturer record");
    io:println("4. View All Lecturer records");
    io:println("5. View Lecturer record by staff number ");
    io:println("6. View Lecturer record by course");
    io:println("7. View Lecturer record by office number");
    string option = io:readln("Choose an option: ");

    Lecturer lect = check lecturerClient->/addstaffRecord.post({staffNumber:1, officeNumber:200, staffName:"Ryan Manunure",courseName:"Introduction To Computing"});
     io:println(" \n The post request successful :", lect.toJsonString(), "record added");
     Lecturer[]all_lect= check lecturerClient->get("/getstaffRecord");
     io:println("\n Response from the server",all_lect.toJsonString());
     Lecturer []Delete = check lecturerClient->/deletebystaffNumber/[1].delete();
     io:println(string `Deleted employee record: ${Delete.toString()}`);
}
