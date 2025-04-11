import'dart:io';
import '../models/employee.dart';
import '../methods/add_employee.dart'; // عشان نستخدم القائمة employees

void removeEmployee() {
  stdout.write("Enter employee ID to remove: ");
  String? id = stdin.readLineSync();

  try {
    Employee employeeToRemove = employees.firstWhere((emp) => emp.id == id);
    employees.remove(employeeToRemove);
    print("Employee removed successfully: ${employeeToRemove.name}");
  } catch (e) {
    print("Employee not found with ID: $id");
  }
}