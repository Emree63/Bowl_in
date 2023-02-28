import 'package:uuid/uuid.dart';

class Player {
  final Uuid _id;
  String _image;
  String _name;

  // Constructor
  Player(this._id, this._image, this._name);

  // Getters and setters
  Uuid get id => _id;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }
}
