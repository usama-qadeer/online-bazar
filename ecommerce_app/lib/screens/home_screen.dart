// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/screens/signup_screen.dart';
import 'package:ecommerce_app/widget/category_box.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List images = [
  "https://images.pexels.com/photos/3965548/pexels-photo-3965548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/3951790/pexels-photo-3951790.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/626986/pexels-photo-626986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/3965548/pexels-photo-3965548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/3951790/pexels-photo-3951790.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/626986/pexels-photo-626986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
];
List category = [
  "GROCERY",
  "ELECTRONIC",
  "CLOTHS",
  "GARDEN",
  "HOUSE",
  "PHARMACY",
];

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> allProducts = [];
  List<String> pro = [];
  getData() async {
    await FirebaseFirestore.instance
        .collection("products")
        .get()
        .then((QuerySnapshot? snapshot) {
      snapshot!.docs.forEach((e) {
        setState(() {
          // print(allProducts[0].category);

          allProducts.add(
            ProductModel(
              // category: e["category"],
              productTitle: e["productTitle"],
              //  id: id,
            ),
          );
        });
      });
    });

    print(allProducts[0].productTitle);
    // print(allProducts.first.category!);
  }

  gge() async {
    await getData();
  }

  // myFun() {
  //   pro.add("value");
  //   print(pro);
  // }

  @override
  void initState() {
    gge();
    // myFun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Container(
                child: RichText(
                  text: const TextSpan(
                    text: "Online",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),
            const CategoryBox(),
            CarouselSlider(
              items: images
                  .map(
                    (e) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              e,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.redAccent.withOpacity(0.3),
                                  Colors.blueAccent.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Container(
                            //    width: 100,
                            color: Colors.black.withOpacity(0.4),
                            child: Text(
                              "TITLE",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
            ),
            Text("Popular items".toUpperCase()),
            Text(allProducts.toString()),
            Container(
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(allProducts[index].productTitle.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
