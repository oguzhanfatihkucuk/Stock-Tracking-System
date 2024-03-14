import 'package:flutter/material.dart';
import '2EnteranceScreen.dart';
import 'package:postgres/postgres.dart';

void main() async {
  runApp(const MyApp());

  final conn = PostgreSQLConnection(ip, 5432, 'products',username:'postgres',password:'23042001' );
  await conn.open();
  print("database has been connected successfully");
}
var ip='192.168.56.1';
final myController = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();
final myController6 = TextEditingController();
final myController7 = TextEditingController();
final myController8 = TextEditingController();
final myController9 = TextEditingController();

var var3 = 0;
int i = 1;

List<Map<String, dynamic>> rawData = [
  {
    "marka": "marka 1",
    "id": 1,
    "aciklama": "aciklama1",
    "stokmiktari": 100,
  },
  {
    "marka": "marka 2",
    "id": 2,
    "aciklama": "aciklama2",
    "stokmiktari": 200,
  },
  {
    "marka": "marka 3",
    "id": 3,
    "aciklama": "aciklama3",
    "stokmiktari": 300,
  },
  {
    "marka": "marka 4",
    "id": 4,
    "aciklama": "aciklama4",
    "stokmiktari": 400,
  },
  {
    "marka": "marka 5",
    "id": 5,
    "aciklama": "aciklama5",
    "stokmiktari": 500,
  },
  {
    "marka": "marka 6",
    "id": 6,
    "aciklama": "aciklama6",
    "stokmiktari": 600,
  },
  {
    "marka": "marka 7",
    "id": 7,
    "aciklama": "aciklama7",
    "stokmiktari": 700,
  },
  {
    "marka": "marka 8",
    "id": 8,
    "aciklama": "aciklama8",
    "stokmiktari": 800,
  },
  {
    "marka": "marka 9",
    "id": 9,
    "aciklama": "aciklama9",
    "stokmiktari": 900,
  },
  {
    "marka": "marka 10",
    "id": 10,
    "aciklama": "aciklama10",
    "stokmiktari": 1000,
  },
  {
    "marka": "marka 11",
    "id": 11,
    "aciklama": "aciklama11",
    "stokmiktari": 1100,
  },
  {
    "marka": "marka 12",
    "id": 12,
    "aciklama": "aciklama4",
    "stokmiktari": 1200,
  },
];

List userlistesi = rawData;

class User {
  final String marka;
  final String aciklama;
  final int id;
  final int stokmiktari;

  User(this.marka, this.aciklama, this.id, this.stokmiktari);

  User.fromJson(Map<String, dynamic> json)
      : marka = json['marka'],
        aciklama = json['aciklama'],
        id = json['id'],
        stokmiktari = json['stokmiktari'];

  Map<String, dynamic> toJson() => {
        'name': marka,
        'aciklama': aciklama,
        'id': id,
        'stokmiktari': stokmiktari,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '   ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.green,
      ),
      home: const MyHomePage(title: '  '),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List userlistesi = rawData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const EntranceScreen(),
    );
  }
}
