import'dart:io';
import '../methods/add_employee.dart';
import '../methods/remove_employee.dart';

void manageEmployeesMenu() {
  while (true) {
    print("\n Manage Employees Menu ");
    print("1- Add Employee");
    print("2- Remove Employee");
    print("3- Back");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addEmployee(); 
        break;
      case "2":
        removeEmployee(); 
        break;
      case "3":
        return;
      default:
        print("Invalid choice!");
    }
  }
}