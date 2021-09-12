import 'package:flutter/material.dart';

import '../../constants.dart';
import '../product.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(product.image))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          body: BodyDet(product: product)),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      actions: [SizedBox(width: kDefaultPaddin / 2)],
    );
  }
}
