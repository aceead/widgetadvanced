import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _x = GlobalKey<ScaffoldState>();
  String titleText = "Wight Test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _x,
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: Center(
        //child: buildFlatButton(context),
        //child: CustomAppBar(),
        // child: RaisedButton(
        //   child: Text('Click Me!'),
        //   onPressed: () {
        //     buildDialog(context);
        //   },
        // ),
        child: RaisedButton(
          child: Text('Show SnackBar'),
          onPressed: () {
            setState(() {
              titleText = "Test";
            });
            final sBar = SnackBar(
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
                textColor: Colors.white,
              ),
              content: Text('SnackBar'),
              duration: Duration(milliseconds: 6000),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            );
            _x.currentState.showSnackBar(sBar);
          },
        ),
      ),
    );
  }

  void buildDialog(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      title: Text('Alert Dialog'),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Divider(color: Colors.black),
            Text('Text Alert Dialog'),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.redAccent,
                child: Text('Close', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.tealAccent,
      builder: (context) {
        return alert;
      },
    );
  }

  CustomScrollView CustomAppBar() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.only(left: 1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle),
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurpleAccent,
                Colors.pink,
                Colors.deepPurpleAccent,
              ]),
            ),
          ),
          title: Text(
            "Widget Test",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            //body element
          ]),
        )
      ],
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      onPressed: () => showToast(context),
      child: buildRichText(),
    );
  }

  void showToast(BuildContext context) {
    Toast.show(
      'Pink/Amber',
      context,
      duration: Toast.LENGTH_LONG,
      textColor: Colors.amber,
      backgroundColor: Colors.pink,
      backgroundRadius: 4,
    );
  }

  RichText buildRichText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Pink',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.pink),
          ),
          TextSpan(
            text: '/',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Amber',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
