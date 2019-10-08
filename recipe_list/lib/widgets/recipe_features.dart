import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_list/model/menu_item.dart';

class RecipeFeatures extends StatelessWidget {
  final MenuItem item;

  RecipeFeatures(this.item);

  @override
  Widget build(BuildContext context) {
    int rating = item.difficultyRating;
    int durationInMinutes = item.duration.inMinutes;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.blueGrey, width: .4),
                )
              ),
              child: Text(
                item.origin,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "PTSans", fontSize: 18, color: Colors.black54),
              ),
            ) ,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.blueGrey, width: .4),
                )
              ),
              child: Text(
                "$rating/10",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "PTSans", fontSize: 18, color: Colors.black54),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              "$durationInMinutes mins",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "PTSans", fontSize: 18, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
