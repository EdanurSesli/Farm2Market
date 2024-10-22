import 'package:flutter/material.dart';
import 'category_card.dart';
import 'product_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Arama',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            children: const [
              CategoryCard(title: 'Sebze'),
              CategoryCard(title: 'Meyve'),
              CategoryCard(title: 'Hayvansal Ürünler'),
              CategoryCard(title: 'Ev Yapımı Ürünler'),
              CategoryCard(title: 'Tahıllar ve Baklagiller'),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const ProductCard(
                name: 'Domates',
                price: '10 ₺ / 1kg',
                image: 'assets/images/tomato.jpeg',
              );
            },
          ),
        ),
      ],
    );
  }
}
