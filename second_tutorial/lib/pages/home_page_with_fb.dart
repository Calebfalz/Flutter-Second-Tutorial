import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:second_tutorial/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:second_tutorial/pages/login_page.dart';
import 'package:second_tutorial/utils/constants.dart';

class HomePageFb extends StatefulWidget {
  const HomePageFb({Key key}) : super(key: key);
  static const String routeName = "/home";

  @override
  _HomePageFbState createState() => _HomePageFbState();
}

class _HomePageFbState extends State<HomePageFb> {
  var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController();
  var url = 'https://jsonplaceholder.typicode.com/photos';

  Future fetchData() async {
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    return data;
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
          title: Text("Future Builder App"),
        ),
        drawer: MyDrawer(),
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("fetch something"),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text("Some Erro Occured"));
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data[index]['title']),
                        subtitle: Text("ID: ${snapshot.data[index]['id']}"),
                        leading: Image.network(snapshot.data[index]['url']),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );

                break;
              default:
            }
          },
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
