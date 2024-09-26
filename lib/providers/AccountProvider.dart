import 'package:flutter/cupertino.dart';

import '../models/account.dart';

class AccountProvider extends ChangeNotifier {
  final Account _currentAccount = Account(pin: "1234");

  Account get currentAccount => _currentAccount;

  void addBalance(double amount) {
    currentAccount.addBalance(amount);
    notifyListeners();
  }

  void deductBalance(double amount) {
    try {
      currentAccount.deductBalance(amount);
    } on Exception catch (e) {
      debugPrint(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
