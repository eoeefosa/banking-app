import 'package:flutter/material.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
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
              Gap(getProportionateScreenHeight(50)),
              Networkcard(
                size: size,
                name: 'MTN Nigeria',
                link: "assets/images/mtn.png",
              ),
              Gap(getProportionateScreenHeight(10)),
              Networkcard(
                size: size,
                name: 'Glo Nigeria',
                link: "assets/images/glo_logo.jpg",
              ),
              Gap(getProportionateScreenHeight(10)),
              Networkcard(
                size: size,
                name: 'Airtel Nigeria',
                link: "assets/images/airtel.jpg",
              ),
              Gap(getProportionateScreenHeight(10)),
              Networkcard(
                size: size,
                name: 'Glo Nigeria',
                link: "assets/images/9mobile.png",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Networkcard extends StatelessWidget {
  const Networkcard({
    super.key,
    required this.size,
    required this.name,
    required this.link,
  });

  final size;
  final String name;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: size.width,
        height: 60,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              link,
              fit: BoxFit.contain,
            ),
          )
        ]),
      ),
    );
  }
}
