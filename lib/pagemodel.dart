import 'package:flutter/material.dart';

class PageModel {

  String _title;
  String _description;
  String _image;
  IconData _icon;

  PageModel(this._image, this._icon, this._description, this._title);
  
  String get image => _image;
  String get title => _title;
  String get description => _description;
  IconData get icon => _icon;
}
