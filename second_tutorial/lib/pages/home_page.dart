import 'package:flutter/material.dart';
import 'package:second_tutorial/drawer.dart';
import 'package:second_tutorial/name_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Awesome App"),
        ),
        drawer: MyDrawer(),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(3),
          child: SingleChildScrollView(
            child:
                NameCardWidget(myText: myText, nameController: _nameController),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myText = _nameController.text;
            setState(() {
              myText = _nameController.text;
            });
          },
          child: Icon(Icons.send),
        ),
        backgroundColor: Colors.grey[600]);
  }
}
