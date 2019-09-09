import 'package:flutter/material.dart';
import 'package:app_review/app_review.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String appID = "";
  String output = "";
  @override
  void initState() {
    super.initState();
    AppReview.getAppID.then((onValue) {
      setState(() {
        appID = onValue;
      });
      print("App ID" + appID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Review'),
      ),
      body: SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Container(
              height: 40.0,
            ),
            new ListTile(
              leading: new Icon(Icons.info),
              title: new Text('App ID'),
              subtitle: new Text(appID),
              onTap: () {
                AppReview.getAppID.then((onValue) {
                  setState(() {
                    output = onValue;
                  });
                  print(onValue);
                });
              },
            ),
            new Divider(
              height: 20.0,
            ),
            new ListTile(
              leading: new Icon(
                Icons.shop,
              ),
              title: new Text('View Store Page'),
              onTap: () {
                AppReview.storeListing.then((onValue) {
                  setState(() {
                    output = onValue;
                  });
                  print(onValue);
                });
              },
            ),
            new Divider(
              height: 20.0,
            ),
            new ListTile(
              leading: new Icon(
                Icons.star,
              ),
              title: new Text('Request Review'),
              onTap: () {
                AppReview.requestReview.then((onValue) {
                  setState(() {
                    output = onValue;
                  });
                  print(onValue);
                });
              },
            ),
            new Divider(
              height: 20.0,
            ),
            new ListTile(
              leading: new Icon(
                Icons.note_add,
              ),
              title: new Text('Write a New Review'),
              onTap: () {
                AppReview.writeReview.then((onValue) {
                  setState(() {
                    output = onValue;
                  });
                  print(onValue);
                });
              },
            ),
            new Divider(
              height: 20.0,
            ),
            new ListTile(
              title: new Text(output),
            ),
          ],
        ),
      ),
    );
  }
}