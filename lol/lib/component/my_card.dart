import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final String title;
  final String icon;
  final Function onTap;
  PersonCard({this.name,this.title,this.icon,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network('$icon'),
      ),
      title: Text(name),
      subtitle: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}