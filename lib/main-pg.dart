import 'package:bloc_exercise/_counter.dart';
import 'package:flutter/material.dart';
import 'package:bloc_exercise/_readInput.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Ex6',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HomePage', style: TextStyle(fontSize: 30),),
        ),      
      body: Center(
        child: Column(                
          mainAxisAlignment: MainAxisAlignment.center,          
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),              
              child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyInputApp()),
                  );
                }, child: Text('Type Page',style: TextStyle(fontSize: 30,),),
              ),            
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCounter()),
                      );
              }, child: Text('Counter Page', style: TextStyle(fontSize: 30,),),
            ) 
            )
                     
          ],
        ),
      ),
    ));
  }
}
