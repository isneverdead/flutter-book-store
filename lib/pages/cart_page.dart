import 'package:flutter/material.dart';
import '../widgets/list_book.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import 'book_detail_page.dart';
import '../models/book_detail_page_args.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    var _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.books.length,
                itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(cart.books.keys),
                  onDismissed: (direction) {
                    cart.removeItemFromCart(
                        '${cart.books.values.toList()[index].key}');
                    print('long pressed');
                  },
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          BookDetailPage.routeName,
                          arguments: BookDetailPageArgs(
                              category:
                                  '${cart.books.values.toList()[index].category}',
                              keys: '${cart.books.values.toList()[index].key}',
                              bookName:
                                  '${cart.books.values.toList()[index].name}',
                              imageUrl:
                                  '${cart.books.values.toList()[index].imageUrl}',
                              prize:
                                  '${cart.books.values.toList()[index].prize}',
                              stars: cart.books.values.toList()[index].star,
                              synopsys:
                                  '${cart.books.values.toList()[index].synopsys}')),
                      child: ListBook(
                          keys: '${cart.books.values.toList()[index].key}',
                          highDevice: _highDevice,
                          name: '${cart.books.values.toList()[index].name}',
                          imageUrl:
                              '${cart.books.values.toList()[index].imageUrl}',
                          star: cart.books.values.toList()[index].star,
                          synopsys:
                              '${cart.books.values.toList()[index].synopsys}',
                          prize: '${cart.books.values.toList()[index].prize}')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
