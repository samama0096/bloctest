import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScren extends StatelessWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [],
    );
  }
}
