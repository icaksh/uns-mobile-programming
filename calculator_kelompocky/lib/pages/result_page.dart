import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_kelompocky/components/icon_card.dart';
import 'package:calculator_kelompocky/components/custom_card.dart';
import 'package:calculator_kelompocky/constants.dart';
import 'package:calculator_kelompocky/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.polygon,
      required this.area,
      required this.circumference});

  final String polygon;
  final String area;
  final String circumference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KALKULATOR BANGUN DATAR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: Text(
                  'Hasil Perhitungan $polygon',
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.solidShapes,
                      caption: "Luas: $area m^2",
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.rectangleList,
                      caption: "Keliling: $circumference m",
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'HITUNG LAINNYA',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
