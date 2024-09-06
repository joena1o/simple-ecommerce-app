import 'package:ecommerce/Features/ShoppingCart/bloc/shopping_cart_bloc.dart';
import 'package:ecommerce/Features/Widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 28.0),
              child: const CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back)),
            ),
          ),
          title: const Text("My Cart"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(Icons.more_horiz),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
              builder: (context, state) {
                if (state is ShoppingCartLoadedState) {
                  int total = state.products.fold(0, (sum, e) => sum + e.price);
                  return Column(
                    children: [
                      Column(
                        children: List.generate(state.products.length, (index) {
                          return index < 3
                              ? Column(
                                  children: [
                                    CartItem(
                                      product: state.products[index],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Divider(),
                                    )
                                  ],
                                )
                              : CartItem(
                                  product: state.products[index],
                                );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Subtotal:",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "\$$total",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee:",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "\$5.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount:",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            height: 100,
            color: Colors.white,
            child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
              builder: (context, state) {
                if (state is ShoppingCartLoadedState) {
                  int total = state.products.fold(0, (sum, e) => sum + e.price);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Checkout for \$$total",
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Container();
              },
            )));
  }
}
