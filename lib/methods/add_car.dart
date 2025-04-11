import 'dart:io';
import '../models/car.dart';
import '../services/rental_service.dart';

void addCarByAdmin(RentalService rentalService) {
  stdout.write("Enter car model: ");
  String model = stdin.readLineSync() ?? "";

  stdout.write("Enter car plate number: ");
  String plateNumber = stdin.readLineSync() ?? "";

  stdout.write("Enter rental price per day: ");
  double rentalPrice = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

  
  if (rentalPrice <= 0) {
    print("Invalid rental price! Please enter a positive value.");
    return;
  }

  Car newCar = Car(model, plateNumber, rentalPrice);
  rentalService.addCar(newCar);
  print("Car added successfully by Admin: ${newCar.model}");
}