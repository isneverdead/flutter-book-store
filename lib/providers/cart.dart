import 'package:flutter/material.dart';
import '../models/book.dart';

class Cart with ChangeNotifier {
  Map<String, Book> _books = {
    // 'satu': Book(
    //   imageUrl:
    //       'http://3.bp.blogspot.com/-um47FqTbvPg/Vh0a-qERKYI/AAAAAAAAD9M/Aemef2DnUe0/s1600/Eloquent%2BJavaScript%2BFree%2BBook.png',
    //   name: 'Eloquent Javascript',
    //   prize: 'Rp. 50.000',
    //   synopsys:
    //       'This is a book about instructing computers. Computers are about as common as screwdrivers today, but they are quite a bit more complex, and making them do what you want them to do isn’t always easy.',
    //   star: 5,
    // ),
    // 'dua': Book(
    //   imageUrl:
    //       'https://booklovinmamas.com/wp-content/uploads/books/Laravel/51CR13Djv7L._SX258_BO1%2C204%2C203%2C200_.jpg',
    //   name: 'Laravel: Up and Running',
    //   prize: 'Rp. 10.000',
    //   synopsys:
    //       'What sets Laravel apart from other PHP web frameworks? Speed and simplicity, for starters. This rapid application development framework and its vast ecosystem of tools let you quickly build new sites and applications with clean, readable code. With this practical guide, Matt Stauffer--a leading teacher and developer in the Laravel community--provides the definitive introduction to one of today\'s most popular web frameworks.',
    //   star: 4,
    // ),
  };

  Map<String, Book> get books {
    return {..._books};
  }

  void addItemToCart(String key, Book book) {
    _books.putIfAbsent(key, () => book);
    print('========= Cart = Book id : $key is added ====');
    notifyListeners();
  }

  void removeItemFromCart(String key) {
    _books.remove(key);
    print('========= Cart = Book id : $key is removed ====');
    notifyListeners();
  }
}
