import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/providers/pets.dart';
import 'package:petapp/widgets/breed_grid_item.dart';
import 'package:petapp/widgets/pet_type_radio_button.dart';
import 'package:provider/provider.dart';

class PetsOverviewScreen extends StatefulWidget {
  @override
  _PetsOverviewScreenState createState() => _PetsOverviewScreenState();
}

class _PetsOverviewScreenState extends State<PetsOverviewScreen> {
  var _groupValue = 'dog';

  setGroupValue(String value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
                  onTap: () => setGroupValue('dog'),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: PetTypeRadioButton(
                    value: 'cat',
                    groupValue: _groupValue,
                    onTap: () => setGroupValue('cat'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<Pets>(builder: (context, value, child) {
                final breeds = value.breeds();

                return StaggeredGridView.countBuilder(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) =>
                      BreedGridItem(breeds[index], _groupValue),
                  itemCount: breeds.length,
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(1, index.isEven ? 1.2 : 0.8),
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
