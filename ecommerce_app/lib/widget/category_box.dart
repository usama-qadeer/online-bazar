import 'dart:math';

import 'package:ecommerce_app/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categories.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              child: Column(
                children: [
                  Container(
                    height: 15.h,
                    width: 15.w,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${categories[index].image}"),
                            fit: BoxFit.contain),
                        shape: BoxShape.circle,
                        color: Colors
                            .primaries[Random().nextInt(categories.length)],
                      ),
                      //   child: Center(),
                    ),
                  ),
                  Text(
                    categories[index].title!,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
