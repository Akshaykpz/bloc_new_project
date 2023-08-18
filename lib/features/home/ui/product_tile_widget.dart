import 'package:bloc_study/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ListTileItems extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ListTileItems({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(productDataModel.imageurl))),
          height: 200,
          width: double.infinity,
        ),
        Text(productDataModel.name),
        Text(productDataModel.price)
      ]),
    );
  }
}
