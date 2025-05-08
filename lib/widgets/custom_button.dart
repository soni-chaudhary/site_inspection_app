import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final String text;
  const CustomButton({super.key, this.onTap, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        height: 45,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}
