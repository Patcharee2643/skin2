import 'package:flutter/material.dart';
// import 'package:test_final/page/add_pet.dart';
// import 'package:test_final/page/sold_pet.dart';
import 'package:skin2/page/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false, 
      title: 'Skin App',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('แอปตรวจโรคผิวหนัง',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 14, 177, 227),),
      body: HomeScreen(),
      
    );
  }
}
