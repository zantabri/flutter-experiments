import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_list/model/menu_item.dart';
import 'package:recipe_list/pages/recipe_details.dart';

class MenuSideScroller extends StatelessWidget {

  final List<MenuItem> menuItems;
  MenuSideScroller({@required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: buildSlivers(),
      ),
    );
    
  }
      
  buildSlivers() {
    
    List<Widget> items = List();

    for (var item in menuItems) {
      items.add(new MenuItemContainer(item));
    }

    return <Widget> [
      SliverList(
        delegate: SliverChildListDelegate(items),
      ) 
    ];

  }

}

class MenuItemContainer extends StatelessWidget {
 
  final MenuItem menuItem;

  MenuItemContainer(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(menuItem.name);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RecipeDetails(menuItem)
        ));
      },
      child: Container(
        width: 200,
        height: 240,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(image: AssetImage(menuItem.imageUrl))
                ),
              )
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  menuItem.name, 
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 16, fontFamily: "PTSans"),)
              ) 
            )
          ],
        ),
    ),
  );

  }

}
