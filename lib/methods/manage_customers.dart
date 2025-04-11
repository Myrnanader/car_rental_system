import'dart:io';
import '../methods/add_customer.dart';
import '../methods/remove_customer.dart';

void manageCustomersMenu() {
  while (true) {
    print("\n Manage Customers Menu ");
    print("1- Add Customer");
    print("2- Remove Customer");
    print("3- Back");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addCustomer(); 
        break;
      case "2":
        removeCustomer(); 
        break;
      case "3":
        return;
      default:
        print("Invalid choice!");
    }
  }
}