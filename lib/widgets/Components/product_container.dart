import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/helpers/responsive_app.dart';
import 'package:portfolio/model/product.dart';

class ProductContainer extends StatelessWidget {
  Product product;
  var onPress;

  ProductContainer(this.product, {this.onPress});

  late ResponsiveApp responsiveApp;

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return InkWell(
      onTap: onPress,
      child: Container(
        height: responsiveApp.productContainerWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product.title.toUpperCase(),),
            Text(product.price),
          ],
        ),
      ),
    );
  }
}