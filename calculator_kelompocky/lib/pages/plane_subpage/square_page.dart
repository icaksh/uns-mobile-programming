import 'package:flutter/material.dart';
import 'package:calculator_kelompocky/components/custom_card.dart';
import 'package:calculator_kelompocky/constants.dart';
import 'package:calculator_kelompocky/pages/result_page.dart';
import 'package:calculator_kelompocky/components/bottom_button.dart';
import 'package:calculator_kelompocky/calculator.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  State<SquarePage> createState() => _SquarePage();
}

class _SquarePage extends State<SquarePage> {
  final length = TextEditingController();
  final width = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERSEGI'),
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
                  'Masukkan Nilai Sisi',
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
                    'PANJANG SISI',
                    style: labelTextStyle,
                  ),
                  TextFormField(
                    controller: length,
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
              RectangleCalculator calculate = RectangleCalculator(
                  width: int.parse(length.text).toDouble(),
                  length: int.parse(length.text).toDouble());
              String area = calculate.area().toString();
              String circumference = calculate.circumference().toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    polygon: "Persegi",
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
