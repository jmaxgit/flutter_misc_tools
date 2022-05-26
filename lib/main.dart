import 'package:flutter/material.dart';
import 'package:flutter_misc_tools/data.dart';
import 'package:flutter_misc_tools/notifiers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(create: (_) => SingleNotifier())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Dialogs',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogs'),
      ),
      body: Center(
        child: Column(
          children: [
            ListView(
              children: ListTile.divideTiles(tiles: [
                ListTile(
                  title: Text('AlertDialog'),
                  onTap: () => _showMessageDialog(context),
                ),
                ListTile(
                  title: Text('Songle Choice Dialog'),
                  onTap: () => _showSingleChoiceDialog(context),
                ),
                ListTile(
                  title: Text('Multiple Choice Dialog'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('TextField Dialog'),
                  onTap: () {},
                )
              ], context: context)
                  .toList()            
            ),
          ],
        ),
        
      ),
    );
  }

  _showMessageDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do ypu want to delete all items'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Yes')),
            ],
          ));

  _showSingleChoiceDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final _singleNotifier = Provider.of<SingleNotifier>(context);
        return AlertDialog(
          title: Text('Select one vehicle'),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: vehiclesGeneral
                    .map((e) => RadioListTile(
                        title: Text(e),
                        value: e,
                        groupValue: _singleNotifier.currentVehicle,
                        selected: _singleNotifier.currentVehicle == e,
                        onChanged: (value) {
                          _singleNotifier.updateVehicle(value as String);
                          Navigator.of(context).pop();
                        }))
                    .toList(),
              ),
            ),
          ),
        );
      });
}
