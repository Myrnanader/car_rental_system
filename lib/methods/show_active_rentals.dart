import '../models/rental_contract.dart';

void showActiveRentalsList(List<RentalContract> contracts) {
  if (contracts.isEmpty) {
    print("No active rentals.");
    return;
  }

  print("Active Rentals:");
  for (var contract in contracts) {
    print(contract);
  }
}
