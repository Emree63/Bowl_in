class Player {
  final int _id;
  String _name;
  String _image;

  // Constructor
  Player(this._id, this._name, this._image);

  // Getters and setters
  int get id => _id;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }
}
