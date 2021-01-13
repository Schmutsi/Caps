
import 'package:flutter/material.dart';

class ReusableThumbUp extends StatelessWidget{

  final Function clic;

  ReusableThumbUp({@required this.clic});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 60.0,
      icon: Icon(Icons.thumb_up_alt, color: Colors.green),
      onPressed: clic,
    );
  }

}

class ReusableThumbDown extends StatelessWidget{

  final Function clic;

  ReusableThumbDown({@required this.clic});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 60.0,
      icon: Icon(Icons.thumb_down_alt, color: Colors.red),
      onPressed: clic,
    );
  }

}


