import 'package:flutter/material.dart';
import '../models/book.dart';

class Books with ChangeNotifier {
  Map<String, Book> _books = {
    'satu': Book(
      key: 'satu',
      imageUrl:
          'http://3.bp.blogspot.com/-um47FqTbvPg/Vh0a-qERKYI/AAAAAAAAD9M/Aemef2DnUe0/s1600/Eloquent%2BJavaScript%2BFree%2BBook.png',
      name: 'Eloquent Javascript',
      prize: 'Rp. 50.000',
      synopsys:
          'This is a book about instructing computers. Computers are about as common as screwdrivers today, but they are quite a bit more complex, and making them do what you want them to do isn’t always easy.',
      star: 5,
    ),
    'dua': Book(
      key: 'dua',
      imageUrl:
          'https://booklovinmamas.com/wp-content/uploads/books/Laravel/51CR13Djv7L._SX258_BO1%2C204%2C203%2C200_.jpg',
      name: 'Laravel: Up and Running',
      prize: 'Rp. 10.000',
      synopsys:
          'What sets Laravel apart from other PHP web frameworks? Speed and simplicity, for starters. This rapid application development framework and its vast ecosystem of tools let you quickly build new sites and applications with clean, readable code. With this practical guide, Matt Stauffer--a leading teacher and developer in the Laravel community--provides the definitive introduction to one of today\'s most popular web frameworks.',
      star: 4,
    ),
    'tiga': Book(
      key: 'tiga',
      imageUrl: 'https://itbook.store/img/books/9781118026694.png',
      name: 'Professional JavaScript for Web Developers, 3rd Edition',
      prize: 'Rp. 10.000',
      synopsys:
          'If you want to achieve JavaScript\'s full potential, it is critical to understand its nature, history, and limitations. To that end, this updated version of the bestseller by veteran author and JavaScript guru Nicholas C. Zakas covers JavaScript from its very beginning to the present-day incarnations including the DOM, Ajax, and HTML5. Zakas shows you how to extend this powerful language to meet specific needs and create dynamic user interfaces for the web that blur the line between desktop and internet. By the end of the book, you\'ll have a strong understanding of the significant advances in web development as they relate to JavaScript so that you can apply them to your next website.',
      star: 4,
    ),
  };

  Map<String, Book> get books {
    return {..._books};
  }
}
