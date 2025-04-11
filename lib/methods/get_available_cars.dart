import '../models/car.dart';

List<Car> getAvailableCarsFromList(List<Car> cars) {
  return cars.where((car) => car.isAvailable).toList();
}