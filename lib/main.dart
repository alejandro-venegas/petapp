import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/providers/pets.dart';
import 'package:petapp/screens/pets_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MaterialApp(
        title: 'PetApp',
        theme: ThemeData(
          accentColor: Color(0xFFFE7318),
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBlack),
            bodyText1: TextStyle(color: kBlack),
          ),
        ),
        home: ChangeNotifierProvider(
          child: PetsOverviewScreen(),
          create: (context) => Pets(),
        ),
      ),
    );
