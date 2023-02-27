import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'Achievement.dart';

class Player {

  final Uuid _id;
  String _image;
  String _name;

  User(this._id, this._image, this._name);

  get id => _id;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

}
