import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_list/pages/preparation_steps.dart';

/**
 * 
 */
class StepListTile extends StatelessWidget {

  final PreparationStep step;
  final int index;

  StepListTile(this.step, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .2,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            alignment: Alignment.topCenter,
            child: Container(
              height: 36,
              width: 36,
              constraints: BoxConstraints(
                maxHeight: 36,
                maxWidth: 36
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "$index",
                style: TextStyle(
                  fontFamily: "PTSans",
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .75,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
              step.title, 
              style: TextStyle(
                fontFamily: "PTSans",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
            Text(
              step.content,
              softWrap: true,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "PTSans",
                fontSize: 16,
                color: Colors.black87
              ),
            )
            ],
          ),
          )
         
      ],
    );
  }

}