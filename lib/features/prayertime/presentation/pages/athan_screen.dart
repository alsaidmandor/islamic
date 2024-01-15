import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AthanScreen extends StatelessWidget {
  const AthanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.clear)),
          centerTitle: true,
          title: const Text(
            'Ahan ',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Center(
          child: Text('Qibla Screen'),
        ));
    ;
  }
}
