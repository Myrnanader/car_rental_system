import 'dart:io';
import 'models/admin.dart';
import 'models/employee.dart';
import 'models/customer.dart';
import 'services/rental_service.dart';

void main() {
  RentalService rentalService = RentalService();



  while (true) {
    print("\n Car Rental System ");
    print("Choose your user type:");
    print("1- Admin");
    print("2- Employee");
    print("3- Customer");
    print("4- Exit");
    stdout.write("Enter your choice: ");

    String? userTypeChoice = stdin.readLineSync();

    switch (userTypeChoice) {
      case "1":
        Admin admin = Admin("Myrna2", "System Admin");
        admin.startMenu(rentalService);
        break;
      case "2":
        Employee employee = Employee("emp123", "System Employee");
        employee.startMenu(rentalService);
        break;
      case "3":
        Customer customer = Customer("cust123", "Myrn", "1234567890");
        customer.startMenu(rentalService);
        break;
      case "4":
        print("Exiting...");
        return;
      default:
        print("Invalid choice! Please enter a valid option.");
    }
  }
}
