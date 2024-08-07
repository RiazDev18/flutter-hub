class vehicle {
  String cc_engine;
  String model;
  vehicle(this.cc_engine, this.model) {}
  fuelConsumtion(double totalFuelUsed, double totalDistanceCovered) {
    double fuelConsumed = totalFuelUsed / totalDistanceCovered * 100;
    print("Total Fuel Consumed  : $fuelConsumed");
  }

  speed() {
    print("Speed of $model is : 100km/h");
  }
}

void main() {
  vehicle v1 = vehicle('Tesla', "1500");
  v1.fuelConsumtion(15.4, 30.2);
  v1.speed();
}
