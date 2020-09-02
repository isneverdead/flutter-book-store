import 'package:flutter/material.dart';

class Book with ChangeNotifier {
  final String key;
  final String imageUrl;
  final String name;
  final String prize;
  final String synopsys;
  final int star;
  Book({
    @required this.key,
    @required this.imageUrl,
    @required this.name,
    @required this.prize,
    @required this.synopsys,
    @required this.star,
  });
}
