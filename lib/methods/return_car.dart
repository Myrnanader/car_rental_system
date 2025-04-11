import'dart:io';
import '../models/car.dart';
import '../services/rental_service.dart';

void returnCarByUser(RentalService rentalService) {
  stdout.write("Enter car plate number to return: ");
  String? plateNumber = stdin.readLineSync();
  Car? carToReturn = rentalService.cars.firstWhere(
      (car) => car.plateNumber == plateNumber, orElse: () => Car("", "", 0));

  if (carToReturn.model.isEmpty) {
    print("Car not found.");
  } else {
    rentalService.returnCar(carToReturn);
  }
}