import 'dart:core';

import 'package:flutter/material.dart';

List _cities = ["Cluj-Napoca", "Bucuresti", "Timisora", "Brasov", "Constanta"];
List<DropdownMenuItem<String>> _dropDownMenuItems;
String _currentCity;

void main() => runApp(MaterialApp(
      home: SettingsWidget(),
    ));

class SettingsWidget extends StatefulWidget {
  SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String city in _cities) {
      items.add(DropdownMenuItem(
        value: city,
        child: Text(city),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Please choose your city: "),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            DropdownButton(
              value: _currentCity,
              items: _dropDownMenuItems,
              onChanged: (String selectedCity) {
                print(
                    "Selected city $selectedCity, we are going to refresh the UI");
                setState(() {
                  _currentCity = selectedCity;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog();
        });
  }
}
