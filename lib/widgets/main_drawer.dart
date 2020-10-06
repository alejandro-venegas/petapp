import 'package:flutter/material.dart';
import 'package:petapp/app_constants.dart';
import 'package:petapp/widgets/main_drawer_nav_item.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: kBlack,
        textTheme: TextTheme(
          // headline1: TextStyle(color: Colors.white, fontSize: 19),
          // headline6: TextStyle(color: Colors.white, fontSize: 19),
          bodyText1: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://api.time.com/wp-content/uploads/2017/12/terry-crews-person-of-year-2017-time-magazine-2.jpg',
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Terrie Crew',
                              softWrap: true,
                            ),
                            Text('terrie@gmail.com'),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      MainDrawerNavItem(
                        icon: Icons.monetization_on_outlined,
                        title: 'Donation',
                      ),
                      MainDrawerNavItem(
                        icon: Icons.home_outlined,
                        title: 'Adoption',
                      ),
                      MainDrawerNavItem(
                        icon: Icons.favorite_border_outlined,
                        title: 'Favorites',
                      ),
                      MainDrawerNavItem(
                        icon: Icons.message_outlined,
                        title: 'Message',
                      ),
                      MainDrawerNavItem(
                        icon: Icons.person_outline,
                        title: 'Profile',
                      ),
                    ],
                  ),
                  Divider(),
                  MainDrawerNavItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                  )
                ],
              ),
            ),
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    );
  }
}
