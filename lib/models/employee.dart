import 'dart:io';
import '../services/rental_service.dart';
import '../methods/rent_car.dart';
import '../methods/return_car.dart';
import '../methods/show_active_rentals.dart';
import '../methods/manage_customers.dart'; 
import '../methods/remove_car.dart'; 
import '../models/customer.dart';

class Employee {
  String id;
  String name;

  Employee(this.id, this.name);

  void startMenu(RentalService rentalService) {
    while (true) {
      print("\n Employee Menu ");
      print("1- Rent a Car");
      print("2- Return a Car");
      print("3- Show Active Rentals");
      print("4- Manage Customers"); 
      print("5- Remove a Car"); 
      print("6- Back to Main Menu");

      stdout.write("Enter your choice: ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          rentCarByUser(rentalService, createCustomer()); // تأجير سيارة
          break;
        case "2":
          returnCarByUser(rentalService); // إرجاع سيارة
          break;
        case "3":
          showActiveRentals(rentalService.contracts); // عرض القروض النشطة
          break;
        case "4":
          manageCustomersMenu(); // إدارة العملاء (إضافة وحذف)
          break;
        case "5":
          removeCar(rentalService.cars); // حذف سيارة
          break;
        case "6":
          return; //لرجوع للقايمة الرئيسية
        default:
          print("Invalid choice!");
      }
    }
  }

  //  ميثود لإنشاء عميل جديد بس بشكل مؤقت
  Customer createCustomer() {
    String name;
    while (true) {
      stdout.write("Enter customer's full name (at least 3 words): ");
      name = stdin.readLineSync()?.trim() ?? "";
      if (name.split(" ").length >= 3) break;
      print("Invalid name! Please enter the first, middle, and last name.");
    }

    String phone;
    while (true) {
      stdout.write("Enter customer's phone number (at least 10 digits): ");
      phone = stdin.readLineSync()?.trim() ?? "";
      if (RegExp(r'^\d{10,}$').hasMatch(phone)) break;
      print("Invalid phone number! It should be at least 10 digits.");
    }

    return Customer("cust123", name, phone);
  }

  @override
  String toString() {
    return "Employee: $name | ID: $id";
  }
}
