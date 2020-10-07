import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/providers/pets.dart';
import 'package:petapp/widgets/breed_grid_item.dart';
import 'package:petapp/widgets/main_drawer.dart';
import 'package:petapp/widgets/pet_type_radio_button.dart';
import 'package:provider/provider.dart';

class PetsOverviewScreen extends StatefulWidget {
  @override
  _PetsOverviewScreenState createState() => _PetsOverviewScreenState();
}

class _PetsOverviewScreenState extends State<PetsOverviewScreen> {
  var _groupValue = 'dog';
  var _isMenuOpened = true;
  var appbar = AppBar(
    actionsIconTheme: IconThemeData(
      color: kBlack,
    ),
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
  );
  setGroupValue(String value) {
    setState(() {
      _groupValue = value;
    });
  }

  toggleMenu() {
    setState(() {
      _isMenuOpened = !_isMenuOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      drawerScrimColor: Colors.transparent,
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
        child: Column(
          children: [
            if (_isMenuOpened) ...[
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
              IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: toggleMenu)
            ] else
              IconButton(
                  icon: Icon(Icons.arrow_drop_down), onPressed: toggleMenu),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Breeds',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<Pets>(builder: (context, value, child) {
                final breeds = value.breeds(_groupValue);

                return StaggeredGridView.countBuilder(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) =>
                      BreedGridItem(breeds[index], _groupValue),
                  itemCount: breeds.length,
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(1, index.isEven ? 1.1 : 0.8),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
