import 'package:flutter/foundation.dart';
import 'package:petapp/models/pet.dart';

class Breed {
  final String name;
  int quantity;
  final String imageUrl;

  Breed({this.name, this.quantity, this.imageUrl});
}

class Pets extends ChangeNotifier {
  List<Pet> _pets = [
    Pet(
        name: 'Fluffy',
        age: 2,
        ageUnit: 'year',
        description: 'He is a very friendly cat',
        type: 'cat',
        id: 'f2y',
        sex: 'male',
        breed: 'Persian',
        imageUrl:
            'https://www.catster.com/wp-content/uploads/2018/11/persian-cat-face.jpg'),
    Pet(
        name: 'Padme',
        age: 8,
        ageUnit: 'month',
        description: 'A very beautiful and funny cat',
        type: 'cat',
        id: 'p8m',
        sex: 'female',
        breed: 'Persian',
        imageUrl:
            'https://www.hospitalveterinariglories.com/wp-content/uploads/2020/06/26-06-20-gato-persa.jpg'),
    Pet(
        name: 'Bruno',
        age: 5,
        ageUnit: 'year',
        description: 'He is very funny and loving',
        type: 'dog',
        id: 'b5y',
        sex: 'male',
        breed: 'Dutch Smoushound',
        imageUrl:
            'https://www.furrycritter.com/pages/assets/img/dogs/dutch_smoushond.jpg'),
    Pet(
        name: 'Chiquita',
        age: 10,
        ageUnit: 'year',
        description: 'A very grumpy but intelligent chihuahua',
        type: 'dog',
        id: 'c10y',
        sex: 'female',
        breed: 'Chihuahua',
        imageUrl:
            'https://media.istockphoto.com/photos/chihuahua-standing-and-looking-at-camera-against-white-background-picture-id877369552?k=6&m=877369552&s=612x612&w=0&h=0sswqSlPj2Gdwn9bHnvS8j-rd50f48CDiX8C9xoFtR0='),
    Pet(
        name: 'Phillip',
        age: 2,
        ageUnit: 'year',
        description: 'A very small and cute chihuahua',
        type: 'dog',
        id: 'p2y',
        sex: 'female',
        breed: 'Chihuahua',
        imageUrl:
            'https://www.zooplus.es/magazine/wp-content/uploads/2017/03/schwarz-chihuahua-1024x683.jpgR'),
    Pet(
        name: 'Maya',
        age: 3,
        ageUnit: 'year',
        description: 'She was found on a mountain surviving by her self',
        type: 'cat',
        id: 'm3y',
        sex: 'female',
        breed: 'Mixed/Unknown',
        imageUrl:
            'https://static.scientificamerican.com/sciam/cache/file/92E141F8-36E4-4331-BB2EE42AC8674DD3_source.jpg'),
  ];

  List<Pet> get pets {
    return _pets;
  }

  List<Breed> breeds() {
    List<Breed> groupedByBreeds = [];
    _pets.forEach((pet) {
      var breedIndex =
          groupedByBreeds.indexWhere((element) => element.name == pet.breed);
      if (breedIndex >= 0) {
        groupedByBreeds[breedIndex].quantity += 1;
      } else {
        groupedByBreeds
            .add(Breed(name: pet.breed, quantity: 1, imageUrl: pet.imageUrl));
      }
    });

    return groupedByBreeds;
  }
}