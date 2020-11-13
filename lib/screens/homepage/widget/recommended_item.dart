import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/recommended.dart';
import 'package:flutter_app/screens/homepage/view/item_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendedItemWidget extends StatelessWidget {
  final RecommendedOrders orders;

  RecommendedItemWidget({this.orders});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo: make click action
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SvgPicture.network(
                  orders.imgUrl,
                  height: 80.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                  semanticsLabel: orders.name,
                  placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 80,
                    width: 80,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    orders.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Net wt. ${orders.netWt}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$${orders.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepOrangeAccent[200]),
            child: SizedBox(
              height: 25,
              width: 25,
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.add,
                  size: 18,
                ),
                onPressed: () {
                  print(orders.name);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}