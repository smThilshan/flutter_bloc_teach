import 'package:flutter/material.dart';
import 'package:flutter_bloc_experiment/data/cart_items.dart';
import 'package:flutter_bloc_experiment/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_experiment/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_experiment/features/home/models/home_products_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductsDataModel productsDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productsDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              width: double.maxFinite,
              child: Image.network(
                productsDataModel.imageUrl,
                fit: BoxFit.cover,
              )),
          SizedBox(height: 10),
          Text(productsDataModel.name),
          Text(productsDataModel.category),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Rs. " + productsDataModel.price),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                        //     clickedProduct: productsDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductCartButtonClickedEvent(
                        //     clickedProduct: productsDataModel));
                        cartBloc.add(CartRemoveFromCartEvent(
                            productDataModel: productsDataModel));
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
