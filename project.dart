import 'dart:io';

void main() {
  menu();
}

void headerStudents() {
  print("--------------- Student Info ----------------");
  print("ID\tName\tMajor\tMarks");
}

void menu() {
  List<Students> students = [];
  while (true) {
    print("\n===== Student Management System =====");
    print("1. Add Student");
    print("2. Search Student");
    print("3. Display All Students");
    print("4. Delete Student");
    print("5. Update Student");
    print("6. Exit");
    print("Enter your option: ");
    int? option = int.parse(stdin.readLineSync()!);
    print("=====================================");

    switch (option) {
      case 1:
        addStudent(students);
        // Call add student function
        break;
      case 2:
        searchStudent(students);

        // Call search student function
        break;
      case 3:
        print("Displaying All Students:");
        if (students.isEmpty) {
          print("No Data Found");
        } else {
          headerStudents();
          for (var st in students) {
            st.displayStudents();
          }
          print("-------------------------------------");
        }
        break;

      case 4:
        // Call delete student function
        if (students.isEmpty) {
          print("No Data Found");
        } else {
          print("Enter Student ID to delete: ");
          String idToDelete = stdin.readLineSync()!;
          bool found = false;
          for (int i = 0; i < students.length; i++) {
            if (students[i].sID.toString() == idToDelete) {
              students.removeAt(i);
              found = true;
              print("Student with ID $idToDelete deleted successfully.");
              break;
            }
          }
          if (!found) {
            print("Student with ID $idToDelete not found.");
          }
        }
        break;

      case 5:
        // Call update student function
        if (students.isEmpty) {
          print("No Data Found");
        } else {
          print("Enter Student ID to update: ");
          String idToUpdate = stdin.readLineSync()!;
          bool found = false;
          for (var st in students) {
            if (st.sID.toString() == idToUpdate) {
              print("Enter new Name: ");
              st.sName = stdin.readLineSync()!;
              print("Enter new Major: ");
              st.sMigor = stdin.readLineSync()!;
              print("Enter new Marks: ");
              st.sMarks = double.parse(stdin.readLineSync()!);
              found = true;
              print("Student with ID $idToUpdate updated successfully.");
              break;
            }
          }
          if (!found) {
            print("Student with ID $idToUpdate not found.");
          }
        }
        break;
      case 6:
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

//////////////////////////////////////
/// دالة إضافة طالب
//////////////////////////////////////
void addStudent(List<Students> students) {
  print("Enter Student ID: ");
  int id = int.parse(stdin.readLineSync()!);

  print("Enter Student Name: ");
  String name = stdin.readLineSync()!;

  print("Enter Student Major: ");
  String major = stdin.readLineSync()!;

  print("Enter Student Marks: ");
  double marks = double.parse(stdin.readLineSync()!);

  Students st = Students();
  st.addStudents(id, name, major, marks);
  students.add(st);

  print("Student Added Successfully!");
}

//////////////////////////////////////
/// دالة البحث
//////////////////////////////////////
void searchStudent(List<Students> students) {
  if (students.isEmpty) {
    print("No Data Found");
    return;
  }

  print("Choose search method:");
  print("(i) Search by ID");
  print("(n) Search by Name");
  print("(m) Search by Major");
  print("(mr) Search by Marks");

  String searchOption = stdin.readLineSync()!;

  print("Enter the value to search:");
  String word = stdin.readLineSync()!;

  bool found = false;
  headerStudents();

  for (var st in students) {
    switch (searchOption) {
      case "i":
        if (st.sID.toString() == word) {
          st.displayStudents();
          found = true;
        }
        break;

      case "n":
        if (st.sName!.toLowerCase() == word.toLowerCase()) {
          st.displayStudents();
          found = true;
        }
        break;

      case "m":
        if (st.sMigor!.toLowerCase() == word.toLowerCase()) {
          st.displayStudents();
          found = true;
        }
        break;

      case "mr":
        if (st.sMarks.toString() == word) {
          st.displayStudents();
          found = true;
        }
        break;

      default:
        print("Wrong Search Option!");
        return;
    }
    print("-------------------------------------");
  }

  if (!found) {
    print("Data not found.");
  }
}

//////////////////////////////////////////////////
/// كلاس الطلاب
//////////////////////////////////////////////////
class Students {
  int? sID;
  String? sName;
  String? sMigor;
  double? sMarks;

  void addStudents(int id, String name, String migor, double marks) {
    this.sID = id;
    this.sName = name;
    this.sMigor = migor;
    this.sMarks = marks;
  }

  void deleteStudents() {
    sID = null;
    sName = null;
    sMigor = null;
    sMarks = null;
  }

  searchByID() {
    return sID;
  }

  searchByName() {
    return sName;
  }

  searchByMigor() {
    return sMigor;
  }

  searchByMarks() {
    return sMarks;
  }

  void displayStudents() {
    print(
      sID.toString() +
          "\t" +
          sName! +
          "\t" +
          sMigor! +
          "\t" +
          sMarks.toString(),
    );
  }
}
