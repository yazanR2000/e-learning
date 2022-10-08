import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  EditText(
      {super.key,
      required this.icon,
      required this.controller,
      required this.hint,
      required this.pass});

  String hint;
  TextEditingController controller;
  IconData icon;
  bool pass;

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: widget.pass ? showPassword : false,
      decoration: InputDecoration(
        suffixIcon: widget.pass
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,color: const Color(0xffF0F5F9)
                ),
              )
            : null,
        prefixIcon: Icon(widget.icon,color: const Color(0xffF0F5F9)),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Color(0xffF0F5F9)),
      ),
      style: const TextStyle(color: Color(0xffF0F5F9)),
    );
  }
}
