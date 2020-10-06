import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petapp/providers/pets.dart';

class BreedGridItem extends StatelessWidget {
  final Breed breed;
  final String type;
  BreedGridItem(this.breed, this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              breed.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black26,
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${breed.quantity} $type${breed.quantity > 1 ? 's' : ''}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      breed.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
