import 'package:book_store/models/book.dart';
import 'package:book_store/pages/cart_page.dart';
import 'package:flutter/material.dart';
import '../models/book_detail_page_args.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class BookDetailPage extends StatelessWidget {
  // BuildContext _context;
  // BookDetailPage(this._context);
  static const routeName = '/detail-book';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    BookDetailPageArgs args = ModalRoute.of(context).settings.arguments;
    var _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Center(
          child: Text('Detail Page'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _4highDevice * 0.2, vertical: _4highDevice * 0.1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: _4highDevice * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _4highDevice * 0.7,
                    height: _4highDevice,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(args.imageUrl),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: _4highDevice * 0.4,
                          width: _4highDevice * 0.7,
                          child: Text(
                            args.bookName,
                            style: TextStyle(
                                fontSize: _4highDevice * 0.12,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Row(
                        //   children: [

                        //   ],
                        // )
                        Container(
                          // color: Colors.grey,
                          height: 20,
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: args.stars.toInt(),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  // Text('https://www.oreilly.com/library/view/'),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: _4highDevice * 0.1),
              child: Text(args.synopsys),
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(10),
          height: _2highDevice * 0.2,
          // color: Colors.red,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () {
              cart.addItemToCart(
                  args.keys,
                  Book(
                      key: args.keys,
                      imageUrl: args.imageUrl,
                      name: args.bookName,
                      prize: args.prize,
                      synopsys: args.synopsys,
                      star: args.stars));
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
            child: Card(
              color: Theme.of(context).primaryColorLight,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('${args.prize}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
