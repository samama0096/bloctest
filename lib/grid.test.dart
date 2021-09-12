import 'package:flutter/material.dart';

class GrdTestView extends StatefulWidget {
  GrdTestView({Key? key}) : super(key: key);

  @override
  _GrdTestViewState createState() => _GrdTestViewState();
}

class _GrdTestViewState extends State<GrdTestView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                            'https://images.pexels.com/photos/6675908/pexels-photo-6675908.jpeg?cs=srgb&dl=pexels-olia-danilevich-6675908.jpg&fm=jpg'),
                        height: 150,
                        width: 100,
                      ),
                      Text("This is an image from pexels.com :)")
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
