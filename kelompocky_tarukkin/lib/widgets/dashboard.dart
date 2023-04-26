import 'package:flutter/material.dart';
import 'package:kelompocky_tarukkin/controllers/auth.dart';
import 'package:kelompocky_tarukkin/views/dashboard/about.dart';
import 'package:kelompocky_tarukkin/views/dashboard/home.dart';
import 'package:kelompocky_tarukkin/views/dashboard/profile.dart';
import 'package:kelompocky_tarukkin/views/auth/login.dart';
import 'package:kelompocky_tarukkin/widgets/login.dart';

Auth auth = Auth();
bool isSelectedTile(active, tile) {
  if (active == tile) {
    return true;
  }
  return false;
}

Drawer dashboardDrawer(context, String fullName, String username, String email,
        String active) =>
    Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          const Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "($username)",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              nextScreen(context, const HomePage());
            },
            selectedColor: Theme.of(context).primaryColor,
            selected: isSelectedTile(active, "group"),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Groups",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(
                  context,
                  ProfilePage(
                    fullName: fullName,
                    userName: username,
                    email: email,
                  ));
            },
            selected: isSelectedTile(active, "profile"),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(
                  context,
                  AboutPage(
                    fullName: fullName,
                    userName: username,
                    email: email,
                  ));
            },
            selected: isSelectedTile(active, "about"),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.info),
            title: const Text(
              "About",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Keluar"),
                      content: const Text("Apakah kamu yakin ingin keluar?"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await auth.signOut().then((value) =>
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                    (route) => false));
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  });
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Keluar",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
