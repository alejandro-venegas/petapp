import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/providers/pets.dart';
import 'package:petapp/widgets/pet_list_item.dart';
import 'package:provider/provider.dart';

class PetsListScreen extends StatelessWidget {
  static const String route = '/pets-list-screen';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    final String breed = arguments['breed'];
    final String type = arguments['type'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: kBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          '$breed $type ',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Choose your $type',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: Consumer<Pets>(builder: (context, value, child) {
                final pets = value.getPetsByBreedAndType(breed, type);
                return ListView.builder(
                    itemBuilder: (context, index) => PetListItem(
                          pet: pets[index],
                        ),
                    itemCount: pets.length);
              }),
            )
          ],
        ),
      ),
    );
  }
}
