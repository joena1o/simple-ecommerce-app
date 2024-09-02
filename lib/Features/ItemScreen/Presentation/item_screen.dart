import 'package:flutter/material.dart';
import 'package:ecommerce/utils/utility_class.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
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
                  expandedHeight: 400.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(),
                  ),
                  actions: const [
                    CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite)),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.share)),
                    SizedBox(width: 20)
                  ]),
            ];
          },
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Xbox Series X",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600)),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("% On Sale",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
              Padding(
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 28),
                            SizedBox(
                              width: 10,
                            ),
                            Text("4.8",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600))
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.thumb_up_sharp,
                                color: Colors.green, size: 28),
                            SizedBox(
                              width: 10,
                            ),
                            Text("40%",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600))
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("117 reviews",
                        style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
              ),
              Padding(
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: const Text(
                    "The Microsoft Xbox Series X gaming console Is capable of impressing with minimal boot times and mesmerizing visual effects when playing games at up to 120 frames per second",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Container(
                  width: size.width,
                  padding: UtilityClass.horizontalAndVerticalPadding,
                  child: Wrap(
                      alignment: WrapAlignment.start,
                      children: List.generate(10, (i) {
                        return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("1 TB",
                                style: TextStyle(fontSize: 18)));
                      })))
            ]),
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
                  const Text("\$652",
                      style: TextStyle(fontSize: 25, color: Colors.black38)),
                  SizedBox(
                    width: size.width / 6,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add to Cart",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
