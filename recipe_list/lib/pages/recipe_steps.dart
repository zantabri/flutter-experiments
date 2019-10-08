import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_list/model/menu_item.dart';
import 'package:recipe_list/pages/preparation_steps.dart';
import 'package:recipe_list/widgets/app_bar_back_button.dart';
import 'package:recipe_list/widgets/recipe_features.dart';
import 'package:recipe_list/widgets/step_list_tile.dart';

class RecipeSteps extends StatefulWidget {
  final MenuItem item;

  RecipeSteps(this.item);

  @override
  State<StatefulWidget> createState() {
    return _RecipeStepsState();
  }
}

class _RecipeStepsState extends State<RecipeSteps> {
  @override
  Widget build(BuildContext context) {
    MenuItem item = this.widget.item;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: slivers(item),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> slivers(MenuItem item) {
    List<Widget> slivers = List();
    slivers.add(SliverAppBar(
      leading: AppBarBackButton(color: Colors.black45),
      backgroundColor: Colors.white..withOpacity(.4),
      
      pinned: true,
      actions: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[600],
              ),
              child: Icon(Icons.play_arrow, size: 14)
            ),
            Text(
              "Watch Recipe",
              style: TextStyle(
                fontFamily: "PTSans", 
                fontSize: 16,
                color: Colors.black87
              ),
            )
          ],
        )
        
      ],
    ));
    
    slivers.add(SliverList(
      key: UniqueKey(),
      delegate: SliverChildListDelegate(
        <Widget> [
          Container(
            child: Text(
              item.name,
              style: TextStyle(
                fontFamily: "PTSans", 
                fontSize: 38,
                color: Colors.black87
              ),
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              item.description,
              style: TextStyle(
                fontFamily: "PTSans", 
                fontSize: 20,
                color: Colors.black87
              ),
            )
          ),
          RecipeFeatures(item)
        ]
      ),
    ));

    slivers.add(SliverList(

      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          PreparationStep step = item.preparationSteps[index];
          int i = index++;
          return StepListTile(step,i);
        },
        childCount: item.preparationSteps.length
      ),
    ));

    return slivers;
  }
}
