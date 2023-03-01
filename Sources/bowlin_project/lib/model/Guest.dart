import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'Player.dart';

class Guest extends Player {
  // Constructor
  Guest(Uuid id, String image, String name) : super(id, image, name);
}
