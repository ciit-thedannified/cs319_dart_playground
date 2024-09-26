class Account {
  late String _pin;
  late double _balance;
  late bool _locked;

  Account({required String pin, double balance = 0, bool locked = false}) {
    if (balance < 0) throw Exception("Initial balance cannot be less than zero.");

    setPin(pin);
    _balance = balance;
    _locked = locked;
  }

  String get pin => _pin;
  double get balance => _balance;
  bool get locked => _locked;

  void setPin(String pin) {
    if (pin.length != 4) throw Exception("PIN code must have exactly 4 digits.");
    _pin = pin;
  }

  double addBalance(double amount) {
    return _balance += amount;
  }

  double deductBalance(double amount) {
    if (_balance < amount) throw Exception("Account has insufficient balance to deduct given amount.");

    return _balance -= amount;
  }
}