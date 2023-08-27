import 'package:coco/screens/allShopScreenCollection/single_product_screen.dart';
import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final String name;
  final int price;
  const CustomCard({super.key,required this.name,required this.price});

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
                  image: const NetworkImage(
                    // 'https://i.pinimg.com/564x/2d/3f/cb/2d3fcb6ea71ba4e30ec95e94d8103068.jpg',
                    "https://picsum.photos/1600/1000",
                    //   "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Rs. ${price.toString()}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey
                        ),
                      ),
                    ],
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
