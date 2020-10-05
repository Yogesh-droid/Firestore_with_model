import 'package:firestore_with_model/MyData.dart';
import 'package:firestore_with_model/New_Class.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyData myData;
  List<String>names=[];
  List<String>surname=[];
  List<MyData>list=[];
  final nameController=TextEditingController();
  final surnameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text('Material App Bar'),
    ),
    body: Container(
    child:
      Column(
    children: [
    TextField(controller:nameController,decoration: InputDecoration(labelText: 'name'),),
    TextField(controller:surnameController,decoration: InputDecoration(labelText: 'name'),),
    RaisedButton(child: Text('input'),
    onPressed: (){
    Map<String,dynamic> myMap={'Name':nameController.text,'Surname':surnameController.text};
    saveData(myMap);
    },),
    SizedBox(height: 50,),
    RaisedButton(child: Text('output'),
    onPressed: (){
    extractData();
    },),
    RaisedButton(child: Text('output'),
    onPressed: (){
    showData(context,list);
    },),

    ],
    )
    )
        );
  }
  Future<void> extractData()async {
    FirebaseFirestore.instance.collection('a').get().then((value) {
      value.docs.forEach((element) {
        Map<String,dynamic>newMap=element.data();
        print(newMap);
        setState(() {
          myData=new MyData.fromJson(newMap);
          list.add(myData);
        });
      });
    });
  }
  void saveData(Map myMap) {
    FirebaseFirestore.instance.collection('a').add(myMap);
  }

  void showData(BuildContext context,List<MyData>list) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>New_Class(list)));

  }

}

