import 'package:flutter/material.dart';
import 'package:flutter_bloc_experiment/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_experiment/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_experiment/features/home/models/home_products_data_model.dart';
import 'package:flutter_bloc_experiment/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductsDataModel productsDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productsDataModel, required this.wishlistBloc});

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
                      icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductCartButtonClickedEvent(
                        //     clickedProduct: productsDataModel));
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
