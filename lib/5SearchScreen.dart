import 'package:flutter/material.dart';

import 'widget.dart';
import 'package:postgres/postgres.dart';
class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});
  @override
  State<SearchScreens> createState() => _SearchScreensState();
  
}


class _SearchScreensState extends State<SearchScreens> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Search and Update Screen',
        ),
        backgroundColor: Color.fromARGB(255, 40, 177, 145)
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 40, 177, 145),
              ),
              child: Text(
                'Information About List of Search and Update Screen',

                textAlign: TextAlign.right,
              ),
            ),
            ListTile(
              title:  Text(
                'This screen is giong to be used for searching products ordered id numbers.\n\nIn order to get information a certain products you must enter correct id number.\n\nOnce you decided to change any information about a product, you must search the product.\n\nOnce information came to screen, you are able to change information which belongs to products.\n\nYou are responsible for clicking save button after you enter new information.',

                textAlign: TextAlign.left,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
          child: TextFieldExamples( //search operation
        id: "3",
      ),),
    );
  }
}
