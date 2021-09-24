import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 48, color: Colors.orangeAccent),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CURRENTLY BUILDING',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              Text(
                'Or maybe not',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          ),
          Icon(Icons.warning, size: 48, color: Colors.orangeAccent),
        ],
      )),
    );
  }
}
