import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '某音',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[500]),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.black),
            child: BtmBar(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          height: 120,
          width: screenWidth,
          child: Container(
            //decoration: BoxDecoration(color: Colors.pinkAccent),
            child: TopTab(),
          ),
        ),
        Positioned(
          bottom: 0,
          width: 0.7 * screenWidth,
          height: 120,
          child: Container(
            //decoration: BoxDecoration(color: Colors.redAccent),
            child: BtnContext(),
          ),
        ),
        Positioned(
          right: 0,
          height: 0.6 * screenHeight,
          width: 0.2 * screenWidth,
          top: 0.3 * screenHeight,
          child: Container(
            //decoration: BoxDecoration(color: Colors.grey),
            child: ButtonList(),
          ),
        ),
        Positioned(
          bottom: 20,
          //width: 0.25 * screenWidth,
          //height: 0.25 * screenWidth,
          right: 0,
          child: Container(
            //decoration: BoxDecoration(color: Colors.purpleAccent),
            child: RotateAlbum(),
          ),
        )
      ],
    );
  }
}

class TopTab extends StatefulWidget {
  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            width: 240,
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w800),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey[700], fontSize: 20),
              controller: _controller,
              tabs: <Widget>[
                Text("关注"),
                Text("推荐"),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Icon(
            Icons.live_tv,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class BtmBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '首页',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '同城',
            style: TextStyle(color: Colors.white),
          ),
          AddIcon(),
          Text(
            '消息',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '我',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AddIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 35,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BtnContext extends StatelessWidget {
  Widget _buildMarquee() {
    return Marquee(
      text: 'There once was a boy who told this story about a boy: "',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              '@人民日报',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'feawfjawelkfjawlfjaweffewafwaefawefawefawefawefawefawefawefwef,feawfjawelkfjawlfjaweffewafwaefawefawefawefawefawefawefawefwef',
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Icon(Icons.music_note),
              //_buildMarquee(),
            ],
          )
        ],
      ),
    );
  }
}

class RotateAlbum extends StatefulWidget {
  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: animation,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.forward(from: 0.0);
          }
        }),
      child: Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2791362459,3529865990&fm=26&gp=0.jpg'),
        ),
      ),
    );
    _controller.forward(from: 0.0);
  }
}

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize:MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: 45,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg"),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(7)),
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
        IconText(
          icon: Icon(
            Icons.favorite_border,
            size: 55,
            color: Colors.redAccent,
          ),
          text: '999.5W',
        ),
        IconText(
          icon: Icon(
            Icons.feedback,
            size: 55,
            color: Colors.white,
          ),
          text: '999.5W',
        ),
        IconText(
          icon: Icon(
            Icons.reply,
            size: 55,
            color: Colors.white,
          ),
          text: '999.5W',
        ),
      ],
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({Key key, this.icon, this.text}) : super(key: key);
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
