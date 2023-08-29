import 'package:coco/screens/allShopScreenCollection/single_product_screen.dart';
import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final String name;
  final String url;
  final int price;
  const CustomCard({super.key,required this.name,required this.price ,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context)=>SingleProduct(name: name)
            )
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    url
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        Text("Rs. ${price.toString()}",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text('Add to cart'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Buy Now!'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
