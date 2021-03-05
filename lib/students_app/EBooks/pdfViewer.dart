import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewer extends StatefulWidget {
  String url;
  String chapterName;
  PDFViewer(this.url, this.chapterName);
  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0772a0),
        title: Text(
          widget.chapterName,
        ),
      ),
      body: PDF(

      ).cachedFromUrl(
        widget.url,

        placeholder: (double progress) => Center(child: CircularProgressIndicator(
          value: progress,
        )),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
