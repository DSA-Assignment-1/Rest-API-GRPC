import ballerina/io;
import ballerina/http;

type Lecturer record {
    string staffNumber;
    string officeNumber;
    string staffName;
    string courseName;
};

public function main() returns error? {
    http:Client lecturerClient = check new ("localhost:9090/lecturers");

    io:println("1. Add Lecturer");
    io:println("2. Update Lecturer record");
    io:println("3. Delete Lecturer record by staff Number");
    io:println("4. View All Lecturer records");
    io:println("5. View Lecturer record by staff number");
    io:println("6. View Lecturer record by course");
    io:println("7. View Lecturer record by office number");
    string options = io:readln("Choose an option: ");

     match options {
         
        "1" => {
            Lecturer staffRecord = {courseName: "", officeNumber: "", staffName: "", staffNumber: ""};
            staffRecord.staffName = io:readln("Enter name of the lecturer to be added: ");
            staffRecord.staffNumber = io:readln("Enter "+<string>staffRecord.staffName+" 's staff number: ");
            staffRecord.officeNumber=io:readln("Enter "+<string>staffRecord.staffName+" 's office number: ");
            staffRecord.courseName=io:readln("Enter "+<string>staffRecord.staffName+" 's new courseName: ");
            check addstaffRecord(lecturerClient, staffRecord);
        }
        "2" => {
            Lecturer staffRecord= {courseName: "", officeNumber: "", staffName: "", staffNumber: ""};
            staffRecord.staffName = io:readln("Enter name of the lecturer to be updated: ");
            staffRecord.staffNumber = io:readln("Enter "+<string>staffRecord.staffName+" 's  staff number: ");
            staffRecord.officeNumber=io:readln("Enter "+<string>staffRecord.staffName+" 's new office number: ");
            staffRecord.courseName=io:readln("Enter "+<string>staffRecord.staffName+" 's new courseName: ");
            check updatestaffRecord(lecturerClient, staffRecord);
        }
        "3" => {
            string staffNumber = io:readln("Enter Staff Number for record to be deleted: ");
            check deletebystaffNumber(lecturerClient, staffNumber);
        }
        "4" => {
            check getstaffRecord(lecturerClient);
        }
        "5" => {
            string staffNumber = io:readln("Enter Office number: ");
            check getBystaffNumber(lecturerClient, staffNumber);
        }
        "6" => {
            string courseName = io:readln("Enter course Name");
            check getBycourseName(lecturerClient, courseName);
        }
        "7" => {
            string officeNumber = io:readln("Enter Staff Number");
            check getByofficeNumber(lecturerClient, officeNumber);
        }
        _ => {
            io:println("Invalid Key");
            check main();
        }
    }
}

public function addstaffRecord(http:Client http, Lecturer addstaffRecord) returns error? {
    if (http is http:Client) {
        string resp = check http->/addstaffRecord.post(addstaffRecord);
        io:println(resp);
        string exitSys = io:readln("Press 0 to go back");

        if (exitSys === "0") {
            error? rerun = main();
            if rerun is error {
                io:println("You can't go back to options page.");
            }
        }
    }
}

public function updatestaffRecord(http:Client http, Lecturer updatestaffRecord) returns error? {
     if (http is http:Client) {
        string resp = check http->/updatestaffRecord.put(updatestaffRecord);
        io:println(resp);
        string exitSys = io:readln("Press 0 to go back");

        if (exitSys === "0") {
            error? rerun = main();
            if rerun is error {
                io:println("You can't go back to options page.");
            }
        }
    }
    io:println(updatestaffRecord);
}

public function deletebystaffNumber(http:Client http, string staffNumber) returns error? {
    if (http is http:Client) {
        string message = check http->/deletebystaffNumber.delete(staffNumber=staffNumber);
        io:println(message);
        io:println("--------------------------");
        string exitSys = io:readln("Press 0 to go back");
        if (exitSys == "0") {
            error? rerun = main();
            if rerun is error {
                io:println(", You can't go back.");
            }
        }
    }
}

public function getstaffRecord(http:Client http) returns error? {
    if (http is http:Client) {
        Lecturer[] lecturer = check http->/getstaffRecord;
        foreach Lecturer staffRecord in lecturer{
            io:println("--------------------------");
            io:println("Staff Number: ", staffRecord.staffNumber);
            io:println("Staff Name: ", staffRecord.staffName);
            io:println("Office Number: ", staffRecord.officeNumber);
            io:println("Courses Name: ", staffRecord.courseName);
        }

        io:println("--------------------------");
        string exitSys = io:readln("Press 0 to go back");

        if (exitSys == "0") {
            error? rerun = main();
            if rerun is error {
                io:println("You can't go back.");
            }
        }
    }
}

public function getByofficeNumber(http:Client http, string officeNumber) returns error? {
    if (http is http:Client) {
        Lecturer staffRecord = check http->/getLecturerByofficeNumber(officeNumber = officeNumber);
            io:println("--------------------------");
            io:println("Staff Number: ", staffRecord.staffNumber);
            io:println("Staff Name: ", staffRecord.staffName);
            io:println("Office Number: ", staffRecord.officeNumber);
            io:println("Courses Name: ", staffRecord.courseName);

        io:println("--------------------------");
        string exitSys = io:readln("Press 0 to go back");

        if (exitSys == "0") {
            error? rerun = main();
            if rerun is error {
                io:println("You can't go back.");
            }
        }
    }
}

public function getBystaffNumber(http:Client http, string staffNumber) returns error? {
    if (http is http:Client) {
        Lecturer staffRecord = check http->/getLecturerBystaffNumber(staffNumber = staffNumber);
            io:println("--------------------------");
            io:println("Staff Number: ", staffRecord.staffNumber);
            io:println("Staff Name: ", staffRecord.staffName);
            io:println("Office Number: ", staffRecord.officeNumber);
            io:println("Courses Name: ", staffRecord.courseName);

        io:println("--------------------------");
        string exitSys = io:readln("Press 0 to go back");

        if (exitSys == "0") {
            error? rerun = main();
            if rerun is error {
                io:println("You can't go back.");
            }
        }
    }
}

public function getBycourseName(http:Client http, string courseName) returns error? {
    if (http is http:Client) {
        Lecturer staffRecord = check http->/getLecturerBycourseName(courseName = courseName);
            io:println("--------------------------");
            io:println("Staff Number: ", staffRecord.staffNumber);
            io:println("Staff Name: ", staffRecord.staffName);
            io:println("Office Number: ", staffRecord.officeNumber);
            io:println("Courses Name: ", staffRecord.courseName);

        io:println("--------------------------");
        string exitSys = io:readln("Press 0 to go back");

        if (exitSys == "0") {
            error? rerun = main();
            if rerun is error {
                io:println("You can't go back.");
            }
        }
    }
}