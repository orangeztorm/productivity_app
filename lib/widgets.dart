import 'package:flutter/material.dart';

typedef CallbackSetting = void Function(String, int);

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

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final int value;
  final String setting;
  final CallbackSetting callback;
  SettingsButton(this.color, this.text, this.size, this.value,
      this.setting, this.callback);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child:Text(
          this.text,
          style: TextStyle(color: Colors.white)),
      onPressed: () => this.callback(this.setting, this.value),
      color: this.color,
      minWidth: this.size,
    );
  }

}
