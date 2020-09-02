import 'package:book_store/models/book_detail_page_args.dart';
import 'package:book_store/pages/book_detail_page.dart';
import 'package:book_store/pages/cart_page.dart';
import 'package:book_store/pages/list_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/books.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _cartIsEmpty = false;
  void _changeCartIsEmpty() {
    setState(() {
      _cartIsEmpty = !_cartIsEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    var _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    int _current = 0;
    final book = Provider.of<Books>(context);

    List imgList = [
      'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
        // brightness: ,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          )
        ],
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
              // Container(
              //   // color: Colors.grey,
              //   // padding: EdgeInsets.only(left: _4highDevice * 0.07),
              //   // height: 70,
              //   width: 40,
              //   child: Stack(
              //     children: [
              //       IconButton(
              //         icon: Icon(
              //           Icons.shopping_cart,
              //           color: Colors.white,
              //         ),
              //         onPressed: () {
              //           // setState(() {
              //           //   _cartIsEmpty = !_cartIsEmpty;
              //           // });

              //           _changeCartIsEmpty();
              //           print('object');
              //         },
              //       ),
              //       Positioned(
              //           top: 2,
              //           right: 5,
              //           child: Container(
              //             width: 10,
              //             height: 10,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(50),
              //               color: _cartIsEmpty
              //                   ? Colors.transparent
              //                   : Theme.of(context).accentColor,
              //             ),
              //           ))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            left: _4highDevice * 0.1, right: _4highDevice * 0.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: _4highDevice * 0.2, bottom: _4highDevice * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // '${books.books.values.toList()[0].name}',
                      'List Book\'s',
                      style: TextStyle(
                        fontSize: _4highDevice * 0.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ListBooksPage.routeName);
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: _4highDevice * 0.1),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    CarouselSlider.builder(
                        height: _2highDevice,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        pauseAutoPlayOnTouch: Duration(seconds: 5),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        // items: imgList.map((imgUrl) {
                        itemCount: book.books.length,
                        itemBuilder: (context, index) {
                          // },
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () => Navigator.of(_context).pushNamed(
                                  BookDetailPage.routeName,
                                  arguments: BookDetailPageArgs(
                                    keys:
                                        '${book.books.values.toList()[index].key}',
                                    bookName:
                                        '${book.books.values.toList()[index].name}',
                                    imageUrl:
                                        '${book.books.values.toList()[index].imageUrl}',
                                    prize:
                                        '${book.books.values.toList()[index].prize}',
                                    stars:
                                        book.books.values.toList()[index].star,
                                    synopsys:
                                        '${book.books.values.toList()[index].synopsys}',
                                  ),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green,
                                    image: DecorationImage(
                                      image: NetworkImage(book.books.values
                                          .toList()[index]
                                          .imageUrl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          margin: EdgeInsets.only(bottom: 50),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                // width: _4highDevice * 0.5,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2, vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color.fromARGB(
                                                      170, 63, 197, 240),
                                                ),
                                                child: Text(
                                                  '${book.books.values.toList()[index].name}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                      fontSize:
                                                          _4highDevice * 0.1),
                                                ),
                                              ),
                                              // Text(
                                              //   '$imgUrl',
                                              //   style: TextStyle(color: Colors.white),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  // child: Image.network(
                                  //   imgUrl,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              );
                            },
                          );
                        }),
                    // ),
                  ],
                ),
              ),
              // Container(
              //   height: _2highDevice,
              //   child: ListWheelScrollView(
              //     diameterRatio: 5,
              //     itemExtent: _2highDevice * 0.85,

              //     // useMagnifier: true,
              //     // magnification: 1.1,
              //     children: [

              //     ],
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(
                    top: _4highDevice * 0.2, bottom: _4highDevice * 0.1),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: _4highDevice * 0.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // width: _2highDevice * 0.7,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorLight,
                              onPressed: () {},
                              child: Text(
                                'Category 1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _4highDevice * 0.1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorLight,
                              onPressed: () {},
                              child: Text(
                                'Category 2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _4highDevice * 0.1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorLight,
                              onPressed: () {},
                              child: Text(
                                'Category 3',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _4highDevice * 0.1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorLight,
                              onPressed: () {},
                              child: Text(
                                'Category 4',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _4highDevice * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
