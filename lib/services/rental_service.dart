import '../models/car.dart';
import '../models/rental_contract.dart';
import '../models/customer.dart';
import '../models/payment.dart';


import '../methods/get_available_cars.dart'; 


class RentalService {

  List<Car> cars = [];

  
  List<RentalContract> contracts = [];

  
  void addCar(Car car) {
    cars.add(car); 
    print("Car added successfully: ${car.model}");
  }


  List<Car> getAvailableCars() {
    return getAvailableCarsFromList(
        cars); 
  }

  
  void rentCar(Customer customer, Car car, int days, String paymentMethod) {
    
    if (!car.isAvailable) {
      print("Car is not available for rent.");
      return;
    }

    
    double totalAmount = car.rentalPrice * days;

    
    Payment payment = Payment(totalAmount, paymentMethod);

  
    DateTime rentalDate = DateTime.now();
    RentalContract contract =
        RentalContract(customer, car, days, rentalDate, payment);

    
    contracts.add(contract);
    car.rentCar(contract.returnDate);

    
    print("Car rented successfully: ${car.model}");
    print(contract);
  }

  
  void returnCar(Car car) {
  
    if (car.isAvailable) {
      print("Car is already available.");
      return;
    }

    try {
      
      RentalContract contract = contracts.firstWhere((c) => c.car == car);
      car.returnCar(); 
      contracts.remove(contract);

    
      print("Car returned successfully: ${car.model}");
    } catch (e) {
      
      print("No active rental found for this car.");
    }
  }
}
