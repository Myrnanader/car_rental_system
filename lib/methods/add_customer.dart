import 'dart:io';
import '../models/customer.dart';

List<Customer> customers = [];

void addCustomer() {
  stdout.write("Enter customer ID: ");
  String id = stdin.readLineSync() ?? "";
  stdout.write("Enter customer name: ");
  String name = stdin.readLineSync() ?? "";
  stdout.write("Enter customer phone number: ");
  String phone = stdin.readLineSync() ?? "";

  Customer newCustomer = Customer(id, name, phone);
  customers.add(newCustomer);
  print("Customer added successfully: ${newCustomer.name}");
}
