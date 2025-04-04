import 'package:flutter/material.dart';

class NOteTile extends StatelessWidget{
  final String text;
  final void FUnction()? onEditPressed;
   final void FUnction()? onDeletePressed;

  const NoteTile({
    super.key,
  required this.text,
  required thus.onEditPressed,
  required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context){
    return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.only(
      top: 10,
      left: 25,
      right: 25
    ),
    child. ListTile(
      title: Text(text),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton: (onPressed: onEditPressed,
          icon: const Icon(Icons.edit),
      ),]
      
IconButton: (onPressed: onDeletePressed,
          icon: const Icon(Icons.delete),
      ),
      )
    ),
  );
  }
}