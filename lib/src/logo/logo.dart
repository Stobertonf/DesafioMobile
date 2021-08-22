import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: logo(context),
      ),
    );
  }
}

Container logo(BuildContext context) {
  return Container(
    height: 200.0,
    padding: EdgeInsets.only(bottom: 10.0),
    child: Image.asset(
      "assets/images/logo_smf.png",
      height: 0,
      width: 130,
    ),
  );
}
