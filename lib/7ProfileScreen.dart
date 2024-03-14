import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '1main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 40, 177, 145),
          title: const Text("Profile Screen"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 40, 178, 145),
                ),
                child: Text(
                  'User Information Screen',
                  textAlign: TextAlign.right,
                ),
              ),
              ListTile(
                title: Text(
                  'This screen shows the information about user. \n ',
                  textAlign: TextAlign.left,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text("Name:",
                  style: TextStyle(
                    fontSize: 24,
                  )),
              Text(
                "Surname:",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "Authority:",
                style: TextStyle(fontSize: 24),
              ),//function are here
              ElevatedButton(
                  child: Text("F1"),
                  onPressed: () async {
                    final conn = PostgreSQLConnection(ip, 5432, 'products',
                        username: 'postgres', password: '23042001');
                        await conn.open();
                        conn.query('''SELECT "products"."calculatehowmanyday"(100,20);''');
                  }),
              ElevatedButton(
                  child: Text("F2"),
                  onPressed: () async {
                    final conn = PostgreSQLConnection(ip, 5432, 'products',
                        username: 'postgres', password: '23042001');
                        await conn.open();
                        conn.query('''SELECT "products"."calculatemoney"(150,30);''');
                  }),
              ElevatedButton(
                  child: Text("F3"),
                  onPressed: () async {
                    final conn = PostgreSQLConnection(ip, 5432, 'products',
                        username: 'postgres', password: '23042001');
                        await conn.open();
                        conn.query('''SELECT "products"."decreaseamounthundred"(200);''');
                  }),
              ElevatedButton(
                  child: Text("F4"),
                  onPressed: () async {
                    final conn = PostgreSQLConnection(ip, 5432, 'products',
                        username: 'postgres', password: '23042001');
                        await conn.open();
                        conn.query('''SELECT "products"."increaseamounthundred"(100);''');
                  }),
            ],
          ),
        ));
  }
}
