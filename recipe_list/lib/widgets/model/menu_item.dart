import 'package:flutter/cupertino.dart';

class MenuItem {

  String name;
  String imageUrl;
  String description;
  double difficultyRating;
  String category;
  double duration;

  MenuItem({
    @required this.imageUrl,
    @required this.name,
    @required this.description,
    this.difficultyRating,
    this.category,
    this.duration
   });

}