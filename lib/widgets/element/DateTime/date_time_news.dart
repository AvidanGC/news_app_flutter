// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../helpers/TimeHelper.dart';
import '../Text/SubtitleLabel.dart';

class DateTimeWidgetNews extends StatelessWidget {
  final String publishedAt;
  
  const DateTimeWidgetNews(this.publishedAt,{super.key});

  @override
  Widget build(BuildContext context) {
    return SubtitleLabel(
      TimeHelper.getDateTimeString(publishedAt), 
      color: Colors.grey
    );
  }
}
