import 'package:flutter/material.dart';
import 'package:calculator_kelompocky/components/custom_card.dart';
import 'package:calculator_kelompocky/constants.dart';
import 'package:calculator_kelompocky/pages/result_page.dart';
import 'package:calculator_kelompocky/components/bottom_button.dart';
import 'package:calculator_kelompocky/calculator.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  State<CirclePage> createState() => _CirclePage();
}

class _CirclePage extends State<CirclePage> {
  final radius = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LINGKARAN'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Masukkan Jari-jari',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'JARI-JARI',
                    style: labelTextStyle,
                  ),
                  TextFormField(
                    controller: radius,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "20",
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    style: numberTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'HITUNG',
            onTap: () {
              CircleCalculator calculate =
                  CircleCalculator(radius: int.parse(radius.text).toDouble());
              String area = calculate.area().toString();
              String circumference = calculate.circumference().toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    polygon: "Lingkaran",
                    area: area,
                    circumference: circumference,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
