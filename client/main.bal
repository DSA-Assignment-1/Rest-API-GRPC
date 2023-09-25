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
    
    match option {
        "1" => {
            Lecturer lecturer = {};
            lecturer.staffName = io:readln("Enter Staff Name: ");
            lecturer.staffNumber = io:readln("Enter Staff Number: ");
            lecturer.officeNumber = io:readln("Enter Staff Office Number: ");
            lecturer.courseName = io:readln("Enter Course Name: ");
            check create(lecturerClient, lecturer);
        }
        "2" => {
            Lecturer lecturer = {};
            lecturer.staffName = io:readln("Enter Staff Name: ");
            lecturer.staffNumber = io:readln("Enter Staff Number: ");
            lecturer.officeNumber = io:readln("Enter Staff Office Number: ");
            lecturer.courseName = io:readln("Enter Course Name: ");
            check update(lecturerClient, lecturer);
        }
        "3" => {
            Lecturer lecturer = {};
            lecturer.staffName = io:readln("Enter Staff Name: ");
            lecturer.staffNumber = io:readln("Enter Staff Number: ");
            lecturer.officeNumber = io:readln("Enter Staff Office Number: ");
            lecturer.courseName = io:readln("Enter Course Name: ");
            check delete(lecturerClient, lecturer);
        }
        "4" => {
            string lecturer_id = io:readln("Enter Faculty: ");
            check getByFaculty(lecturerClient, lecturer_id);
        }
        "5" => {
            string lecturer_id = io:readln("Enter Staff Number: ");
            check getByStaffNumber(lecturerClient, lecturer_id);
        }
        "6" => {
            string lecturer_id = io:readln("Enter Course: ");
            check getByCourse(lecturerClient, lecturer_id);
        }
        "7" => {
            string lecturer_id = io:readln("Enter Office Number: ");
            check getByOfficeNumber(lecturerClient, lecturer_id);
        }
         _ => {
            io:println("Invalid Key");
            check main();
        }
    }
function addLecturers() returns string {
    string name = io:readln("Enter Lecturer Name: ");
    return name;
}

public function create(http:Client http, Course course) returns error? {
    if (http is http:Client) {
        string message = check http->/createCourse.post(course);
        io:println(message);
        string exit = io:readln("Press 0 to go back");

        if (exit === "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

public function update(http:Client http, Lecturer staffRecord ) returns error? {
    // var create = check http.post("/createCourse", course);
    io:println(new_course);
}
public function create(http:Client http, Lecturer staffRecord) returns error? {
    if (http is http:Client) {
        string message = check http->/addstaffRecord.post(course);
        io:println(message);
        string exit = io:readln("Press 0 to go back");

        if (exit === "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

