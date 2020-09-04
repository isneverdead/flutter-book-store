import 'package:book_store/models/book_detail_page_args.dart';
import 'package:book_store/pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/books.dart';
import '../widgets/list_book.dart';

class ListBooksPage extends StatefulWidget {
  static const routeName = '/list-books';

  @override
  _ListBooksPageState createState() => _ListBooksPageState();
}

class _ListBooksPageState extends State<ListBooksPage> {
  bool _cartIsEmpty = false;
  void _changeCartIsEmpty() {
    setState(() {
      _cartIsEmpty = !_cartIsEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context);
    var _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
        // brightness: ,
        title: Container(
          // padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: _4highDevice * 0.18,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search some Book',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Container(
                // color: Colors.grey,
                // padding: EdgeInsets.only(left: _4highDevice * 0.07),
                // height: 70,
                width: 40,
                child: Stack(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // setState(() {
                        //   _cartIsEmpty = !_cartIsEmpty;
                        // });
                        _changeCartIsEmpty();
                        print('object');
                      },
                    ),
                    Positioned(
                        top: 2,
                        right: 5,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _cartIsEmpty
                                ? Colors.transparent
                                : Theme.of(context).accentColor,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: book.books.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        BookDetailPage.routeName,
                        arguments: BookDetailPageArgs(
                          keys: '${book.books.values.toList()[index].key}',
                          bookName: '${book.books.values.toList()[index].name}',
                          imageUrl:
                              '${book.books.values.toList()[index].imageUrl}',
                          prize: '${book.books.values.toList()[index].prize}',
                          stars: book.books.values.toList()[index].star,
                          synopsys:
                              '${book.books.values.toList()[index].synopsys}',
                          category: '${book.books.values.toList()[index].key}',
                        )),
                    child: ListBook(
                      keys: '${book.books.values.toList()[index].key}',
                      highDevice: _highDevice,
                      name: '${book.books.values.toList()[index].name}',
                      imageUrl: '${book.books.values.toList()[index].imageUrl}',
                      star: book.books.values.toList()[index].star,
                      synopsys: '${book.books.values.toList()[index].synopsys}',
                      prize: '${book.books.values.toList()[index].prize}',
                      category: '${book.books.values.toList()[index].category}',
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
