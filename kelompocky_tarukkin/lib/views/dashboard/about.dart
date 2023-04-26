import 'package:flutter/material.dart';
import 'package:kelompocky_tarukkin/controllers/auth.dart';
import 'package:kelompocky_tarukkin/widgets/dashboard.dart';

class AboutPage extends StatefulWidget {
  final String userName;
  final String fullName;
  final String email;
  const AboutPage(
      {Key? key,
      required this.email,
      required this.userName,
      required this.fullName})
      : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: dashboardDrawer(
          context, widget.fullName, widget.userName, widget.email, "about"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/about.png"),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Arya Yudhistira Bintang Utama",
                    style: TextStyle(fontSize: 17)),
                Text("K3520014", style: TextStyle(fontSize: 17)),
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Natanael Junior Setiawan",
                    style: TextStyle(fontSize: 17)),
                Text("K3520054", style: TextStyle(fontSize: 17)),
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Palguno Wicaksono", style: TextStyle(fontSize: 17)),
                Text("K3520060", style: TextStyle(fontSize: 17)),
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Arya Yudhistira Bintang Utama",
                    style: TextStyle(fontSize: 17)),
                Text("K3520082", style: TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
