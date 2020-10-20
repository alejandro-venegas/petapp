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
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF2755),
                        ),
                        height: 5,
                        width: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          '${pet.age} ${pet.ageUnit}${pet.age > 1 ? 's' : ''} old'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF665DB0),
                        ),
                        height: 5,
                        width: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${pet.sex}'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kGrey, width: 2)),
                  child: Text(pet.description, textAlign: TextAlign.justify),
                ),
              ),
              TextButton(
                child: Text('Visit Home'),
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Theme.of(context).accentColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
