import 'package:flutter/material.dart';
import 'package:recipe_list/model/food_subcategory.dart';
import 'package:recipe_list/model/helpers/samples.dart';
import 'package:recipe_list/model/origin.dart';
import 'package:recipe_list/widgets/menu_side_scroller.dart';
import 'package:recipe_list/model/menu_item.dart';

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

void main() => runApp(MyApp());

String sampleText =
    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..''';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorObservers: <NavigatorObserver>[routeObserver]
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
      child: CustomScrollView(scrollDirection: Axis.vertical, slivers: slivers(),),
    ));
  }

  List<Widget> slivers() {
    List<Widget> slivers = List<Widget>();
    slivers.add(SliverAppBar(
      pinned: false,
      // expandedHeight: 80.0,
      title: Text(
        'Foodie',
        style: TextStyle(fontSize: 36, fontFamily: "Playfair"),
        
      ),
    ));

    slivers.add(SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "YOUR FAVOURITES",
              style: TextStyle(fontSize: 15, fontFamily: "PTSans"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MenuSideScroller(menuItems: <MenuItem>[
                MenuItem(
                    name: "Epic Salad",
                    imageUrl: "assets/images/anna-pelzer.jpg",
                    duration: Duration(minutes: 25),
                    description: sampleText,
                    difficultyRating: 6,
                    origin: Origin.Chinese,
                    category: [FoodSubCategory.Dinner, FoodSubCategory.Lunch, FoodSubCategory.Vegetarian],
                    preparationSteps: Samples.preparationSteps(),
                ),
                MenuItem(
                    name: "Burger Town",
                    imageUrl: "assets/images/chicken-burger.jpg",
                    description: sampleText,
                    difficultyRating: 3, 
                    duration: Duration(minutes: 20),
                    origin: Origin.UnitedStates,
                    category: [FoodSubCategory.FastFood, FoodSubCategory.Dinner, FoodSubCategory.Lunch],
                    preparationSteps: Samples.preparationSteps()),
                MenuItem(
                    name: "Sweet, Sweet Cereal",
                    imageUrl: "assets/images/dan-counsell.jpg",
                    duration: Duration(minutes: 5),
                    difficultyRating: 1,
                    origin: Origin.English,
                    category: [FoodSubCategory.BreakFast],
                    description: sampleText, 
                    preparationSteps: Samples.preparationSteps())
              ])),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "CONSIDER THESE BAD BOYS",
              style: TextStyle(fontSize: 15, fontFamily: "PTSans"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MenuSideScroller(menuItems: <MenuItem>[
                MenuItem(
                    name: "So Much Chicken",
                    imageUrl: "assets/images/Dredge-Chicken-in-Glaze.jpg",
                    duration: Duration(hours: 1, minutes: 20),
                    description: sampleText,
                    difficultyRating: 6, 
                    origin: Origin.UnitedStates,
                    category: [FoodSubCategory.Dinner, FoodSubCategory.SpecialOccasions],
                    preparationSteps: Samples.preparationSteps()),
                MenuItem(
                    name: "Pasta Mia!!",
                    imageUrl: "assets/images/eaters.jpg",
                    duration: Duration(minutes: 40),
                    origin: Origin.Italian,
                    difficultyRating: 5,
                    category: [FoodSubCategory.Lunch, FoodSubCategory.Dinner],
                    description: sampleText,
                    preparationSteps: Samples.preparationSteps()),
                MenuItem(
                    name: "Nooooodles",
                    imageUrl: "assets/images/img-20160516.jpg",
                    description: sampleText,
                    difficultyRating: 7,
                    origin: Origin.Chinese,
                    category: [FoodSubCategory.Lunch, FoodSubCategory.Dinner],
                    duration: Duration(minutes: 25),
                    preparationSteps: Samples.preparationSteps())
              ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MenuSideScroller(menuItems: <MenuItem>[
                MenuItem(
                    name: "Namaste!!",
                    imageUrl: "assets/images/TOFU_NOODLES.jpg",
                    duration: Duration(minutes: 40),
                    difficultyRating: 7,
                    origin: Origin.Chinese,
                    category: [FoodSubCategory.Soup, FoodSubCategory.Vegetarian],
                    description: sampleText, 
                    preparationSteps: Samples.preparationSteps()),
              ])),
        ],
      ),
    ));

    return slivers;
  }
}
