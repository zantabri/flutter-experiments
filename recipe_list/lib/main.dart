import 'package:flutter/material.dart';
import 'package:recipe_list/widgets/menu_side_scroller.dart';
import 'package:recipe_list/widgets/model/menu_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
              scrollDirection: Axis.vertical, slivers: slivers())),
    );
  }

  List<Widget> slivers() {
    List<Widget> slivers = List<Widget>();
    slivers.add(SliverAppBar(
      pinned: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          print("checking");
        },
        iconSize: 50
      ),
      expandedHeight: 80.0,
      flexibleSpace: FlexibleSpaceBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Your customised\n',
                  style: TextStyle(fontSize: 10, fontFamily: "PTSans", height: 1.2),
                  children: <TextSpan>[
                    TextSpan(text: 'Breakfast', style: TextStyle(fontSize: 20,fontFamily: "Playfair")),
                  
                  ],
                ),
              )
            ],
          )
        ),
      )
    );

    slivers.add(SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "YOUR FAVOURITES",
            style: TextStyle(fontSize: 15, fontFamily: "PTSans"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MenuSideScroller(menuItems: <MenuItem> [
            MenuItem(
              name: "Epic Salad",
              imageUrl: "assets/images/anna-pelzer.jpg",
              description: "Epic salad."
            ),
            MenuItem(
              name: "Burger Town",
              imageUrl: "assets/images/chicken-burger.jpg",
              description: "Burger Town."
            ),
            MenuItem(
              name: "Sweet, Sweet Cereal",
              imageUrl: "assets/images/dan-counsell.jpg",
              description: "Sweet, Sweet, Cereal."
            )
          ])
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "CONSIDER THESE BAD BOYS",
            style: TextStyle(fontSize: 15, fontFamily: "PTSans"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MenuSideScroller(menuItems: <MenuItem> [
            MenuItem(
              name: "So Much Chicken",
              imageUrl: "assets/images/Dredge-Chicken-in-Glaze.jpg",
              description: "So Much Chicken."
            ),
            MenuItem(
              name: "Pasta Mia!!",
              imageUrl: "assets/images/eaters.jpg",
              description: "Pasta Mia!!"
            ),
            MenuItem(
              name: "Nooooodles",
              imageUrl: "assets/images/img-20160516.jpg",
              description: "Nooooodles."
            )
          ])
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MenuSideScroller(menuItems: <MenuItem> [
            MenuItem(
              name: "Namaste!!",
              imageUrl: "assets/images/TOFU_NOODLES.jpg",
              description: "Namaste!!"
            ),
          ])
        ),
      ],
      ),
    ));

    return slivers;
  }
}
