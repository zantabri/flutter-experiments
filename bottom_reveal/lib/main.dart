import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Reveal',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.pink),
      home: MyHomePage(title: 'Bottom Reveal Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  AnimationController _animationController;
  bool _activated;
  
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _activated = false;
    _animationController?.dispose();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
  }

  void _animateList() {
    
    if(_activated) {
    _animationController.reverse();
    setState(() {
      _activated = false;
    });
    } else {
    _animationController.forward();
    setState(() {
      _activated = true;
    });
    }

  }


  @override
  Widget build(BuildContext context) {
    
    Animation animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-80, -160)
    ).animate(_animationController.drive(CurveTween(curve: Curves.elasticInOut)));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          BackgroundLayer(), 
          HoveringList(animation)
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateList,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BackgroundLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Flexible(
            flex: 7,
            child:Container(
                decoration: BoxDecoration(color: Colors.purple[900]),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.video_call),
                      color: Colors.white,
                      onPressed: () {
                        //do nothing
                      },
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.image),
                      color: Colors.white,
                      onPressed: () {
                        //do nothing
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.camera),
                      iconSize: 50,
                      color: Colors.white,
                      onPressed: () {
                        //do nothing
                      },
                    ),
                  ],
                )
            ),
          ),
          Flexible(
            flex: 1,
          child: Container(
          height: 80,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
            color: Colors.purple.shade900,
          ),
          child: BackgroundSearchBar(),
        ),
          )
      ],
    );
  }
}

class BackgroundButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.video_call),
            color: Colors.white,
            onPressed: () {
              //do nothing
            },
          ),
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.image),
            color: Colors.white,
            onPressed: () {
              //do nothing
            },
          ),
          IconButton(
            icon: Icon(Icons.camera),
            iconSize: 50,
            color: Colors.white,
            onPressed: () {
              //do nothing
            },
          ),
        ],
      ),
    );
  }
}

class BackgroundSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      width: 300,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: TextField(
        keyboardType: TextInputType.text,

        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white.withOpacity(0.7),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            )),
      ),
    );
  }
}

class HoveringList extends AnimatedWidget {

  final Animation _animation;
  HoveringList(this._animation) : super(listenable: _animation);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: _animation.value.dy,
        left: _animation.value.dx,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              return Item("Item $i");
            },
            itemCount: 13,
          ),
        ));
  }
}

class Item extends StatelessWidget {
  final String _text;
  Item(this._text);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        elevation: 3,
        child: ListTile(
          title: Text(_text,
            style: TextStyle(
                color: Colors.black87, fontFamily: "Muli", fontSize: 15)
          ),
          leading: Icon(Icons.cloud_circle),

        )
        
    );
  }
}

