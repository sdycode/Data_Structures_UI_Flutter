import 'package:data_structures_ui/data_structures/tree.dart';
import 'package:data_structures_ui/provider/treeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

double w = 200;
double h = 200;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TreeProvider(),)
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Builder(
            builder: (context) {
              h = MediaQuery.of(context).size.height;
              w = MediaQuery.of(context).size.width;
              return TreePage();
          
            },
          )),
    );
  }
}
