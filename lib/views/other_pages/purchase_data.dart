import 'package:flutter/material.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:gap/gap.dart';

import '../../utils/layouts.dart';

class PurchaseData extends StatelessWidget {
  const PurchaseData({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);

    return WillPopScope(
      onWillPop: () async {
        // Custom back button behavior goes here
        // Return true to allow the back button press to be handled normally
        // Return false to prevent the back button press from doing anything
        // For example, to show a confirmation dialog before allowing the user to go back:
        bool confirm = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Are you sure you want to go back?"),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: const Text("OK"),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
        return confirm;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(196, 193, 219, 1),
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "Select Network",
                style: TextStyle(
                  color: Repository.purchaseDataheadercolor(context),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(40),
              Card(
                color: Colors.white,
                child: SizedBox(
                  width: size.width,
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("MTN Nigeria"), Image.asset("mtn.png")]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
