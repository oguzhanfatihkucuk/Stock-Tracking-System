// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '1main.dart';
import '4MarketScreen.dart';

//MarketScreen
class ListTileExample extends StatelessWidget {
  final int id;
  final String aciklama;
  final String urunadi;
  final int stokMiktari;

  const ListTileExample({
    super.key,
    required this.urunadi,
    required this.id,
    required this.aciklama,
    required this.stokMiktari,
  });

  @override
  Widget build(BuildContext context) {
    print("database has been connected successfully");
    return SizedBox(
        width: 500,
        height: 65,
        child: ListTile(
            style: ListTileStyle.list,
            contentPadding: const EdgeInsets.all(8),
            enabled: id == 0 ? false : true,
            title: Text(" $urunadi (Urun Kodu:$id)   Stok:$stokMiktari",
                ),
            tileColor: Color.fromARGB(255, 212, 255, 230),
            subtitle: Text(aciklama),

            //await conn.query('DELETE FROM "products"."products" WHERE qu > 5');
            trailing: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(255, 17, 81, 66)
                          /*Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(1)*/
                          ;
                    }
                    return const Color.fromARGB(
                        255, 40, 177, 145); // Use the component's default.
                  },
                ),
              ),
              label: Text(id == 0 ? " " : "delete"),
              key: GlobalKey(),
              onPressed: () => () {
                //deleteProduct
              },
              icon: Icon(
                id == 0 ? Icons.block : Icons.delete,
              ),
            )));
  }

  /*void deleteProduct() async {  //delete operation
    final conn = PostgreSQLConnection(ip, 5432, 'products',
        username: 'postgres', password: '23042001');
    await conn.open();
    await conn.query('DELETE FROM "products"."products" WHERE qu = $id');
    results[id].clear;
    print(results);
  }*/
}

//EnteranceSCreen
class TextFieldExample extends StatelessWidget {
  final String text;
  const TextFieldExample({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      decoration: InputDecoration(
        border: InputBorder.none,
        //labelText: '$text ',
        hintText: '$text ',
      ),
    );
  }
}

//SearchSceen
class TextFieldExamples extends StatefulWidget {
  const TextFieldExamples({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<TextFieldExamples> createState() => TextFieldExamplesub();
}

//SearchSceen
class TextFieldExamplesub extends State<TextFieldExamples> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: false,
      slivers: <Widget>[
        SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Expanded(
                    flex: 0,
                    child: TextField(
                      onSubmitted: (value) async {
                        final conn = PostgreSQLConnection(ip, 5432, 'products',
                            username: 'postgres', password: '23042001');
                        await conn.open();
                        setState(() {
                          i = int.parse(value);
                          /*var results = await conn.query(
                              'SELECT * FROM products.products WHERE qu =$i-1');*/
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('System is bringing information... '),
                          ),  
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "Urun id giriniz",
                      ),
                    ),
                  ),//search operation is here
                  const Divider(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Girmis Oldugunuz Id'li Urunun Markasi: " +
                        results[i - 1][1],
                    ),
                    //userlistesi[i - 1]["marka"]
                  ),
                  const Divider(
                    height: 20,
                  ),
                  TextField(
                      onSubmitted: (value) async {
                        final conn = PostgreSQLConnection(ip, 5432, 'products',
                            username: 'postgres', password: '23042001');
                        await conn.open();
                        await conn.query(
                            '''UPDATE "products"."products" SET brand='$value' WHERE qu = ($i)''');
                        setState(() {
                          //userlistesi[i - 1]["marka"] = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data has been saved'),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          label: const Text("Urunun yeni markasini giriniz"),
                          alignLabelWithHint: false)),
                  const Divider(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Girmis Oldugunuz Id'li Urunun Aciklamasi: " +
                        results[i - 1][0],
                      ),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  TextField(
                      onSubmitted: (value) async {
                        final conn = PostgreSQLConnection(ip, 5432, 'products',
                            username: 'postgres', password: '23042001');
                        await conn.open();
                        await conn.query(
                            '''UPDATE "products"."products" SET description='$value' WHERE qu = ($i)''');
                        setState(() {
                          //userlistesi[i - 1]["aciklama"] = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data has been saved'),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        label: const Text("Urunun yeni aciklamasini giriniz"),
                        alignLabelWithHint: true,
                      )),
                  const Divider(
                    height: 40,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                          "Girmis Oldugunuz Id'li Urunun Stok Miktari:" +
                              results[i - 1][2].toString(),
                        )),
                  const Divider(
                    height: 20,
                  ),
                  TextField(
                      controller: myController9,
                      onSubmitted: (value) async {
                        final conn = PostgreSQLConnection(ip, 5432, 'products',
                            username: 'postgres', password: '23042001');
                        await conn.open();
                        await conn.query(
                            '''UPDATE "products"."products" SET amount='$value' WHERE qu = ($i)''');
                        setState(() {
                          /*userlistesi[i - 1]["stokmiktari"] =
                              int.tryParse(value);*/
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data has been saved'),
                            ),
                          );
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          label:
                              const Text("Urunun yeni stokmiktarini giriniz"),
                          alignLabelWithHint: true)),
                ],
              ),
            ))
      ],
    );
  }
}
