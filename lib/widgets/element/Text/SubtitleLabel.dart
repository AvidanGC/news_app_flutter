import 'package:flutter/material.dart';

class SubtitleLabel extends StatelessWidget {
  final String? title;
  final int? maxLines;
  final Color? color;
  final TextAlign textAlign;

  const SubtitleLabel(this.title, {super.key, this.maxLines = 1, this.color, this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '...',
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      softWrap: maxLines == null ? null : false,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Theme.of(context).textTheme.titleMedium!.color!,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "Montserrat",
      ),
    );
  }
}
