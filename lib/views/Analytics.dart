import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/json/transactions.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  DateTime _dueDate = DateTime.now();
  var fruits = ['Orange', 'Apple', 'Strawberry', 'Banana'];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Repository.bgColor(context),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(4, 30, 0, 0),
          child: Text(
            "Analytics",
            style: TextStyle(
              color: Repository.headerColor(context),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            // textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          // newMethod(context),
          // TODO: CARD
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Select Account",
              style: TextStyle(
                  color: Repository.headerColor(context),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(10),
          topcard(size, context),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => builddot(index, context),
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "Sort By Date",
              style: TextStyle(
                  color: Repository.headerColor(context),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(20),
          buildDateField(context),
          const Gap(40),
          DropdownButton(
            dropdownColor: Colors.grey,
            
            items: fruits.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: ((value) => value),
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: TextStyle(
                  color: Repository.headerColor(context),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
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

  LineChartData mainData() {
    List<Color> gradientColors = [Repository.selectedItemColor(context)];
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            //color: Repository.selectedItemColor(context),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        // rightTitles: SideTitles(showTitles: false),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1.1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 32,
            getTitlesWidget: rightTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border:
            Border.all(color: Repository.selectedItemColor(context), width: 1),
      ),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(1.5, 3),
            const FlSpot(3.5, 5),
            const FlSpot(5, 3),
            const FlSpot(6.5, 4),
            const FlSpot(8, 2.8),
            const FlSpot(9, 3),
          ],
          isCurved: true,
          // color: gradientColors,
          color: gradientColors.first,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            //applyCutOffY: true,
            //cutOffY: 100,
            // TODO: CHECK GRADIENT
            // gradientFrom: const Offset(100, 10),
            // gradientTo: const Offset(100, 100),
            show: true,
            color: gradientColors.first,
            // [
            //   Repository.selectedItemColor(context).withOpacity(0.05),
            //   Repository.selectedItemColor(context),
            // ],
          ),
        ),
      ],
    );
  }
}

Widget rightTitleWidgets(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 0:
      text = '10k';
      break;
    case 1:
      text = '20k';
      break;
    case 2:
      text = '30k';
      break;

    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      text,
      style: const TextStyle(
        color: Color(0xff67727d),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'SUN';
      break;
    case 1:
      text = 'MON';
      break;
    case 2:
      text = 'TUE';
      break;
    case 3:
      text = 'WED';
      break;
    case 4:
      text = 'THUR';
      break;
    case 5:
      text = 'FRI';
      break;
    case 6:
      text = 'SAT';
      break;
    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      text,
      style: const TextStyle(color: Colors.grey, fontSize: 17),
    ),
  );
}

Card topcard(size, BuildContext context) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child: Container(
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // color: Repository.cardColor2A(context),
          gradient: LinearGradient(
            colors: [
              Repository.cardColor3A(context),
              Repository.cardColor3B(context),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SizedBox(
          height: 100,
          child: Center(
            child: Text(
              "All Accounts",
              style: TextStyle(
                color: Repository.headerColor2A(context),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )),
  );
}
