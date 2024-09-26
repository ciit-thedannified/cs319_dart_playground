import 'package:cs319_dart_playground/models/account.dart';
import 'package:cs319_dart_playground/providers/AccountProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          home: const PayBillsPage(),
        );
      },
    );
  }
}

class PayBillsPage extends StatefulWidget {
  const PayBillsPage({super.key});

  @override
  State<PayBillsPage> createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  final _payBillsForm = GlobalKey<FormState>(debugLabel: "pay-bills-form");
  final _MAX_PURPOSE_LENGTH = 60;
  final _MIN_BILLER_NAME_LENGTH = 3;
  final _MIN_TRANSFER_AMOUNT = 100.00;

  @override
  Widget build(BuildContext context) {

    final account = Provider.of<AccountProvider>(context);
    final balance = account.currentAccount.balance;

    final _billerNameController = TextEditingController();
    final _transferAmountController = TextEditingController();
    final _transferPurposeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.topCenter,
        child: Form(
          key: _payBillsForm,
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 16,
            children: [
              Text("${account.currentAccount.balance}"),
              // BILLER NAME
              TextFormField(
                controller: _billerNameController,
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter biller name";
                  } else if (value.length < _MIN_BILLER_NAME_LENGTH) {
                    return "Biller name must be at least $_MIN_BILLER_NAME_LENGTH characters long.";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Biller Name*'),
              ),
              // TRANSFER AMOUNT
              TextFormField(
                controller: _transferAmountController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: (value) {
                  if (value == null || value.isEmpty || double.tryParse(value) == null) {
                    return "Enter amount to transfer";
                  } else if (double.parse(value) < _MIN_TRANSFER_AMOUNT) {
                    return 'Minimum amount to transfer is $_MIN_TRANSFER_AMOUNT';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Transfer Amount*'),
              ),
              TextFormField(
                controller: _transferPurposeController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value != null && value.length >= _MAX_PURPOSE_LENGTH) {
                    return 'Message length must not be longer than $_MAX_PURPOSE_LENGTH characters';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Purpose',
                ),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.inversePrimary,
                padding: const EdgeInsets.all(16),
                minWidth: double.infinity,
                clipBehavior: Clip.hardEdge,
                child: const Text("Transfer"),
                onPressed: () {
                  if (_payBillsForm.currentState!.validate()) {
                    account.addBalance(double.parse(_transferAmountController.value.text));
                    debugPrint("${account.currentAccount.balance}");

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                          content: Text('kk ${account.currentAccount.balance}')
                        )
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
