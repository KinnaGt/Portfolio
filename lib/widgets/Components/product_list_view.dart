import 'package:flutter/cupertino.dart';
import 'package:portfolio/model/product.dart';
import 'package:portfolio/widgets/Components/product_container.dart';

class ProductListView extends StatelessWidget {
  List<Product> list;
  ProductListView(this.list);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount:list.length,
      shrinkWrap: true, // se adapta al contenedor sino a la lista con false
      itemBuilder: (context, index){
        return  ProductContainer(list[index],onPress:  () {
        });
      },
    );
  }
}