# flutter_app_review
 How to Implement App Review Feature in Flutter Application

## Introduction:
 In this article we will learn how to implement how to implement app review feature in flutter app. To add review feature in flutter application we will use app_review plugin. In Android app review will redirect you to google play store and in iOS it will open popup for app to review. So let’s start implementing it.

## Output:

![Flutter App Review](https://raw.githubusercontent.com/myvsparth/flutter_app_review/master/screenshots/1.jpg)

## Methods:
1. AppReview.getAppID: This method will return the application id
2. AppReview.storeListing: This method is for Android app review and it will redirect user to google play store for review the app.
3. AppReview.requestReview: This method is for iOS app and it will open popup to review the app.

## Plugin Required:
> app_review: ^1.0.0

## Steps:
 Step 1: First and basic step to create new application in flutter. If you are a beginner in flutter then you can check my blog Create a first app in Flutter. I have created an app named as “flutter_app_review”.

 Step 2: Now, We will configure intro_views_flutter plugin in pubspec.yaml file.
dependencies:
```
 flutter:
   sdk: flutter
 cupertino_icons: ^0.1.2
 app_review: ^1.0.0
```

 Step 3: Now, we will implement app review for Android and iOS both. All the above explained methods will be implemented in the main.dart file. Following is the programming implementation for that.
```
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
```

 Hurrey…. Run the app and Test It on emulator/simulator or device :)))

## Conclusion:
 We have learnt how to implement app review feature in the flutter application.

> Git Repo: https://github.com/myvsparth/flutter_app_review

## Related to Tags: Flutter, App Review, Android, iOS
