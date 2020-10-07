import 'package:flutter/cupertino.dart';
import 'package:petapp/models/pet.dart';

class PetListItem extends StatelessWidget {
  final Pet pet;
  PetListItem({this.pet});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFFeeeeee), width: 2)),
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
                  height: 70,
                  width: 70,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                    ),
                    Row(
                      children: [
                        Text('${pet.age} ${pet.ageUnit} old'),
                        Text('${pet.sex}'),
                      ],
                    ),
                    Text(
                      '${pet.description}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text('Visit Home')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
