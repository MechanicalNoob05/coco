import 'package:coco/models/shopitem_model.dart';
import 'package:flutter/material.dart';

import '../miscpages/payment_gateway.dart';
class SingleProduct extends StatelessWidget {
  final ShopItems productDetails;
  const SingleProduct({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Image(
                    image: NetworkImage(productDetails.url)
                ),
              ),
              Text(
                  "Rs.${productDetails.price.toString()}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10),
              Text(productDetails.desc,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(onPressed: (){}, child: Text("Add to Cart")),
                  FilledButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> const PaymentGateway(),
                        )
                    );
                  }, child: Text("Buy Now!"))
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      )
    );
  }
}
// Stack(
// children: [
// Hero(
//
// tag: "details${productDetails.id}",
// child: Image(
// width: double.infinity,
// image: NetworkImage(productDetails.url),
// fit: BoxFit.fill,
// ),
// ),
// ],
// ),