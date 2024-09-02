import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: size.width,
      // height: 130,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            width: size.width / 3,
            height: 120,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Xbox Series X",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "1 TB",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "\$570.00",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("1"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
