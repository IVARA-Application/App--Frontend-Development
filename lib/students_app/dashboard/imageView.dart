import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  String imageUrl;
  ImageView(this.imageUrl);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Hero(
          tag: widget.imageUrl,
          child: CachedNetworkImage(imageUrl: widget.imageUrl),
        ),
      ),
    );
  }
}
