import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/models/pet.dart';

class PetDetailScreen extends StatelessWidget {
  static const routeName = '/pet-detail';
  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context).settings.arguments;
    return Material(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        pet.imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned.directional(
                      textDirection: TextDirection.ltr,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.of(context).pop(),
                        color: kBlack,
                      ),
                      start: 10,
                      top: MediaQuery.of(context).padding.top,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                pet.name,
                style: TextStyle(
                    fontSize: 30, color: kBlack, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
