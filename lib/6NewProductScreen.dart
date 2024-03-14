import 'package:flutter/material.dart';

import '1main.dart';
import 'package:postgres/postgres.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => NewProductScreenstate();
}

class NewProductScreenstate extends State<NewProductScreen> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void save1 (String marka, int id, String aciklama, int stokmiktari) async{
    userlistesi.add({
      "marka": marka,
      "id": id,
      "aciklama": aciklama,
      "stokmiktari": stokmiktari,
    });
    final conn = PostgreSQLConnection(ip, 5432, 'products',username:'postgres',password:'23042001' );
  await conn.open();
  await conn.query('''
    INSERT INTO "products"."products" (amount,brand,description,qu)
    VALUES ($stokmiktari,'$marka','$aciklama',$id)
  ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 40, 177, 145),
          title:  Text('New Product Add',
            ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               DrawerHeader(
                decoration:  BoxDecoration(
                color: Color.fromARGB(255, 40, 177, 145),
                ),
                child: Text('Information About New Product Add Screen',

                textAlign: TextAlign.right,),
              ),
              ListTile(
                title:  Text(
                  'This screen is going to be used for adding new products.\n\nIn order to add new products you must enter each information which textfield tells what information is neccesery.\n\nAfter insert information, you must press save button as well. ',

                textAlign: TextAlign.left,
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
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Marka giriniz: ',
                        ),
                        controller: myController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'id giriniz: ',
                          ),
                          controller: myController2,
                          keyboardType: TextInputType.number),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'aciklama giriniz: ',
                        ),
                        controller: myController3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'stok miktarı giriniz: ',
                          ),
                          controller: myController4,
                          keyboardType: TextInputType.number),
                    ),
                    const Divider(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 17, 81, 66) ;
                               
                          }
                          return const Color.fromARGB(255, 40, 177,145);
                        },
                      ),
                    ),
                        
                        onPressed: () { //ınsert operation
                          var qty = int.tryParse(myController2.text);
                          var qty2 = int.tryParse(myController4.text);
                          save1(myController.text, qty!, myController3.text,
                              qty2!);
                          myController.clear();
                          myController2.clear();
                          myController3.clear();
                          myController4.clear();

                          setState(() {});
                        },
                        child: const Text("kaydet")),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
