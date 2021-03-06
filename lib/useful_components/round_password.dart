import 'package:flutter/material.dart';
import 'package:ivara_app/useful_components/text_field.dart';

class RoundedPasswordField extends StatefulWidget {
  Function onChanged;
  RoundedPasswordField(this.onChanged);
  @override
  RoundedPasswordFieldState createState() => RoundedPasswordFieldState();
}

class RoundedPasswordFieldState extends State<RoundedPasswordField> {
  // final ValueChanged<String> onChanged;
  bool passwordstate = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: passwordstate,
        onChanged: widget.onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: "Enter Your Password",
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          //   suffixIcon: passwordstate? Icon(Icons.visibility_off): Icon(Icons.visibility),
          suffixIcon: IconButton(
              icon: passwordstate
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () => {
                    setState(() {
                      passwordstate = !passwordstate;
                    })
                  }),
          /*  suffixIcon: Icon(
            Icons.visibility,
            color: Colors.black,
          ), */
          border: InputBorder.none,
        ),
      ),
    );
  }
}
