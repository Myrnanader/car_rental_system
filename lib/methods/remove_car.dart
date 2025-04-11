import 'dart:io';
import '../models/car.dart';

void removeCar(List<Car> cars) {
  stdout.write("Enter car plate number to remove: ");
  String? plateNumber = stdin.readLineSync();

  try {
    Car carToRemove = cars.firstWhere((car) => car.plateNumber == plateNumber);
    cars.remove(carToRemove);
    print("Car removed successfully: ${carToRemove.model}");
  } catch (e) {
    print("Car not found with plate number: $plateNumber");
  }
} 