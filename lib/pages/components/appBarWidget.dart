import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool timer;
  AppBarWidget(this.title, this.timer);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF2F2F2),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          backgroundColor: Color(0xffF2F2F2),
          title: Text(title,
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          brightness: Brightness.light,
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
