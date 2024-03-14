import 'dart:ui';
import 'package:flutter/material.dart';
import '1main.dart';

import 'widget.dart';
import 'package:postgres/postgres.dart';
import '1main.dart';

void sayhi() {
  print("hi");
}
var results;
List<int> _id = [];
List<int> _stokmiktari = [];
List<String> _marka = [];
List<String> _aciklama = [];
bool pass = false;

class MarketScreenState extends StatefulWidget {
  const MarketScreenState({
    Key? key,
  }) : super(key: key);
  @override
  State<MarketScreenState> createState() => MarketScreen();
}

class MarketScreen extends State<MarketScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 177, 145),
        title: Text(
          'List of Market Products',

        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 177, 145),
              ),
              child: Text(
                'Information About List of Market Products Screen',

                textAlign: TextAlign.right,
              ),
            ),
            ListTile(
              title: Text(
                'This screen shows products that market has.\n\nEach products has a specific id number, name of product, a description, amonut of stock.\n\nClicking on "delete" button, you can delete products. \n\nIn order to see new list of produts after deleting process, you must press refresh button.',

                textAlign: TextAlign.left
                ,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 17, 81, 66);
                          }
                          return const Color.fromARGB(255, 40, 177,145);
                        },
                      ),
                    ),
                    onPressed: () async {

                      final conn = PostgreSQLConnection(
                          ip, 5432, 'products',
                          username: 'postgres', password: '23042001');
                      await conn.open();
                      results = await conn
                          .query('SELECT* FROM "products"."products"');
                      setState(() {  //List of Products
                        pass = true;
                        for (i = 0; i <results.length;i++) {
                          if (results[i][3] == 0) {
                            print("bos");
                          } else {
                            _aciklama.add(results[i][0]);
                            _marka.add(results[i][1]);
                            _stokmiktari.add(results[i][2]);
                            _id.add(results[i][3]);
                          }
                        }
                        for (i = 0; i <results.length; i++) {
                          if (results[i][3] == 0) {
                            print("bos");
                          } else {
                            ListTileExample(
                              id: _id[i],
                              aciklama: _aciklama[i],
                              urunadi: _marka[i],
                              stokMiktari: _stokmiktari[i],
                              key: GlobalKey(),
                            );
                          }
                        }
                      });
                    },
                    child: Text(
                      "Click To Refresh List",

                    ),
                  ),
                  if (pass)
                    for (i = 0; i <results.length; i++)
                      if (_id[i] != 0 || _id[i]!=0)
                        ListTileExample(
                          id: _id[i],
                          aciklama: _aciklama[i],
                          urunadi: _marka[i],
                          stokMiktari: _stokmiktari[i],
                          key: GlobalKey(),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
