import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_experiment/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_experiment/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    productsDataModel: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
              );
            default:
          }

          return Container();
        },
      ),
    );
  }
}
