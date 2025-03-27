import '../models/car.dart';
import '../models/customer.dart';
import '../models/rental_contract.dart';
import '../models/payment.dart';

void rentCarForCustomer(List<RentalContract> contracts, Customer customer, Car car, int days, String paymentMethod) {
  if (!car.isAvailable) {
    print("car is not available");
    return;
  }

  Payment payment = Payment(car.rentalPrice * days, paymentMethod);
  DateTime rentalDate = DateTime.now();
  var contract = RentalContract(customer, car, days, rentalDate, payment);
  contracts.add(contract);
  car.rentCar(contract.returnDate);

  print("car rented successfully");
  print(contract);
 // print(payment);
}
