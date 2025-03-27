import 'dart:io';
import 'models/car.dart';
import 'models/customer.dart';
//import 'models/rental_contract.dart';
//import 'models/payment.dart';
import 'services/rental_service.dart';

void main() {
  RentalService rentalService = RentalService();

  
  rentalService.addCar(Car("Toyota ", "ABC-123", 50));
  rentalService.addCar(Car("Honda ", "XYZ-789", 60));

  while (true) {
    print("\n Car Rental System ");
    print("1- View Available Cars");
    print("2- Rent a Car");
    print("3- Return a Car");
    print("4- Show Active Rentals");
    print("5- Exit");
    stdout.write("Choose an option: ");
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        var availableCars = rentalService.getAvailableCars();
        if (availableCars.isEmpty) {
          print("No available cars at the moment");
        } else {
          print("Available Cars:");
          availableCars.forEach(print);
        }
        break;

      case "2":
        String name;
        while (true) {
          stdout.write("Enter your full name (at least 3 words): ");
          name = stdin.readLineSync()?.trim() ?? "";
          if (name.split(" ").length >= 3) break;
          print(" invalid name! Please enter your first name, middle name, and last name");
        }

        String phone;
        while (true) {
          stdout.write("Enter your phone number (at least 10 digits): ");
          phone = stdin.readLineSync()?.trim() ?? "";
          if (RegExp(r'^\d{10,}$').hasMatch(phone)) break;
          print("invalid phone number! It should be at least 10 digits");
        }

        Customer customer = Customer(name, phone);

        var availableCars = rentalService.getAvailableCars();
        if (availableCars.isEmpty) {
          print("No cars available for rent at the moment");
          break;
        }

        print("Choose a car to rent:");
        for (int i = 0; i < availableCars.length; i++) {
          print("${i + 1}. ${availableCars[i]}");
        }

        stdout.write("Enter car number: ");
        int carIndex = int.parse(stdin.readLineSync()!) - 1;
        Car selectedCar = availableCars[carIndex];

        stdout.write("Enter rental days: ");
        int days = int.parse(stdin.readLineSync()!);

        stdout.write("Enter payment method (Cash/Card): ");
        String? paymentMethod = stdin.readLineSync();

        rentalService.rentCar(customer, selectedCar, days, paymentMethod ?? "Cash");
        break;

      case "3":
        stdout.write("Enter car plate number to return: ");
        String? plateNumber = stdin.readLineSync();
        Car? carToReturn = rentalService.cars.firstWhere(
            (car) => car.plateNumber == plateNumber, orElse: () => Car("", "", 0));
        
        if (carToReturn.model.isEmpty) {
          print("Car not found.");
        } else {
          rentalService.returnCar(carToReturn);
        }
        break;

      case "4":
        rentalService.showActiveRentals();
        break;

      case "5":
        print("Exiting... ");
        return;

      default:
        print("Invalid choice! Please enter a valid option");
    }
  }
}
