import'dart:io';
import '../models/customer.dart';
import '../methods/add_customer.dart'; // عشان نستخدم القائمة customers

void removeCustomer() {
  stdout.write("Enter customer ID to remove: ");
  String? id = stdin.readLineSync();

  try {
    Customer customerToRemove = customers.firstWhere((cust) => cust.id == id);
    customers.remove(customerToRemove);
    print("Customer removed successfully: ${customerToRemove.name}");
  } catch (e) {
    print("Customer not found with ID: $id");
  }
}