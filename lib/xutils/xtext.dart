import 'package:flutter/material.dart';

class XText extends StatelessWidget {
  final double? size;
  final String text;
  final Color? color;
  FontWeight? weight;
  final bool lineThrough;
  final bool bold;
  final bool halfBold;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  XText(
      this.text,
      {
        Key? key,
        this.size,
        this.color,
        this.weight,
        this.lineThrough = false,
        this.bold = false,
        this.halfBold = false,
        this.maxLines,
        this.overflow,
        this.textAlign,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(weight == null){
      if(bold){
        weight = FontWeight.bold;
      }else if(halfBold){
        weight = FontWeight.w600;
      }
    }
    return Text(text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size, color: color, fontWeight: weight,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
