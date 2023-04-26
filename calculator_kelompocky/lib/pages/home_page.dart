import 'package:calculator_kelompocky/pages/plane_subpage/square_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_kelompocky/components/custom_card.dart';
import 'package:calculator_kelompocky/components/icon_card.dart';
import 'package:calculator_kelompocky/constants.dart';
import 'package:calculator_kelompocky/pages/about_page.dart';
import 'package:calculator_kelompocky/pages/plane_subpage/triangle_page.dart';
import 'package:calculator_kelompocky/pages/plane_subpage/rectangle_page.dart';
import 'package:calculator_kelompocky/pages/plane_subpage/circle_page.dart';
import 'package:calculator_kelompocky/components/bottom_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Polygon selectedBangun = Polygon.square;
  int height = 160;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KALKULATOR BANGUN DATAR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedBangun == Polygon.square
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.solidSquare,
                      caption: 'PERSEGI',
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SquarePage(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedBangun == Polygon.rectangle
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.rectangle,
                      caption: 'PERSEGI PANJANG',
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RectanglePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedBangun == Polygon.circle
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.circle,
                      caption: 'LINGKARAN',
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CirclePage(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedBangun == Polygon.triangle
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.solidTriangle,
                      caption: 'SEGITIGA',
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrianglePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'ABOUT',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
