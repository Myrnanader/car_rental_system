import 'dart:io';
import '../services/rental_service.dart';
import '../methods/add_car.dart';
import '../methods/manage_employees.dart'; 
import '../methods/manage_customers.dart'; 
import '../methods/remove_car.dart'; 

class Admin {
  String id;
  String name;

  Admin(this.id, this.name);

  void startMenu(RentalService rentalService) {
    while (true) {
      print("\n Admin Menu ");
      print("1- Add a Car");
      print("2- Remove a Car"); 
      print("3- Manage Employees");
      print("4- Manage Customers");
      print("5- Back to Main Menu");

      stdout.write("Enter your choice: ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          addCarByAdmin(rentalService);
          break;
        case "2":
          removeCar(rentalService.cars); 
          break;
        case "3":
          manageEmployeesMenu(); 
          break;
        case "4":
          manageCustomersMenu(); 
          break;
        case "5":
          return;
        default:
          print("Invalid choice!");
      }
    }
  }

  @override
  String toString() {
    return "Admin: $name | ID: $id";
  }
}