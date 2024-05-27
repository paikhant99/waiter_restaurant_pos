import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waiter_restaurant_pos/constants.dart';
import 'package:waiter_restaurant_pos/dimensions.dart';
import 'dart:io' show Platform;

import 'package:waiter_restaurant_pos/views/tables_screen.dart';

class PassScreen extends StatefulWidget {
  const PassScreen({super.key});

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  var _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: sbPasscodeWidth,
          child: TextField(
            controller: _myController,
            onChanged: (value) {
              setState(() {
                _myController = _myController;
              });
            },
            autofocus: true,
            obscureText: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: _myController.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          if (_myController.text == abPasscode) {
                            const tablesScreen = TablesScreen();
                            Navigator.push(
                                context,
                                Platform.isIOS
                                    ? CupertinoPageRoute(
                                        builder: (context) => tablesScreen)
                                    : MaterialPageRoute(
                                        builder: (context) => tablesScreen));
                          }
                        },
                        icon: Icon(Platform.isIOS
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_forward_rounded)),
                labelText: tfPasscodeLabel),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              if (value == abPasscode) {
                const tablesScreen = TablesScreen();
                Navigator.push(
                    context,
                    Platform.isIOS
                        ? CupertinoPageRoute(builder: (context) => tablesScreen)
                        : MaterialPageRoute(
                            builder: (context) => tablesScreen));
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }
}
