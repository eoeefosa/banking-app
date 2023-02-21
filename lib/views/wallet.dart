// import 'package:flutter/cupertino.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_banking_app/generated/assets.dart';
// import 'package:characters/characters.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_banking_app/json/shortcut_list.dart';
// import 'package:flutter_banking_app/json/transactions.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/smallcards.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/views/Transfer.dart';
import 'package:flutter_banking_app/views/other_pages/purchase_data.dart';
import 'package:gap/gap.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/tile.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final size = Layouts.getSize(context);
    // const width = double.infinity;
    return Material(
      color: Repository.bgColor(context),
      elevation: 0,
      child: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              Gap(getProportionateScreenHeight(50)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hi Tino',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Gap(3),
                        Text('Welcome back',
                            style: TextStyle(
                                color: Repository.cardColor(context),
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Icon(
                          IconlyBold.Notification,
                          color: Styles.accentColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(25),
              SizedBox(
                height: size.height * 0.23,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    topcard(size, context),
                  ],
                ),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => builddot(index, context),
                ),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Banking Links",
                  style: TextStyle(
                      color: Color.fromRGBO(98, 90, 140, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Transfer(),
                          ),
                        );
                      },
                      child: const SmallCards(
                          icon: Icons.swap_horiz,
                          color: Colors.white,
                          text: "Fund\nTransfer",
                          cardcolor: Colors.green),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: InkWell(
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
                          icon: Icons.phone_android,
                          color: Colors.white,
                          text: "Purchase\nData",
                          cardcolor: Colors.blue),
                    ),
                  ),
                  const StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: SmallCards(
                        icon: Icons.history_sharp,
                        color: Colors.white,
                        text: "Transaction\nHistory",
                        cardcolor: Colors.yellow),
                  ),
                  const StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: SmallCards(
                        icon: Icons.call,
                        color: Colors.white,
                        text: "Contact\nUs",
                        cardcolor: Colors.purple),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer builddot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: 1 == index ? 20 : 6,
      decoration: BoxDecoration(
        color: 1 == index
            ? Repository.sliderColor1A(context)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Card topcard(size, BuildContext context) {
    String naira = '\u20A6';

    CurrencyFormatterSettings nairaSettings = CurrencyFormatterSettings(
      symbol: naira,
      symbolSide: SymbolSide.left,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolSeparator: '',
    );
    num amountAccount = 500000.54;
    num amountLedger = 650000.54;

    String accountbalance =
        CurrencyFormatter.format(amountAccount, nairaSettings);
    String ledgerbalance =
        CurrencyFormatter.format(amountLedger, nairaSettings);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        width: size.width * 0.92,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // color: Repository.cardColor2A(context),
          gradient: LinearGradient(
            colors: [
              Repository.cardColor2A(context),
              Repository.cardColor2B(context),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Text(
                "0209525729",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(5),
              Text(
                // TODO: design naira sign
                accountbalance,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(20),
              Text(
                "Ledger balance",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(5),
              Text(
                // TODO: design naira sign
                ledgerbalance,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
