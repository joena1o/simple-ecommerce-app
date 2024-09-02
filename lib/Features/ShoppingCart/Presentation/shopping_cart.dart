import 'package:ecommerce/Features/Widgets/cart_item.dart';
import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                Column(
                  children: List.generate(3, (index) {
                    return index < 3
                        ? const Column(
                            children: [
                              CartItem(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Divider(),
                              )
                            ],
                          )
                        : const CartItem();
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal:",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "\$800.00",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
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
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount:",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "40%",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            height: 100,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout for \$480",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
