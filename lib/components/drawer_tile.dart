import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget{
  final String title:
  final Widget leading;
  final void Function()? on Tap;

  const DrawerTile({super.key, required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0)
      child: ListTile(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),),
      leading: leading,
      onTap: onTap,
    );
    )
  }
}