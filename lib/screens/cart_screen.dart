import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return CartItem(
                  name: 'Ürün $index',
                  price: '20 ₺',
                  quantity: 1,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Toplam:', style: TextStyle(fontSize: 18)),
                    Text('60 ₺', style: TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Satın Al'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;

  const CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(name),
        subtitle: Text('Fiyat: $price - Miktar: $quantity'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // Ürünü sepetten kaldırma işlemi
          },
        ),
      ),
    );
  }
}
