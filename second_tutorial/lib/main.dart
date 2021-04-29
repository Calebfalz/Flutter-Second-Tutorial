import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Mr Cassiel"),
                  accountEmail: Text("faleyecassiel005@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/guy.jpg'))),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Mr Caleb'),
                subtitle: Text("Developer"),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text("faleyecassiel@gmail.com"),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                leading: Icon(Icons.confirmation_number),
                title: Text('Phone Number'),
                subtitle: Text("234549393"),
                trailing: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(3),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    'assets/guy.jpg',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    myText,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Some Text",
                        labelText: "Name",
                      ),
                    ),
                  )
                ],
              ),
            ),
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
