import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';

class PetTypeRadioButton extends StatelessWidget {
  final String groupValue;
  final String value;
  final Function onTap;
  PetTypeRadioButton({this.groupValue, this.value, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: groupValue == value ? kGrey : null,
          border: Border.all(color: kGrey, width: 1.5),
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
      ),
    );
  }
}
