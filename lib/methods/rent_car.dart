import 'dart:io';
import '../models/customer.dart';
import '../models/car.dart';
import '../services/rental_service.dart';

void rentCarByUser(RentalService rentalService, Customer customer) {
  var availableCars = rentalService.getAvailableCars();
  if (availableCars.isEmpty) {
    print("No cars available for rent at the moment");
    return;
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

  
  stdout.write("Enter customer name: ");
  String customerName = stdin.readLineSync()?.trim() ?? "Unknown Customer";

  
  customer.name = customerName;

  
  rentalService.rentCar(customer, selectedCar, days, paymentMethod ?? "Cash");
}