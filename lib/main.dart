

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
  home:MyApp()
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
             home:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
         image:AssetImage('assets/bg1.jpg'), fit: BoxFit.cover)),
      child:Scaffold(
        backgroundColor:Colors.transparent,
        appBar:AppBar(
        title:Text("DICE ROLLER"),
        backgroundColor:const Color(0xFF4834DF),
        ),//appbar
        drawer:Drawer(
        child:ListView(
          children:<Widget>[
            ListTile(
              title:SafeArea(
                child:Text("HOME",style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
                ),), //textstyle,text
              ), //safearea
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => MyApp()),
                );//navigator
              },//ontap
            ),//listtile
            ListTile(
              title:SafeArea(
                child:Text("1 DIE",style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
                ),), //textstyle,text
              ), //safearea
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => SecondRoute()),
                );//navigator
              },//ontap
            ),//listtile
            ListTile(
              title:SafeArea(
                child:Text("2 DICE",style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
                ),), //textstyle,text
              ), //safearea
               onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => ThirdRoute()),
                );//navigator
              },//ontap
            ),//listtile
             ListTile(
              title:SafeArea(
                child:Text("ABOUT US",style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
                ),), //textstyle,text
              ), //safearea
               onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => FourthRoute()),
                );//navigator
              },//ontap
             ),//listtile
          ],//widget
        ),//listview
        ),//drawer
        body:Container(
          margin: const EdgeInsets.only(top: 50.0),
          child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children:<Widget>[
            FlatButton(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)
          ),
              textColor: Colors.white,
              color: Colors.red,
              child: Text('1 DIE',style:TextStyle(
                fontSize:50,
              )),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => SecondRoute()),
                );//navigator
              },
            ),
          FlatButton(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)
          ),
              textColor: Colors.white,
              color: Colors.yellow,
              child: Text('2 DICE',style:TextStyle(
                fontSize:50,
              )),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => ThirdRoute()),
                );//navigator
              },
            ),
       ],//widget
      ),//row
        ),
      ),//scaffold
        ),
      
    );//materialapp
  }//build
}//firstroute

class SecondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
         image:AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar:AppBar(
          title:Text("1 DIE"),
          backgroundColor:const Color(0xFF4834DF),
        ),//appbar
        body:DicePage1(),
      ),//scaffold
      ),
    );//safearea
  }//build
}//secondroute

class ThirdRoute extends StatelessWidget{
  @override
 Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
         image:AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar:AppBar(
          title:Text("2 DICE"),
          backgroundColor:const Color(0xFF4834DF),
        ),//appbar
        body:DicePage(),
      ),//scaffold
      ),
    );//safearea
  }//build
}//thirdroute

class FourthRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child:Scaffold(
        appBar:AppBar(
          title:Text("ABOUT US"),
          backgroundColor:const Color(0xFF4834DF),
        ),//appbar
        body:Container(
          color: const Color(0xFFA4B0BD),
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child:Container(
            padding:const EdgeInsets.all(8),
            alignment:Alignment.center,
            width:100,
            height:100,
            child:Text("Developed by Muskan Maheshwari",
               style:TextStyle(
                 color:Colors.teal,
                 fontWeight:FontWeight.bold,
                 fontSize:18,
              ),//Textstyle
             ),//text
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              boxShadow:[BoxShadow(color:Colors.grey[400],blurRadius:5, offset:Offset(2.0,5.0))],
              color:const Color(0xFFEAF0F1),
              gradient:LinearGradient(colors:[Colors.grey,Colors.white],)
            ),//box decoration
          ),//container
        ),//container
      ),//scaffold
    );//safearea
  }//build
}//fourthroute

class DicePage extends StatefulWidget{
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin{
  var upperDice = 1;
  var lowerDice = 1;
  AnimationController _controller;
  CurvedAnimation animation;
  
  @override
  void initState(){
    super.initState();
    animate();
  }
  
  animate(){
    _controller = AnimationController(duration: Duration(seconds:1),vsync: this);
    animation=CurvedAnimation(parent: _controller,curve:Curves.bounceOut);
    animation.addListener((){
      setState((){
        
      });
      print(_controller.value);});
    animation.addStatusListener((status) {if(status==AnimationStatus.completed){
      setState((){
      upperDice = Random().nextInt(6)+1;
      lowerDice = Random().nextInt(6)+1;
    });
      print("completed");
      _controller.reverse();
    }});
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  
  void diceOne(){
    _controller.forward();
  }
  
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
    child:Center(
      child:Column(
        children:<Widget>[
          Expanded(
            child:GestureDetector(
            onTap:(){
              diceOne();
            },
            child:Center(
          child:Padding(
            padding:const EdgeInsets.all(50),
            child:Image(height:200-animation.value*200,
              image:AssetImage('assets/dice$upperDice.png'),
          ),),),),),
           Expanded(
          child:GestureDetector(
            onTap:(){
              diceOne();
            },
            child:Center(
             child:Padding(
            padding:const EdgeInsets.all(50),
            child:Image(height:200-animation.value*200,
              image:AssetImage('assets/dice$lowerDice.png'),
          ),),),),),
        ],
      )
    ),);
  }
}

class DicePage1 extends StatefulWidget{
  @override
  _DicePageState1 createState() => _DicePageState1();
}

class _DicePageState1 extends State<DicePage1> with SingleTickerProviderStateMixin{
  var upperDice = 1;
  AnimationController _controller;
  CurvedAnimation animation;
  
  @override
  void initState(){
    super.initState();
    animate();
  }
  
  animate(){
    _controller = AnimationController(duration: Duration(seconds:1),vsync: this);
    animation=CurvedAnimation(parent: _controller,curve:Curves.bounceOut);
    animation.addListener((){
      setState((){
        
      });
      print(_controller.value);});
    animation.addStatusListener((status) {if(status==AnimationStatus.completed){
      setState((){
      upperDice = Random().nextInt(6)+1;
    });
      print("completed");
      _controller.reverse();
    }});
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  
  void diceOne(){
    _controller.forward();
  }
  
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
    child:Center(
      child:Column(
        children:<Widget>[
          Expanded(
            child:GestureDetector(
            onTap:(){
              diceOne();
            },
            child:Center(
              child:Padding(
              padding:const EdgeInsets.all(50),
              child:Image(height:200-animation.value*200,
              image:AssetImage('assets/dice$upperDice.png'),
          ),),),),
            ),
        ],
      )
    ),);
  }
}

