import 'package:bloctest/lib/ui/product.dart';
import 'package:flutter/material.dart';
import 'package:bloctest/lib/ui/details/details_screen.dart';
//import 'package:flutter/src/widgets/navigator.dart';
import '../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  //final Function press;

  const ItemCard(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailScreen(product))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              //height: 180,
              //width: 160,
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text("\$${product.price}")
        ],
      ),
    );
  }
}
