import 'package:ecommerce/Features/Auth/data/models/models.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/favorite_model.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:ecommerce/Features/HomeScreen/bloc/favorite_bloc.dart';
import 'package:ecommerce/data/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    loadFavoriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: size.width / 530),
                    itemCount: state.favoriteItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      FavoriteProductModel productModel =
                          state.favoriteItems[index];
                      return GestureDetector(
                        onTap: () {
                          context.push('/item',
                              extra: ProductModel.fromJson(
                                  state.favoriteItems[index].itemId.toJson()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                height: 170,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      productModel.itemId.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[500]),
                                    ),
                                    Expanded(child: Container()),
                                    const Icon(
                                      Icons.star,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("4.9")
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "\$${productModel.itemId.price}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
            return Container();
          },
        ));
  }

  void loadFavoriteList() async {
    await SharedPrefService.readJsonValue("userDetails").then((value) {
      UserModel userModel = UserModel.fromJson(value);
      BlocProvider.of<FavoriteBloc>(context)
          .add(GetFavoriteEvent(userId: userModel.data.id));
    });
  }
}
