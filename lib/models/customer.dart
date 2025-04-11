import 'dart:io';
import '../services/rental_service.dart';
import '../methods/rent_car.dart';
import '../methods/return_car.dart'; 

class Customer {
  String id;
  String name;
  String phone;

  Customer(this.id, this.name, this.phone);

  void startMenu(RentalService rentalService) {
    while (true) {
      print("\n Customer Menu ");
      print("1- Rent a Car");
      print("2- Return a Car");
      print("3- Back to Main Menu");

      stdout.write("Enter your choice: ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          rentCarByUser(rentalService, this);
          break;
        case "2":
          returnCarByUser(rentalService); 
          break;
        case "3":
          return;
        default:
          print("Invalid choice!");
      }
    }
  }

  @override
  String toString() {
    return "Customer: $name | Phone: $phone | ID: $id";
  }
}