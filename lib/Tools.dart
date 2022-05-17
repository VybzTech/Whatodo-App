// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names
//// ignore_for_file: prefer_const_constructors
//import 'package:flutter/material.dart';
//
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("David's Demo App"),
//        centerTitle: true,
//        backgroundColor: Colors.blue[700],
//      ),
//      body: Center(
//        /*
//TEXT EDITING
//        Text(
//          'This is a Paragraph',
//          style: TextStyle(
//              fontFamily: 'Montserrat',
//              fontSize: 35.0,
//              fontWeight: FontWeight.bold,
//              letterSpacing: 0.5),
//        ),
//        IMAGING
//        child: Image(
//          image: NetworkImage('Some Url'),
//        ),
//              Image(
//          image: AssetImage('Images/LOGO.png'),
//        ),
//
//        FLOATING BUTTON
//      floatingActionButton: FloatingActionButton(
//        child: Text('UP'),
//        onPressed: () => true,
//      ),
//        //IMAGE SHORTCUT
//        child: Image.asset('Images/LOGO.png'),
//
//          ICONS
//        child: Icon(
//          Icons.all_inclusive,
//          color: Colors.amberAccent[700],
//          size: 70.0,
//        ),
//        BUTTONS
//        child: RaisedButton(
//          child: Text("CLICK"),
//          onPressed: (){},
//          color: Colors.indigoAccent,
//        )
//    FLAT BUTTONS
//child: FlatButton(
//          child: Text("CLICK"),
//          onPressed: (){
//            print("Clicker");
//          },
//          color: Colors.indigoAccent,
//        ),
//          RAISED ICON BUTTON
//        child: RaisedButton.icon(
//          icon: Icon(
//            Icons.ac_unit,
//            color: Colors.lightBlue[50],
//          ),
//          onPressed: () {},
//          label: Text(
//            "CLICK ME",
//            style: TextStyle(
//              color: Colors.lightBlue[50],
//            ),
//          ),
//          color: Colors.indigoAccent[400],
//        ),
//
//        child: IconButton(
//          onPressed: () {
//            print("I've been clicked!");
//          },
//          icon: Icon(
//            Icons.ac_unit,
//            color: Colors.lightBlue,
//          ),
//        ),
//
//        // LAYOUOT WIDGETS
//        child: Container()
//
//        PADDING
//          padding: EdgeInsets.all(20.0),
//            padding: EdgeInsets.symmetric(horizontal - 20.0,  vertical - 10.0),
//padding: EdgeInsets.fromLTRB(20.0,5.0,15.0, 10.0),
//
//
//        // CONTAINER
//        child: Container(
//          color: Colors.grey[300],
//          padding: EdgeInsets.fromLTRB(20.0,5.0,15.0, 10.0),
//          margin: EdgeInsets.all(20.0),
//          child: Text(
//            "Test Text Over Here!",
//            style: TextStyle(
//              fontFamily: 'Mont',
//              fontSize: 50.0,
//            ),
//          ),
//        ),
//
//
//        PADDING CONTAINER
//        Padding(
//          child: Text("Lorem Ipsum"),
//          padding: EdgeInsets.fromLTRB(20.0, 5.0, 15.0, 10.0),
//        ),
//
//
//          ROW ELEMENTS
//child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children:
////TO specify add <Widget> here
//              [
//            Text('hello world'),
//            FlatButton(
//              onPressed: () {},
//              child: Text('Click me'),
//              color: Colors.amberAccent,
//            ),
//            Container(
//              color: Colors.grey[300],
//              padding: EdgeInsets.all(35.0),
//              child: Text(
//                "Test Text Over Here!",
//                style: TextStyle(
//                  fontFamily: 'Mont',
//                  fontSize: 15.0,
//                ),
//              ),
//            ),
//          ],
//        ),
//
// */
//        //COLUMN
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children:
////TO specify add <Widget> here
//              [
//            FlatButton(
//              onPressed: () {},
//              child: Text('Click me'),
//              color: Colors.amberAccent,
//            ),
//            Container(
//              color: Colors.grey[300],
//              padding: EdgeInsets.all(35.0),
//              child: Text(
//                "Test 1!",
//                style: TextStyle(
//                  fontFamily: 'Mont',
//                  fontSize: 15.0,
//                ),
//              ),
//            ),
//            Container(
//              color: Colors.grey[300],
//              padding: EdgeInsets.all(30.0),
//              child: Text(               "Test 2!",
//                style: TextStyle(
//                  fontFamily: 'Mont',
//                  fontSize: 17.0,
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//
///*
//
//MAIN
//
//
//* // ignore_for_file: prefer_const_constructors
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'Quotes.dart';
//import 'QuoteCard.dart';
//
////import 'pages/home.dart';
//import 'package:portfolio/pages/home.dart';
//import 'package:portfolio/pages/loading.dart';
//import 'package:portfolio/pages/location.dart';
//
//void main() => runApp(
//      MaterialApp(
////          home: Home(),
//        //this conflicts Routes
//        initialRoute: '/home',
//        routes: {
//          //DIFF ROUTES
//          //VAL RO ROUTES ARE FUNCTION THAT TAKE D CONTEXT OBJECTS AS ARG
//
//          "/": (context) => Loading(),
//          "/home": (context) => Home(),
//          "/location": (context) => Location(),
//        },
//      ),
//    );
//
//class QuoteList extends StatefulWidget {
//  @override
//  _QuoteState createState() => _QuoteState();
//}
//
//class _QuoteState extends State<QuoteList> {
//  List<Quote> quotes = [
//    Quote(author: 'Vybz', text: "Lorem Ipsum Test, One to go"),
//    Quote(author: 'Dharvo', text: "Lorem Ipsum Test, Two to go"),
//    Quote(author: 'Tech', text: "Lorem Ipsum Test, Three To go"),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.grey[300],
//      appBar: AppBar(
//        title: Text('Awesome Quotes'),
//        centerTitle: true,
//        foregroundColor: Colors.grey[300],
//        backgroundColor: Colors.red,
//      ),
//      body: Column(
////              Quotes.map((q) => Text('${q.text} :u- ${q.author}')).toList()),
////        children: quotes.map((q) =>  CardTemp(q)).toList(),
//
//        children: quotes
//            .map((q) => QuoteCard(q, () {
//                  setState(() {
//                    quotes.remove(q);
//                  }); //Setstate
//                }))
//            .toList(),
//
////          Quotes.map(
////          (q) =>
////              CardTemp(q))
//      ),
//    );
//  }
//}
//
//*
//*NINJA
//
//import 'package:flutter/material.dart';
//
//class Ninja extends StatefulWidget {
//  @override
//  State<Ninja> createState() => _NinjaState();
//}
//
//class _NinjaState extends State<Ninja> {
//  int Level = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.grey[700],
//      appBar: AppBar(
//        title: Text('Hey Ninja !'),
//        centerTitle: true,
//        backgroundColor: Colors.grey[800],
//        elevation: 0.1,
//      ),
//      body: Padding(
//        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Center(
//              child: CircleAvatar(
//                backgroundImage: AssetImage('Images/LOGO.png'),
//                radius: 35.0,
//                backgroundColor: Colors.grey[300],
//              ),
//            ),
//            Divider(
//              height: 80.0,
//              color: Colors.grey[750],
//            ),
//            Text(
//              'NAME: ',
//              style: TextStyle(
//                color: Colors.grey,
//                letterSpacing: 1.5,
//              ),
//            ),
//            SizedBox(height: 10.0),
//            Text(
//              'DJ VYBZ',
//              style: TextStyle(
//                color: Colors.lightBlueAccent[100],
//                fontWeight: FontWeight.bold,
//                fontSize: 25.0,
//                fontFamily: "Mont",
//                letterSpacing: 1.5,
//              ),
//            ),
//            SizedBox(height: 30.0),
//            Text(
//              'NINJA LEVEL: ',
//              style: TextStyle(
//                color: Colors.grey,
//                letterSpacing: 1.5,
//              ),
//            ),
//            // ignore: prefer_const_constructors
//            SizedBox(height: 10.0),
//            Text(
//              '$Level',
//              style: TextStyle(
//                color: Colors.lightBlueAccent[100],
//                fontWeight: FontWeight.bold,
//                fontSize: 25.0,
//                fontFamily: "Mont",
//                letterSpacing: 1.5,
//              ),
//            ),
//            SizedBox(height: 30.0),
//            Row(
//              children: [
//                Icon(
//                  Icons.email,
//                  color: Colors.lightBlueAccent[100],
//                ),
//                Padding(
//                  padding:
//                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
//                  child: Text(
//                    'adedave77@gmail.com',
//                    style: TextStyle(
//                        color: Colors.lightBlueAccent,
//                        fontSize: 15.5,
//                        fontFamily: "Mont"),
//                  ),
//                )
//              ],
//            ),
////            Test()
//          ],
//        ),
//      ),
//
//      //SETSTATE
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            Level += 7;
//          });
//        },
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//}
//
//*
//*QUOTES
//class Quote {
////Create a class to describe a new object
//
////Donot set the value just instantiate the quote
//  dynamic  text;
//  dynamic author;
//
//  //Create the constructor
//  //Takes the values when we call class and sets em in the Quote class
//
////  Quote( String text, author){
////  this.text = text;
////  this.author = author;
////}
//
//  //Use named parameters
//Quote( { this.text, this.author });
////  Quote({this.text, this.author});
////Create a new Quote
////Quote myquote = Quote('This is the Quote','some author');
//
////Use named parameters
////Quote myquote2 = Quote(author: "some author",text: 'This is the Quote' );
//}
//
//*
//
//
//*
//*QUOTECARD
//
//import 'package:flutter/material.dart';
//import 'Quotes.dart';
//
//class QuoteCard extends StatelessWidget {
//
// final Quote quote;
//  dynamic delete;
//  QuoteCard(this.quote, this.delete);
//// QuoteCard({this.quote, this.delete});
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
//      child: Padding(
//        padding: const EdgeInsets.all(15.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: [
//            Text(quote.text,
//                style: TextStyle(
//                  fontSize: 18.0,
//                  color: Colors.blueGrey[800],
//                )),
//            SizedBox(width: 10.0),
//            Text(quote.author,
//                style: TextStyle(
//                  fontSize: 17.0,
//                  color: Colors.blueGrey[400],
//                )),
//            SizedBox(
//              width: 20.0,
//            ),
//            TextButton.icon(
//              label: Text("DELETE QUOTE"),
//              icon: Icon(
//                Icons.delete,
//              ),
//              onPressed: delete,
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//*
//*HOME
//
//// ignore_for_file: prefer_const_constructors
//import 'package:flutter/material.dart';
//
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: Column(
//          children: [
//            FlatButton.icon(
//                onPressed: () {
//                  Navigator.pushNamed(context, "/location");
//                },
//                icon: Icon(Icons.edit_location),
//                label: Text("Choose Your Location"))
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//*
//*
//LOADING
//// ignore_for_file: prefer_const_constructors
//import 'package:flutter/material.dart';
//
////import 'package:http/http.dart';
//import 'dart:convert';
//
//class Loading extends StatefulWidget {  @override  _LoadingState createState() => _LoadingState();
//}
//
//class _LoadingState extends State<Loading> {
//  void getData() async {
//    //Make a Request
//
////    Response res = await get("link to api Information");
//
//    //  Map Decoded Information
////    Map data = jsonDecode(res.body);
////    print(data['title']);
//    print('data title');
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(child: Text('Loading Screen')),
//    );
//  }
//}
//
//
//
//
//
//
//
//*
//LOCATION
//// ignore_for_file: prefer_const_constructors
//import 'package:flutter/material.dart';
//
//class Location extends StatefulWidget {
//  @override
//  _LocationState createState() => _LocationState();
//}
//
//class _LocationState extends State<Location> {
//  /*
//  void getData() {
//    //Simulate Result from database
//    Future.delayed(Duration(seconds: 3), () {
//      print("Vybz");
//    });
//
//    //Duration Object
//    //Duration(seconds: 3) , Gives a timeout before firing function
//
//  } //GetData Function  Printing User Info accordingly
//  void getData() async {
//    String user = await Future.delayed(Duration(seconds: 3), () {
//      return "Vybz";
//    });
//    String bio = await Future.delayed(Duration(seconds: 2), () {
//      return "React developer, Disc Jockey, Chef, Swimmer, Programmmer";
//    });
//    print("$user is a $bio");
//  } //GetData Function  Printing asyncronously
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    print('Init has Loaded');
//    getData();
//  }
//
//*/
//  int counter = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    print('Build has Loaded');
//
//    return Scaffold(
//      backgroundColor: Colors.grey[100],
//      appBar: AppBar(
//        backgroundColor: Colors.blue[900],
//        title: Text('LOCATION WAY'),
//        centerTitle: true,
//        elevation: 0.0,
//      ),
//      body: TextButton(
//          child: Text('INCREMENT, COZ COUNTER IS $counter '),
//          onPressed: () {
//            setState(() {
//              counter += 5;
//            });
//          }),
//    );
//  }
//}
//
//
////    print(indexDay.toString());
////    print(DateFormat('EEE').format(indexDay).toUpperCase());
////    DateFormat('EEE').format(indexDay).toUpperCase();
//
// //NO OF DAYS IN D MONTH
////    print(DateTime(today.year, today.month +1, 0).day);//30
////    print(DateTime(today.year, today.month +1, 1));//
////    print(today.toString()); //2022-04-02 14:31:14.480868
////    print(DateFormat.Hms().format(today));//14:31:14
////    print(DateTime(today.year, today.month +1,1).day);//1
////    print(DateFormat('M').format(today));//4
////    print(DateFormat('MMMMEEEEd').format(today));//Saturday, April 2
////    print(DateFormat('yMEd').format(today));//Sat, 4/2/2022
////    print(DateFormat('yyyy-MM-dd-kk:mm').format(today));//Sat, 4/2/2022
////    print(DateFormat('LLL').format(today));//Apr
//// DateFormat('EEE').format(today).toUpperCase(), //Sat
////    print(DateFormat('LLLL').format(today));//April
////    print(DateFormat('MMMMd').format(today));//April 2
////    print(DateFormat('Md').format(today));//4/2
////    print(DateFormat('MMMM').format(today));//April
////for(i=0,i<10,i++){};
////  for(DateTime indexDay = DateTime(today.year, today.month ,1);
////  indexDay.month==today.month;
////  indexDay = indexDay.add(Duration(days:1))){
//////    print(indexDay.toString());
////    print(DateFormat('EEE').format(indexDay).toUpperCase());
////    print(DateFormat('d').format(indexDay).toUpperCase());
////
////  }
//    //Return iteration of Current Month of April as DateTime Type
//
// if (today.day==index) {
////                return DatePill(
////                    date: index,
//////                    day: week.keys.elementAt(index)
////                    day: DateFormat('EEE').format(today).toUpperCase(),
//////                week.keys.elementAt(index)
////                );
////              } else {
////                return
//////                Container(
//////                  margin: const EdgeInsets.only(right: 13.0),
//////                  padding: const EdgeInsets.symmetric(
//////                      vertical: 10.0, horizontal: 10.0),
//////                  child: Column(
//////                    mainAxisAlignment: MainAxisAlignment.center,
//////                    crossAxisAlignment: CrossAxisAlignment.center,
//////                    children: [
//////                      SansText(
//////                        text: week.keys.elementAt(index),
//////                        size: S-.5,
//////                        weight: FontWeight.w400,
//////                      ),
//////                      SizedBox(
//////                        height: 4.0,
//////                      ),
//////                      MontText(
//////                        text: index.toString(),
//////                        size: M,
//////                        weight: FontWeight.w400,
//////                      ),
//////                    ],
//////                  ),
//////                );
////              }
