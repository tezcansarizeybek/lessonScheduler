// ignore_for_file: constant_identifier_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum Images {
  logo_web("https://static.thenounproject.com/png/3121616-200.png");

  final String value;

  const Images(this.value);

  CachedNetworkImage get getImageNetwork => CachedNetworkImage(
        imageUrl: value,
      );

  Image get getAssetImage => Image.asset(value);
}
