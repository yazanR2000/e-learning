import 'dart:convert';
import 'package:e_learning/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;

import '../widgets/textField.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool showPassword = true, signIn = true, loading = false;
  var name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      conPassword = TextEditingController();

  Future<void> authenticate(
      String email, String password, String urlStatement, String name) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlStatement?key=AIzaSyBV9a6mZBwrgwMffto6alLECkGNIHYPYoE';
    try {
      setState(() {
        loading = true;
      });
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        setState(() {
          loading = false;
        });
        dialog(responseData['error']['message'], false);
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      }
    } catch (error) {
      throw error;
    }
  }

  dialog(message, status) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: Text('Thanks'))
            ],
            title: !status
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Err'),
                      const Icon(LineIcons.frowningFace),
                      Text('r')
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('C'),
                      const Icon(LineIcons.smilingFace),
                      Text('ngrats!')
                    ],
                  ),
            content: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 150,
                  width: 150,
                ),
                Text(
                  signIn ? 'Sign In' : 'Sign Up',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: signIn ? 0 : 20,
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: signIn ? 0 : 1,
                  child: EditText(
                    controller: name,
                    icon: LineIcons.signature,
                    hint: 'Name',
                    pass: false,
                  ),
                ),
                SizedBox(
                  height: signIn ? 0 : 20,
                ),
                EditText(
                  icon: LineIcons.at,
                  controller: email,
                  hint: 'Email',
                  pass: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                EditText(
                  icon: Icons.password,
                  controller: password,
                  hint: 'Password',
                  pass: true,
                ),
                if (signIn)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password ?",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: const Color(0xffF0F5F9),
                            ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: signIn ? 0 : 20,
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: signIn ? 0 : 1,
                  child: TextField(
                      controller: conPassword,
                      obscureText: showPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        prefixIcon: const Icon(LineIcons.doubleCheck),
                        hintText: 'Confirm password',
                      )),
                ),
                if (!signIn)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password ?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: const Color(0xffF0F5F9)),
                      ),
                    ),
                  ),
                // Container(
                //     padding: const EdgeInsets.only(top: 20),
                //     alignment: Alignment.centerRight,
                //     child: GestureDetector(
                //       onTap: (() {}),
                //       child: Text(
                //         'Forgot password?',
                //         style: TextStyle(color: Colors.red[900]),
                //       ),
                //     )),
                // const SizedBox(
                //   height: 50,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      signIn
                          ? 'Don\'t have an account ?'
                          : 'Already have an account ?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: const Color(0xffF0F5F9)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          signIn = !signIn;
                        });
                      },
                      child: Text(
                        signIn ? "Sign Up" : "Sign In",
                      ),
                    )
                  ],
                ),
                // Container(
                //   padding: const EdgeInsets.only(bottom: 10),
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: (() {
                //       setState(() {
                //         signIn = !signIn;
                //       });
                //     }),
                //     child: Text(
                //       signIn
                //           ? '  Don\'t have an account? Sign Up'
                //           : 'Already have an account? Sign In',
                //       style: TextStyle(color: Colors.red[900]),
                //     ),
                //   ),
                // ),
                loading
                    ? const Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          if (signIn) {
                            if (email.text.isEmpty || password.text.isEmpty) {
                              dialog('Please enter Your Email and password',
                                  false);
                            } else {
                              await authenticate(email.text, password.text,
                                  'signInWithPassword', name.text);
                            }
                          } else {
                            if (email.text.isEmpty ||
                                password.text.isEmpty ||
                                conPassword.text.isEmpty ||
                                name.text.isEmpty) {
                              dialog(
                                  'Please enter Your all Information', false);
                            } else {
                              if (email.text.contains('@') &&
                                  email.text.endsWith('.com')) {
                                if (password.text.length < 6) {
                                  dialog(
                                      'Password should be more than 6 characters',
                                      false);
                                } else {
                                  if (password.text == conPassword.text) {
                                    await authenticate(email.text,
                                        password.text, 'signUp', name.text);

                                    setState(() {
                                      signIn = true;
                                    });
                                  } else {
                                    dialog(
                                        'Password and Confirm password are not match!',
                                        false);
                                  }
                                }
                              } else {
                                dialog('Please enter a valid Email', false);
                              }
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            signIn ? 'Sign In' : 'Sign Up',
                          ),
                        )),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
