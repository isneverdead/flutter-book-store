import 'package:flutter/material.dart';
import '../models/book.dart';

class Books with ChangeNotifier {
  Books() {
    setFilter();
    getCategory();
  }

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
        category: 'Javascript'),
    'dua': Book(
        key: 'dua',
        imageUrl:
            'https://booklovinmamas.com/wp-content/uploads/books/Laravel/51CR13Djv7L._SX258_BO1%2C204%2C203%2C200_.jpg',
        name: 'Laravel: Up and Running',
        prize: 'Rp. 10.000',
        synopsys:
            'What sets Laravel apart from other PHP web frameworks? Speed and simplicity, for starters. This rapid application development framework and its vast ecosystem of tools let you quickly build new sites and applications with clean, readable code. With this practical guide, Matt Stauffer--a leading teacher and developer in the Laravel community--provides the definitive introduction to one of today\'s most popular web frameworks.',
        star: 4,
        category: 'PHP'),
    'tiga': Book(
        key: 'tiga',
        imageUrl:
            'http://www.satuharapan.com/home/satuhara/public_html/fileadmin/user_upload/Buku%20Incubus.jpg',
        name: 'The Incubus of Intervention',
        prize: 'Rp. 150.000',
        synopsys:
            'Greg Poulgrain, dalam bukunya yang berjudul The Incubus of intervention, Conflicting Indonesia Strategies of John F. Kennedy and Allen Dulles, menyebut Hammarskjöld tidak menginginkan Papua dikuasai oleh Indonesia maupun Belanda. Ia lebih memilih Papua menentukan nasib sendiri. Hammarskjöld, yang oleh Presiden AS, John F. Kennedy, disebut sebagai negarawan paling hebat di dunia, kemudian mempersiapkan sebuah proposal penyelesaian Papua berjudul Papua for Papuans, yang menyebabkan  Papua pernah tercatat dalam agenda PBB, sebagai wilayah sengketa antara Belanda dan Indonesia (1949-1962). Menurut pendeta GKI di Tanah Papua, Pdt Phil Karel Erari, mengutip studi Poulgrain, dalam proposal itu disebutkan bahwa status Papua akan ditarik menjadi wilayah protektorat PBB untuk kemudian dipersiapkan bagi sebuah proses demokratis yakni Hak Menentukan Nasib Sendiri  seperti yang sudah berlangsung sebelumnya dengan Kamerun, Afrika.',
        star: 5,
        category: 'History'),
    'empat': Book(
        key: 'empat',
        imageUrl:
            'https://images.routledge.com/common/jackets/amazon/978149873/9781498738286.jpg',
        name: 'Programming with MATLAB for Scientists',
        prize: 'Rp. 10.000',
        synopsys:
            'This book offers an introduction to the basics of MATLAB programming to scientists and engineers. The author leads with engaging examples to build a working knowledge, specifically geared to those with science and engineering backgrounds. The reader is empowered to model and simulate real systems, as well as present and analyze everyday data sets. In order to achieve those goals, the contents bypass excessive "under the hood" details, and instead gets right down to the essential, practical foundations for successful programming and modeling.',
        star: 4,
        category: 'MatLab'),
    'lima': Book(
        key: 'lima',
        imageUrl:
            'https://img.huffingtonpost.com/asset/5bb62003220000ba01dcada4.jpeg?ops=scalefit_720_noupscale',
        name: 'Harry Potter And The Sorcerer’s Stone',
        prize: 'Rp. 10.000',
        synopsys:
            'The Harry Potter covers by Mary GrandPré are so fantastic and iconic,” Kibuishi told Scholastic for their press release.  “When I was asked to submit samples, I initially hesitated because I didn’t want to see them reinterpreted! However, I felt that if I were to handle the project, I could bring something to it that many other designers and illustrators probably couldn’t, and that was that I was also a writer of my own series of middle grade fiction. As an author myself, I tried to answer the question, ‘If I were the author of the books - and they were like my own children - how would I want them to be seen years from now?’ When illustrating the covers, I tried to think of classic perennial paperback editions of famous novels and how those illustrations tend to feel. In a way, the project became a tribute to both Harry Potter and the literary classics.',
        star: 4,
        category: 'Harry Potter'),
  };

  Map<String, Book> get books {
    return {..._books};
  }

  Map<String, Book> _filteredBooks = {};

  Map<String, Book> get filteredBooks {
    return {..._filteredBooks};
  }

  void setFilter({String category = 'all'}) {
    if (category == 'all') {
      _books.forEach((key, value) {
        _filteredBooks.putIfAbsent(key, () => value);
      });
      print('filter = all');
      notifyListeners();
    } else {
      _filteredBooks = {};
      _books.forEach((key, value) {
        if (value.category == category) {
          _filteredBooks.putIfAbsent(key, () => value);
        }
        print('setFilter');
        notifyListeners();
      });
    }

    notifyListeners();
  }

  Map<String, Book> _categoryBooks = {};

  Map<String, Book> get categoryBooks {
    return {..._categoryBooks};
  }

  List<Book> _listSearchBooks = [];
  void getListBook() {
    _books.forEach((key, value) {
      _listSearchBooks.add(value);
    });
  }

  List<Book> get listSearchBooks {
    return [..._listSearchBooks];
  }

  void getCategory() {
    getListBook();
    _books.forEach((key, value) {
      _categoryBooks.putIfAbsent(value.category, () => value);

      notifyListeners();
    });
    print(_categoryBooks);
    notifyListeners();
  }
  // List<String> _categories = [];

}
