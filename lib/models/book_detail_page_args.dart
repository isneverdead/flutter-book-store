import 'package:flutter/material.dart';

class BookDetailPageArgs {
  final String keys;
  final String imageUrl;
  final String bookName;
  final int stars;
  final String synopsys;
  final String prize;

  BookDetailPageArgs({
    @required this.keys,
    @required this.bookName,
    @required this.imageUrl,
    @required this.prize,
    @required this.stars,
    @required this.synopsys,
  });
}
