import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/widgets/pet_type_radio_button.dart';

class PetsOverviewScreen extends StatelessWidget {
  var _groupValue = 'dog';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'PetApp',
            style: TextStyle(color: kBlack),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            Text(
              'Find your awesome pet',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: PetTypeRadioButton(
                  value: 'dog',
                  groupValue: _groupValue,
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: PetTypeRadioButton(
                  value: 'cat',
                  groupValue: _groupValue,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
