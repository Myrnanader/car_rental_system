class Payment {
  double amount;
  String method;
  DateTime paymentDate;

  Payment(this.amount, this.method) : paymentDate = DateTime.now();

  @override
  String toString() {
    return "Payment: \$$amount via $method on $paymentDate";
  }
}