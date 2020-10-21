class Pet {
  String id;
  String name;
  int age;
  String ageUnit;
  String description;
  String sex;
  String breed;
  String type;
  String imageUrl;

  Pet(
      {this.id,
      this.name,
      this.age,
      this.ageUnit,
      this.description,
      this.sex,
      this.imageUrl,
      this.breed,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'ageUnit': ageUnit,
      'description': description,
      'sex': sex,
      'imageUrl': imageUrl,
      'breed': breed,
      'type': type
    };
  }
}
