import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Mr Cassiel"),
              accountEmail: Text("faleyecassiel005@gmail.com"),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: AssetImage('assets/guy.jpg'))),
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
    );
  }
}
