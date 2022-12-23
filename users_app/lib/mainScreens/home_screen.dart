import 'package:flutter/material.dart';
import 'package:users_app/widgets/my_drawer.dart';

import '../global/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sharedPreferences!.getString("name") ?? "unknown"),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.amber],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
        ),
      ),
      drawer: MyDrawer(),
      body: Center(),
    );
  }
}
