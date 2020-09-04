import 'package:book_store/models/book_detail_page_args.dart';
import 'package:book_store/pages/book_detail_page.dart';
import 'package:book_store/pages/cart_page.dart';
import 'package:book_store/pages/list_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/books.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../providers/auth.dart';
import '../widgets/splash_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _cartIsEmpty = false;
  bool _initValue = true;
  var categoryFilter = 'all';
  bool _showListSearch = false;
  var items = List<String>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   Provider.of<Books>(context).setFilter();
  // }

  // void _changeCartIsEmpty() {
  //   setState(() {
  //     _cartIsEmpty = !_cartIsEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    var _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    int _current = 0;
    final book = Provider.of<Books>(context);
    final auth = Provider.of<Auth>(context);
    void filterSearchResults(String query) {
      List<Book> dummySearchList = List<Book>();

      book.listSearchBooks.forEach((element) {
        dummySearchList = book.listSearchBooks;
      });

      if (query.isNotEmpty) {
        List<String> dummyListData = List<String>();
        dummySearchList.forEach((item) {
          if (item.name.contains(query)) {
            dummyListData.add(item.name);
          }
        });
        setState(() {
          items.clear();
          items.addAll(dummyListData);
        });
        return;
      } else {
        setState(() {
          items.clear();
          // book.listSearchBooks.
          // items.addAll(book.listSearchBooks);
        });
      }
    }

    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: _4highDevice * 0.5),
          child: Column(
            children: [
              RaisedButton(onPressed: () {
                auth.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => SplashScreen(0)));
              })
            ],
          ),
        ),
      ),
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
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  onTap: () {
                    setState(() {
                      _showListSearch = true;
                    });

                    // FocusScopeNode currentFocus = FocusScope.of(context);

                    // if (!currentFocus.hasPrimaryFocus) {
                    //   currentFocus.unfocus();
                    // }
                  },
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
      body: Stack(
        children: [
          Container(
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
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 2000),
                            pauseAutoPlayOnTouch: Duration(seconds: 5),
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            itemCount: book.filteredBooks.length,
                            itemBuilder: (context, index) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        Navigator.of(_context).pushNamed(
                                      BookDetailPage.routeName,
                                      arguments: BookDetailPageArgs(
                                        keys:
                                            '${book.filteredBooks.values.toList()[index].key}',
                                        bookName:
                                            '${book.filteredBooks.values.toList()[index].name}',
                                        imageUrl:
                                            '${book.filteredBooks.values.toList()[index].imageUrl}',
                                        prize:
                                            '${book.filteredBooks.values.toList()[index].prize}',
                                        stars: book.filteredBooks.values
                                            .toList()[index]
                                            .star,
                                        synopsys:
                                            '${book.filteredBooks.values.toList()[index].synopsys}',
                                        category:
                                            '${book.filteredBooks.values.toList()[index].category}',
                                      ),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green,
                                        image: DecorationImage(
                                          image: NetworkImage(book
                                              .filteredBooks.values
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
                                              margin:
                                                  EdgeInsets.only(bottom: 50),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    // width: _4highDevice * 0.5,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2,
                                                            vertical: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color.fromARGB(
                                                          170, 63, 197, 240),
                                                    ),
                                                    child: Text(
                                                      '${book.filteredBooks.values.toList()[index].name}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize:
                                                              _4highDevice *
                                                                  0.1),
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
                    height: _4highDevice * 0.17,
                    child: Row(
                      children: [
                        ButtonTheme(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              book.setFilter(category: 'all');
                              print('object');
                            },
                            child: Text('all',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: book.categoryBooks.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    EdgeInsets.only(left: _4highDevice * 0.1),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Theme.of(context).primaryColorLight,
                                  onPressed: () {
                                    book.setFilter(
                                        category:
                                            '${book.categoryBooks.values.toList()[index].category}');
                                    print('object');
                                  },
                                  child: Text(
                                      '${book.categoryBooks.values.toList()[index].category}',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              );
                              // return GestureDetector(
                              //   onTap: () {
                              //     book.setFilter(category: 'Javascript');
                              //     print('object');
                              //   },
                              //   child: Container(
                              //     // height: _4highDevice * 0.05,
                              //     margin: EdgeInsets.symmetric(horizontal: 5),
                              //     child: ButtonTheme(
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(10)),
                              //       child: RaisedButton(
                              //         color: Theme.of(context).primaryColorLight,
                              //         onPressed: () {},
                              //         child: Text(
                              //           '${book.filteredBooks.values.toList()[index].category.toString()}',
                              //           style: TextStyle(
                              //               color: Colors.white,
                              //               fontSize: _4highDevice * 0.1),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _showListSearch
              ? Container(
                  height: _highDevice,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Container(
                              color: Colors.grey,
                              height: _2highDevice * 0.8,
                              padding: EdgeInsets.only(
                                  left: _4highDevice * 0.1,
                                  right: _4highDevice * 0.1),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: items.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: _4highDevice * 0.02),
                                        height: _4highDevice * 0.2,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${items[index]}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showListSearch = false;
                          });
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        child: Container(
                          color: Colors.red,
                          height: _4highDevice * 0.1,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
