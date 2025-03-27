import '../models/car.dart';
import '../models/rental_contract.dart';

void returnCarToService(List<RentalContract> contracts, Car car) {
  if (car.isAvailable) {
    print("Car is already available.");
    return;
  }

  try {
    RentalContract contract = contracts.firstWhere((c) => c.car == car);
    car.returnCar();
    contracts.remove(contract);
    print(" Car returned successfully \n $contracts");
    
  } catch (e) {
    print("Car not found in active rentals");
  }
}
