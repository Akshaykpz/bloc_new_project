import 'package:bloc_study/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ListTileItems extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ListTileItems({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(19))),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: NetworkImage(productDataModel.imageurl))),)
              ),
          height: 150,
          width: double.infinity,
        ),
        Text(
          productDataModel.name,
          style: TextStyle(fontSize: 20),
        ),
        Text('${productDataModel.price}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_outlined),
            )
          ],
        )
      ]),
    );
  }
}
