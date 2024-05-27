import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waiter_restaurant_pos/dimensions.dart';
import 'dart:io' show Platform;

import 'package:waiter_restaurant_pos/views/menu_screen.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  final List<String> itemList = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gvTablesCrossAxisCount,
                  mainAxisSpacing: gvTablesAllAxisSpacing,
                  crossAxisSpacing: gvTablesAllAxisSpacing,
                  mainAxisExtent: gvTablesMainAxisExtent),
              itemBuilder: ((context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      const menuScreen = MenuScreen();
                      Navigator.push(
                          context,
                          Platform.isIOS
                              ? CupertinoPageRoute(
                                  builder: (context) => menuScreen)
                              : MaterialPageRoute(
                                  builder: (context) => menuScreen));
                    },
                    child: Center(child: Text(itemList[index])),
                  ),
                );
              }))),
    );
  }
}
