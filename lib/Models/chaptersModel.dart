import 'package:flutter/material.dart';

class ChaptersModel {
  int chapterNumber;
  String chapterName;
  String pdfUrl;
  ChaptersModel(
      {@required this.chapterNumber,
      @required this.chapterName,
      @required this.pdfUrl});
}
