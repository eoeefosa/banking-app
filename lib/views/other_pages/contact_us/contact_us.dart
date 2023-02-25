import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/size_config.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Text(
            "Help Options",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Gap(getProportionateScreenHeight(10)),
          Text(
            "Kindly select a help option below to get\nClarification and direct support",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Gap(getProportionateScreenHeight(30)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HelpCard(context, 'Talk to a live Agent'),
                Gap(getProportionateScreenHeight(10)),
                HelpCard(context, 'Call our help center'),
                Gap(getProportionateScreenHeight(10)),
                HelpCard(context, 'Send an Email'),
                Gap(getProportionateScreenHeight(10)),
                HelpCard(context, 'Locate a branch'),
              ],
            ),
          ),
          Gap(getProportionateScreenHeight(10)),
          Text(
            "Kindly read our FAQ first",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }

  Card HelpCard(BuildContext context, String text) {
    return Card(
      color: Colors.white70,
      surfaceTintColor: Colors.black87,
      elevation: 2.0,
      child: SizedBox(
        height: 50,
        width: 450,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
