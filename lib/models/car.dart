class Car {
  String model;
  String plateNumber;
  double rentalPrice;
  bool isAvailable;
  DateTime? bookedUntil;

  Car(this.model, this.plateNumber, this.rentalPrice,
      {this.isAvailable = true, this.bookedUntil});

  void rentCar(DateTime returnDate) {
    isAvailable = false;
    bookedUntil = returnDate;
  }

  void returnCar() {
    isAvailable = true;
    bookedUntil = null;
  }

  @override
  String toString() {
    return "Car: $model | Plate: $plateNumber | Price per day: \$${rentalPrice} | Available: $isAvailable";
  }
}