import 'package:flutter/material.dart';
import '../variables.dart';
import 'login.dart';

class MyButton extends StatefulWidget {
  final String child;
  final VoidCallback onTap;

  const MyButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  var buttonColor = statusSwitchMode ? colorfulBGTZ : tidakcolorful;

  @override
  Widget build(BuildContext context) {
    if (widget.child == 'C') {
      buttonColor = Colors.blue;
    } else if (widget.child == 'DEL') {
      buttonColor = Colors.red;
    } else if (widget.child == '=') {
      buttonColor = Colors.green;
    } else if (widget.child == '') {
      buttonColor = Colors.transparent;
    }

    // else if (widget.child == 'x') {
    //   buttonColor = Colors.grey;
    // } else if (widget.child == 'c') {
    //   buttonColor = Colors.grey;
    // }

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                widget.child,
                style: whiteTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
