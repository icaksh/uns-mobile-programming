import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_kelompocky/components/custom_card.dart';
import 'package:calculator_kelompocky/components/icon_card.dart';
import 'package:calculator_kelompocky/constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              children: const [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.userNinja,
                      caption: 'ARYA YUDHISTIRA BINTANG UTAMA (K3520014)',
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.userBountyHunter,
                      caption: 'NATANAEL JUNIOR SETIAWAN (K3520054)',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.userAstronaut,
                      caption: 'PALGUNO WICAKSONO (K3520060)',
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.userCowboy,
                      caption: 'ZAINURI SEPTIAN WAHYU ANGGORO (K3520082)',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
