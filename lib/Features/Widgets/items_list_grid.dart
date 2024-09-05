import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:ecommerce/Features/HomeScreen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemsListGridView extends StatefulWidget {
  const ItemsListGridView({super.key});

  @override
  State<ItemsListGridView> createState() => _ItemsListGridViewState();
}

class _ItemsListGridViewState extends State<ItemsListGridView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(child: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoadedState) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: size.width / 530),
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductModel productModel = state.products[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/item', extra: state.products[index]);
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
                                  productModel.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[500]),
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
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child: Row(
                              children: [
                                Text(
                                  "\$${productModel.price}",
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
}
