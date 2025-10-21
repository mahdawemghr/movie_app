import 'package:flutter/material.dart';

class MovieDeatials extends StatelessWidget {
  const MovieDeatials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Movie Deaails'),
      ),
    );
  }
}
