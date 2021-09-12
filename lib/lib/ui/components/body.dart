import 'package:bloctest/lib/ui/product.dart';
import 'package:flutter/material.dart';
import 'package:bloctest/lib/constants.dart';
//import 'package:flutter/src/widgets/navigator.dart';
import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Men",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                      childAspectRatio: 0.75),
                  itemBuilder: (context, index) => ItemCard(
                        products[index],
                        //detPage(context, index),
                        // () => //WidgetsBinding.instance!.addPostFrameCallback((_) {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               DetailScreen(key, products[index]),
                        //         ))
                        //}),

                        //}
                      ))),
        ),
      ],
    );
  }
}

// Function detPage(BuildContext context, int index) {
//   throw Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => DetailScreen(null, products[index])));
// }
