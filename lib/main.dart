import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/providers/pets.dart';
import 'package:petapp/screens/new_pet_form_screen.dart';
import 'package:petapp/screens/pet_detail_screen.dart';
import 'package:petapp/screens/pets_list_screen.dart';
import 'package:petapp/screens/pets_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ChangeNotifierProvider(
    child: MaterialApp(
      title: 'PetApp',
      theme: ThemeData(
        accentColor: Color(0xFFFE7318),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: kBlack),
          bodyText1: TextStyle(color: kBlack),
          headline6: TextStyle(color: kBlack),
        ),
      ),
      home: PetsOverviewScreen(),
      routes: {
        PetsListScreen.route: (context) => PetsListScreen(),
        PetDetailScreen.routeName: (context) => PetDetailScreen(),
        NewPetFormScreen.routeName: (context) => NewPetFormScreen()
      },
    ),
    create: (context) => Pets(),
  ));
}
