import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_list/model/menu_item.dart';
import 'package:recipe_list/pages/recipe_steps.dart';
import 'package:recipe_list/widgets/app_bar_back_button.dart';

class RecipeDetails extends StatefulWidget {

  final MenuItem item;
  RecipeDetails(this.item);

  @override
  State<StatefulWidget> createState() {
    return _RecipeDetailsState();
  }

}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    MenuItem item = this.widget.item;

    return Scaffold(
      body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * .45,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .5,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(80)),
                  color: Colors.green[600]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      item.name,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "PTSans",
                        fontSize: 45,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      item.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "PTSans",
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .45,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 13,
                    offset: Offset(0, 17))
              ],
              image: DecorationImage(
                  image: AssetImage(item.imageUrl), fit: BoxFit.cover),
            ),
          )),
          Positioned(
            top: MediaQuery.of(context).size.height * .41,
            left: 30,
            child: Container(
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  iconSize: 25,
                  color: Colors.green[600],
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    print("play icon pressed");
                  },
                )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .42,
            right: 30,
            child: Container(
              width: 130,
              height: 38,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                child: Text(
                  "RECIPE",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PTSans"),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RecipeSteps(item);
                    }
                  ));
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: AppBarBackButton(),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
