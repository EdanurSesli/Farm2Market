import 'package:farmapp/screens/productadd_screen.dart';
import 'package:farmapp/screens/seller_verification_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: ListTile(
                    title: Text('Ad Soyad'),
                    subtitle: Text('mail@gmail.com'),
                  ),
                ),
                Icon(Icons.settings),
                Icon(Icons.notifications),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Ürün Ekle'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductAddScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Satıcı Doğrulama (Belge Ekle)'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SellerVerificationScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Alışlarım'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping),
              title: const Text('Satışlarım'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Ürün ve Satıcı Yorumlarım'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Farm2Market Müşteri Hizmetleri'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış Yap'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
