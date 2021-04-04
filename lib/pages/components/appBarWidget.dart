import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool timer;
  AppBarWidget(this.title, this.timer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          title: Text(title),
          centerTitle: true,
          elevation: 0,
          actions: timer
              ? [
                  IconButton(
                      icon: Icon(Icons.add),
                      padding: EdgeInsets.only(right: 0),
                      splashRadius: 20,
                      onPressed: () {})
                ]
              : null,
        ),
      ),
    );
  }
}
