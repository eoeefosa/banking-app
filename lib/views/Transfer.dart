import 'package:flutter/material.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:gap/gap.dart';

import '../utils/smallcards.dart';
import 'other_pages/purchase_data.dart';
import 'other_pages/transfer/transferTootherbanks.dart';

class Transfer extends StatelessWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
        backgroundColor: Repository.bgColor(context),
        appBar: AppBar(
          // foregroundColor: Colors.black,
          // leading: const Icon(
          //   Icons.bubble_chart,
          //   color: Colors.black,
          //   size: 30,
          // ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: const [
              Icon(
                Icons.bubble_chart,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.green,
                maxRadius: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 15,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          // shrinkWrap: true,
          children: [
            const Gap(30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Payments",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.web,
                    size: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const TransferToOther(),
                        ),
                      );
                    },
                    child: const SmallCards(
                      cardcolor: Colors.green,
                      color: Colors.white,
                      icon: Icons.people,
                      text: "Other Bank\nTransfer",
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const SmallCards(
                      cardcolor: Colors.white,
                      color: Color.fromARGB(255, 17, 43, 66),
                      icon: Icons.people,
                      text: "Own Account\nTransfer",
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const SmallCards(
                      cardcolor: Colors.white,
                      color: Color.fromARGB(255, 17, 43, 66),
                      icon: Icons.swap_horiz,
                      text: "Transfer to\nNPF MFB",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const PurchaseData(),
                        ),
                      );
                    },
                    child: const SmallCards(
                      cardcolor: Colors.white,
                      color: Color.fromARGB(255, 17, 43, 66),
                      icon: Icons.phone_android,
                      text: "Mobile\nTop-up",
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const SmallCards(
                      cardcolor: Colors.white,
                      color: Color.fromARGB(255, 17, 43, 66),
                      icon: Icons.payment,
                      text: "Pay\nBills",
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const SmallCards(
                      cardcolor: Colors.white,
                      color: Color.fromARGB(255, 17, 43, 66),
                      icon: Icons.history,
                      text: "Tansaction\nHistory",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
