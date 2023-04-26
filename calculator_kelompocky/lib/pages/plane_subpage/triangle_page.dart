import 'package:flutter/material.dart';
import 'package:calculator_kelompocky/components/custom_card.dart';
import 'package:calculator_kelompocky/constants.dart';
import 'package:calculator_kelompocky/pages/result_page.dart';
import 'package:calculator_kelompocky/components/bottom_button.dart';
import 'package:calculator_kelompocky/calculator.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  State<TrianglePage> createState() => _TrianglePage();
}

class _TrianglePage extends State<TrianglePage> {
  final base = TextEditingController();
  final height = TextEditingController();

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
                  'Masukkan Alas dan Tinggi',
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
                    'ALAS',
                    style: labelTextStyle,
                  ),
                  TextFormField(
                    controller: base,
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
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'TINGGI',
                    style: labelTextStyle,
                  ),
                  TextFormField(
                    controller: height,
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
              TriangleCalculator calculate = TriangleCalculator(
                  base: int.parse(base.text).toDouble(),
                  height: int.parse(height.text).toDouble());
              String area = calculate.area().toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    polygon: "Segitiga",
                    area: area,
                    circumference: "-",
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
