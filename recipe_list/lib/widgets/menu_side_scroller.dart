import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/menu_item.dart';

/**
 * 
 */
class MenuSideScroller extends StatelessWidget {

  final List<MenuItem> menuItems;
  MenuSideScroller({@required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black12,
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
      items.add(new MenuItemContainer(item.imageUrl, item.name));
    }

    return <Widget> [
      SliverList(
        delegate: SliverChildListDelegate(items),
      ) 
    ];

  }

}

class MenuItemContainer extends StatelessWidget {
 
  final String url;
  final String name;

  MenuItemContainer(this.url, this.name);

  @override
  Widget build(BuildContext context) {

    return Container(
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
                image: DecorationImage(image: AssetImage(url))
              ),

            )
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                name, 
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16, fontFamily: "PTSans"),)
            ) 
          )
        ],
      ),
    );

  }

}
