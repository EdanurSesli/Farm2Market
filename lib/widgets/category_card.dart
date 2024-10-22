import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(133, 8, 62, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final ScrollController _scrollController = ScrollController();

  void _scrollRight() {
    if (_scrollController.position.pixels <
        _scrollController.position.maxScrollExtent) {
      _scrollController.animateTo(
        _scrollController.position.pixels + 150, // Sağa kaydırma miktarı
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollLeft() {
    if (_scrollController.position.pixels >
        _scrollController.position.minScrollExtent) {
      _scrollController.animateTo(
        _scrollController.position.pixels - 150, // Sola kaydırma miktarı
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _scrollLeft,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            physics:
                const BouncingScrollPhysics(), // Kaydırma davranışı için gerekli
            child: Row(
              children: const [
                CategoryCard(title: "Sebze"),
                CategoryCard(title: "Meyve"),
                CategoryCard(title: "Hayvansal Ürünler"),
                CategoryCard(title: "Ev Yapımı Ürünler"),
                CategoryCard(title: "Tahıllar ve Baklagiller"),
                CategoryCard(title: "Diğer"),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: _scrollRight,
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: CategoryList(),
      ),
    ),
  ));
}
