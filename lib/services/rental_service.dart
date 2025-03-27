import '../models/car.dart';
import '../models/rental_contract.dart';
import '../models/customer.dart';

import '../methods/add_car.dart';
import '../methods/get_available_cars.dart';
import '../methods/rent_car.dart';
import '../methods/return_car.dart';
import '../methods/show_active_rentals.dart';

class RentalService {
  List<Car> cars = [];
  List<RentalContract> contracts = [];

  void addCar(Car car) {
    addCarToList(cars, car);
  }

  List<Car> getAvailableCars() {
    return getAvailableCarsFromList(cars);
  }

  void rentCar(Customer customer, Car car, int days, String paymentMethod) {
    rentCarForCustomer(contracts, customer, car, days, paymentMethod);
  }

  void returnCar(Car car) {
    returnCarToService(contracts, car);
  }

  void showActiveRentals() {
    showActiveRentalsList(contracts);
  }
}
