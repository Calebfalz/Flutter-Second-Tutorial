import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:second_tutorial/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:second_tutorial/pages/login_page.dart';
import 'package:second_tutorial/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController();
  var url = 'https://jsonplaceholder.typicode.com/photos';
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool('loggedIn', false);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              },
            ),
          ],
          title: Text("Awesome App"),
        ),
        drawer: MyDrawer(),
        body: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index]['title']),
                      subtitle: Text("ID: ${data[index]['id']}"),
                      leading: Image.network(data[index]['url']),
                    ),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myText = _nameController.text;
            setState(() {
              myText = _nameController.text;
            });
          },
          child: Icon(Icons.send),
        ),
        backgroundColor: Colors.grey[200]);
  }
}
