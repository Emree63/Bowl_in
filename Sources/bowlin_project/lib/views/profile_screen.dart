import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/achievements_list_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.45,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xff19BDE0),
                Color(0xff4A17DC),
              ]))),
      Align(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/image_profile.png"),
          )),
          child: Center(
              child: Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )),
        ),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
              ListAchievementWidget(nbUnlocked: 1),
              Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ProfileWidget()),
            ],
          )),
    ]);
  }
}
