import 'package:bloc_study/features/cart/ui/cart_page.dart';
import 'package:bloc_study/features/home/bloc/home_bloc.dart';
import 'package:bloc_study/features/home/ui/product_tile_widget.dart';
import 'package:bloc_study/features/wishlist/ui/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    homeBloc.add(HomeInitalEvnet());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCart(),
              ));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WishList(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadedState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case HomeLoadedSucessState:
            final sucessstate = state as HomeLoadedSucessState;
            return Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistNavigateButtonEvent());
                    },
                    icon: Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartNavigateButtonEvent());
                    },
                    icon: Icon(Icons.shopping_bag))
              ]),
              body: ListView.builder(
                itemCount: sucessstate.products.length,
                itemBuilder: (context, index) {
                  return ListTileItems(
                      productDataModel: sucessstate.products[index]);
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('error'),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
