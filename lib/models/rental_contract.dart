import 'car.dart';
import 'customer.dart';
import 'payment.dart';

class RentalContract {
  Customer customer;
  Car car;
  int rentalDays;
  double totalCost;
  DateTime rentalDate;
  DateTime returnDate;
  Payment payment;

  RentalContract(
      this.customer, this.car, this.rentalDays, this.rentalDate, this.payment)
      : returnDate = rentalDate.add(Duration(days: rentalDays)),
        totalCost = rentalDays * car.rentalPrice;

  @override
  String toString() {
    return "RentalContract: ${customer.name} rented ${car.model} for $rentalDays days from $rentalDate to $returnDate\n$payment";
  }
}
