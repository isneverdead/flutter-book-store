import 'package:flutter/material.dart';

class ListBook extends StatefulWidget {
  final String keys;
  final double highDevice;
  final String name;
  final String imageUrl;
  final int star;
  final String synopsys;
  final String prize;
  final String category;
  ListBook({
    @required this.keys,
    @required this.highDevice,
    @required this.name,
    @required this.imageUrl,
    @required this.star,
    @required this.synopsys,
    @required this.prize,
    @required this.category,
  });
  @override
  _ListBookState createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  @override
  Widget build(BuildContext context) {
    final _4highDevice = widget.highDevice / 4;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      height: _4highDevice * 0.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: _4highDevice * 0.3,
            height: _4highDevice * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${widget.imageUrl}'),
                    fit: BoxFit.fill)),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _4highDevice,
                  child: Text(
                    '${widget.name}',
                    style: TextStyle(
                        fontSize: _4highDevice * 0.1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
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
                          itemCount: 5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            size: 20,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: _4highDevice * 0.05),
                  child: Text(
                    '${widget.prize}',
                    style: TextStyle(
                        fontSize: _4highDevice * 0.1,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
