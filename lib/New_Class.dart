import 'package:firestore_with_model/MyData.dart';
import 'package:flutter/material.dart';

class New_Class extends StatelessWidget {
  List<MyData>list;

  New_Class(this.list);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(child:
          ListView.builder(
              itemCount: list.length,
              itemBuilder:(BuildContext context,int index){
                return Text(list.elementAt(index).getName());
              }),
          )
        ),
      ),
    );
  }
}
