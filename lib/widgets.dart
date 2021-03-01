import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget{
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  const ProductivityButton({Key key,@required this.color,@required this.text,this.size,@required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: null,
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      color: this.color,
      minWidth: this.size,
    );
  }
}

class SettingButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;

  const SettingButton({Key key, this.color, this.text, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child:Text(
          this.text,
          style: TextStyle(color: Colors.white)),
      onPressed: () => null,
      color: this.color,
    );
  }

}
}