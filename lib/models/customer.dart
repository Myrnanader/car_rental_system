class Customer {
  String name;
  String phone;

  Customer(this.name, this.phone);

  @override
  String toString() {
    return "Customer: $name | Phone: $phone";
  }
}