import 'package:flutter/material.dart';
import '3Kindodemo.dart';
import 'widgetlibrary.dart';


class EntranceScreen extends StatelessWidget {
  const EntranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 177,145),
        
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 480 - 250,
              left: 40,
              right: 40,
              height: 75,
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  //decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0),),
                  alignment: Alignment.topRight,
                  width: 350,
                  height: 70,
                  color: Colors.black45,
                  child: const Text(
                    "  Market Stock System",
                    style: TextStyle(color: Colors.white, fontSize: 48),
                  )),
            ),
            Positioned(
              bottom: 375 - 200,
              left: 25,
              right: 25,
              height: 50,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.topRight,
                width: 350,
                height: 110,
                color: Colors.white,
                child: const TextFieldExample(text: "Kullanici adi"),
              ),
            ),
            Positioned(
              bottom: 300 - 200,
              left: 25,
              right: 25,
              height: 50,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.topRight,
                width: 350,
                height: 70,
                color: Colors.white,
                child: const TextFieldExample(text: "Sifre"),
              ),
            ),
            Positioned(
              bottom: 225 - 200,
              left: 260,
              right: 25,
              height: 50,
              child: Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.topRight,
                width: 150,
                height: 70,
                color: Colors.white,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KindoDemoScreen(
                                  title: 'A',
                                )),
                      );
                    },
                    child: const Text("Enter System")),
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
