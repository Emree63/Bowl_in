import 'dart:math';

import 'Player.dart';

const _images = [
  "./assets/images/image_user_cyan.png",
  "./assets/images/image_user_red.png",
  "./assets/images/image_user_yellow.png",
  "./assets/images/image_user_pink.png",
  "./assets/images/image_user_orange.png",
  "./assets/images/image_user_green.png",
  "./assets/images/image_user_purple.png",
];

class Guest extends Player {
  // Constructor
  Guest(String name) : super(name, _images[Random().nextInt(_images.length)]);
}
