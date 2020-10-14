import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/models/pet.dart';
import 'package:petapp/screens/pet_detail_screen.dart';

class PetListItem extends StatelessWidget {
  final Pet pet;
  PetListItem({this.pet});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(PetDetailScreen.routeName, arguments: pet),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kGrey, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    pet.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet.name,
                        style: TextStyle(
                            color: kBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
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
                          SizedBox(
                            width: 10,
                          ),
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
                      Text(
                        '${pet.description}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Visit Home',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ),
                        onTap: () => print('Hey'),
                        splashColor: kGrey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
