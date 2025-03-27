import '../models/car.dart';

void addCarToList(List<Car> cars, Car car) {
  cars.add(car);
  print("car is added successfully : ${car.model}");
}

