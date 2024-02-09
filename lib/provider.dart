import 'package:flutter/material.dart';

class provider extends StatefulWidget {
  const provider({super.key});

  @override
  State<provider> createState() => _providerState();
}

class _providerState extends State<provider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Provider'),
      ),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Movie $index'),
            trailing: Icon(Icons.favorite),
          );
        },
      ),
    );
  }
}
