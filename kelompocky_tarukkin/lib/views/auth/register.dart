import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kelompocky_tarukkin/helper/login.dart';
import 'package:kelompocky_tarukkin/controllers/auth.dart';
import 'package:kelompocky_tarukkin/views/dashboard/home.dart';
import 'package:kelompocky_tarukkin/views/auth/login.dart';
import 'package:kelompocky_tarukkin/widgets/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = "";
  String password = "";
  String fullName = "";
  String username = "";
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "KikChat",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Daftarkan akunmu dan mulailah mengobrol!",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                            labelText: "Username",
                            prefixIcon: Icon(Icons.computer,
                                color: Theme.of(context).primaryColor),
                          ),
                          onChanged: (val) {
                            setState(() {
                              username = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Nama Lengkap",
                          prefixIcon: Icon(Icons.person,
                              color: Theme.of(context).primaryColor),
                        ),
                        onChanged: (val) {
                          setState(() {
                            fullName = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Nama lengkap tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email,
                              color: Theme.of(context).primaryColor),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Email tidak valid";
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.key,
                              color: Theme.of(context).primaryColor),
                        ),
                        validator: (val) {
                          if (val!.length < 8) {
                            return "Password harus 8 karakter atau lebih";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            register();
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Sudah memiliki akun? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Masuk disini",
                                style: const TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() {
                                    nextScreen(context, const LoginPage());
                                  })),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await auth
          .registerUserWithEmailandPassword(username, fullName, email, password)
          .then((value) async {
        if (value == true) {
          await LoginHelper.saveUserLoggedInStatus(true);
          await LoginHelper.saveUserEmailSF(email);
          await LoginHelper.saveUserFullNameSF(fullName);
          await LoginHelper.saveUserNameSF(username);
          if (!mounted) return;
          nextScreenReplace(context, const HomePage());
        } else {
          setState(() {
            showSnackbar(context, value, Colors.red);
            _isLoading = false;
          });
        }
      });
    }
  }
}
