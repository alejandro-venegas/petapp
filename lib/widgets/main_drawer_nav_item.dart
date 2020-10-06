import 'package:flutter/material.dart';

class MainDrawerNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  MainDrawerNavItem({this.icon, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
