import 'package:flutter/cupertino.dart';
import 'package:recipe_list/pages/preparation_steps.dart';


class MenuItem {

  String name;
  String imageUrl;
  String description;
  int difficultyRating;
  String origin;
  List<String> category;
  List<PreparationStep> preparationSteps;
  Duration duration;
  
  MenuItem({
    @required this.imageUrl,
    @required this.name,
    @required this.description,
    this.difficultyRating,
    this.origin,
    this.category,
    this.duration,
    @required this.preparationSteps
  });

}