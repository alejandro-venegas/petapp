import 'package:flutter/material.dart';

class PetTypeRadioButton extends StatelessWidget {
  final String groupValue;
  final String value;
  PetTypeRadioButton({this.groupValue, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: groupValue == value ? Color(0xFFeeeeee) : null,
        border: Border.all(color: Color(0xFFeeeeee), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  value == 'dog' ? 'Dog  🐶' : 'Cat  🐱',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Radio(
              onChanged: null,
              groupValue: groupValue,
              value: value,
            )
          ],
        ),
      ),
    );
  }
}
