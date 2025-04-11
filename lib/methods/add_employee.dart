import'dart:io';
import '../models/employee.dart';


List<Employee> employees = [];

void addEmployee() {
  stdout.write("Enter employee ID: ");
  String id = stdin.readLineSync() ?? "";
  stdout.write("Enter employee name: ");
  String name = stdin.readLineSync() ?? "";

  Employee newEmployee = Employee(id, name);
  employees.add(newEmployee);
  print("Employee added successfully: ${newEmployee.name}");
}