import ballerina/http;
import ballerina/io;

type Lecturer readonly & record {
    int staffNumber;
    int officeNumber;
    string staffName;
    string courseName;
};

table<Lecturer> key(staffNumber) staffRecordTable = table [
{staffName: "Grace", staffNumber: 23445, courseName: "Intro to Computing",officeNumber: 1}
];

service /lecturers on new http:Listener(9090) {
 resource function post addstaffRecord( Lecturer staffRecord) returns Lecturer {
        staffRecordTable.add(staffRecord);
        return staffRecord;
};

resource function put updatestaffRecord( Lecturer staffRecord) returns string {
        io:println(staffRecord);
        error? err = staffRecordTable.put(staffRecord);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${staffRecord.staffName} saved successfully`;
};
resource function get getstaffRecord() returns Lecturer[] {
        return staffRecordTable.toArray();
    }
    resource function get getLecturerBystaffNumber/[int staffNumber]() returns Lecturer|string {
        foreach Lecturer staffRecord in staffRecordTable  {
            if (staffRecord.staffNumber === staffNumber) {
                return staffRecord;
            }
        }
        return "Invalid staff number";
    }

    resource function get getLecturerBycourseName/[string courseName]() returns Lecturer|string {
        foreach Lecturer staffRecord in staffRecordTable  {
            if (staffRecord.courseName === courseName) {
                return staffRecord;
            }
        }
        return "Course doesn't exist";
    }
    resource function get getLecturerByofficeNumber/[int officeNumber]() returns Lecturer|string {
        foreach Lecturer staffRecord in staffRecordTable  {
            if (staffRecord.officeNumber === officeNumber) {
                return staffRecord;
            }
        }
        return "Invalid office number";
    }
    resource function delete deletebystaffNumber/[int staffNumber]() returns string|Lecturer[]{
        _ = staffRecordTable.remove(staffNumber);
            return staffRecordTable.toArray(); 
}
}