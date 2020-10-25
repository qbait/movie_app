import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = Get.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: [
          _overview(movie.overview),
          _image(movie.posterUrl),
        ],
      ),
    );
  }

  Widget _overview(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _image(String url) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(child: CircularProgressIndicator()),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: url,
          ),
        ),
      ],
    );
  }
}
