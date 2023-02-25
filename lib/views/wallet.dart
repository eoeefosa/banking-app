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

import 'other_pages/contact_us/contact_us.dart';

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
              Gap(getProportionateScreenHeight(30)),
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
                        const Gap(3),
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
              Gap(getProportionateScreenHeight(10)),
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
              Gap(getProportionateScreenHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => builddot(index, context),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Text(
                  "Banking Links",
                  style: TextStyle(
                      color: Color.fromRGBO(98, 90, 140, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                axisDirection: AxisDirection.down,
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
                      child: SmallCards(
                          icon: Icons.swap_horiz,
                          color: Colors.white,
                          text: "Fund\nTransfer",
                          cardcolor: Repository.fundColor(context)),
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
                      child: SmallCards(
                          icon: Icons.phone_android,
                          color: Colors.white,
                          text: "Purchase\nData",
                          cardcolor: Repository.puchaseColor(context)),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: SmallCards(
                        icon: Icons.history_sharp,
                        color: Colors.white,
                        text: "Transaction\nHistory",
                        cardcolor: Repository.transactionColor(context)),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ContactUs(),
                          ),
                        );
                      },
                      child: SmallCards(
                          icon: Icons.call,
                          color: Colors.white,
                          text: "Contact\nUs",
                          cardcolor: Repository.contactColor(context)),
                    ),
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

  Container topcard(size, BuildContext context) {
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

    return Container(
      width: size.width * 0.92,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // boxShadow: const <BoxShadow>[
        //   BoxShadow(
        //       color: Colors.black54,
        //       blurRadius: 15.0,
        //       offset: Offset(0.0, 0.95))
        // ],
        // color: Repository.cardColor2A(context),
        gradient: LinearGradient(
          colors: [
            Repository.cardColor2A(context),
            // Repository.cardColor2A(context),
            Repository.cardColor2B(context),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Gap(10),
                Text(
                  "0209525729",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  accountbalance,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(5),
                Text(
                  "Ledger balance",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ledgerbalance,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(
                      " SAVINGS + ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
