import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/widgets/main_drawer.dart';

class NewPetFormScreen extends StatefulWidget {
  static const String routeName = '/new-pet';
  @override
  _NewPetFormScreenState createState() => _NewPetFormScreenState();
}

class _NewPetFormScreenState extends State<NewPetFormScreen> {
  final _formKey = GlobalKey();
  String ageUnit = 'year';
  String type;
  String imageUrl = '';
  FocusNode nameInputFocusNode;
  FocusNode ageInputFocusNode;
  FocusNode breedInputFocusNode;
  FocusNode imageUrlInputFocusNode;
  FocusNode descriptionInputFocusNode;

  @override
  void initState() {
    nameInputFocusNode = FocusNode();
    nameInputFocusNode.addListener(() {
      setState(() {});
    });
    ageInputFocusNode = FocusNode();
    ageInputFocusNode.addListener(() {
      setState(() {});
    });
    breedInputFocusNode = FocusNode();
    breedInputFocusNode.addListener(() {
      setState(() {});
    });
    imageUrlInputFocusNode = FocusNode();
    imageUrlInputFocusNode.addListener(() {
      setState(() {});
    });
    descriptionInputFocusNode = FocusNode();
    descriptionInputFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameInputFocusNode.dispose();
    ageInputFocusNode.dispose();
    breedInputFocusNode.dispose();
    imageUrlInputFocusNode.dispose();
    descriptionInputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(
          color: kBlack,
        ),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'New Pet',
            style: TextStyle(color: kBlack),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: MainDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length > 20) {
                    return 'Name must be less than 20 characters long';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => ageInputFocusNode.requestFocus(),
                focusNode: nameInputFocusNode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      color: nameInputFocusNode.hasFocus
                          ? Theme.of(context).accentColor
                          : Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a number';
                        } else if (int.parse(value) < 1) {
                          return 'The age must be greater than zero';
                        }
                        return null;
                      },
                      focusNode: ageInputFocusNode,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Age',
                        labelStyle: TextStyle(
                            color: ageInputFocusNode.hasPrimaryFocus
                                ? Theme.of(context).accentColor
                                : Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(child: Text('Years'), value: 'year'),
                        DropdownMenuItem(
                          child: Text('Months'),
                          value: 'month',
                        )
                      ],
                      onChanged: (value) => setState(() => ageUnit = value),
                      value: ageUnit,
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Type'),
                items: [
                  DropdownMenuItem(child: Text('Dog'), value: 'dog'),
                  DropdownMenuItem(child: Text('Cat'), value: 'cat'),
                ],
                onChanged: (value) => setState(() => type = value),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                focusNode: breedInputFocusNode,
                onFieldSubmitted: (_) => imageUrlInputFocusNode.requestFocus(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length > 40) {
                    return 'Breed must be less than 40 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Breed',
                  labelStyle: TextStyle(
                      color: breedInputFocusNode.hasPrimaryFocus
                          ? Theme.of(context).accentColor
                          : Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          descriptionInputFocusNode.requestFocus(),
                      focusNode: imageUrlInputFocusNode,
                      validator: (value) {
                        var regExp = RegExp(
                            r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$");
                        if (value.isEmpty) {
                          return 'Please enter an URL';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Breed must be less than 40 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Image URL',
                        labelStyle: TextStyle(
                            color: imageUrlInputFocusNode.hasPrimaryFocus
                                ? Theme.of(context).accentColor
                                : Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      onChanged: (value) => setState(() => imageUrl = value),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textInputAction: TextInputAction.newline,
                focusNode: descriptionInputFocusNode,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      color: descriptionInputFocusNode.hasPrimaryFocus
                          ? Theme.of(context).accentColor
                          : Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
