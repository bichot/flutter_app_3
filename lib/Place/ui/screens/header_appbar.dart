import 'package:flutter/material.dart';
import '../../../widgets/gradient_back.dart' show GradientBack;
import '../widgets/card_image_list.dart';
import 'package:flutter_app_3/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(height: 250.0),
        CardImageList()
      ],
    );
  }
}
