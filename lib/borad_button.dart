import 'package:flutter/material.dart';

class BoradButton extends StatelessWidget {
   BoradButton({super.key, required this.text,required this.onButtonClick,required this.index});

  final String text;
Function onButtonClick;
int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(3),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {
            onButtonClick(index);
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
