import 'package:flutter/material.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();

  String productName = '';
  String productDescription = '';
  String productWeightOrAmount = '';
  String productAddress = '';
  String productFullAddress = '';
  String productCategory = '';
  String productQuality = 'A';
  String productPrice = '';
  String productImage = '';
  String selectedUnitType = 'Kilogram';

  final List<String> unitTypes = ['Kilogram', 'Adet', 'Litre', 'Diğer'];
  final List<String> qualityOptions = ['A (En iyi)', 'B', 'C'];
  final List<String> category = [
    'Meyve',
    'Sebze',
    'Hayvansal Ürünler',
    'Tahıllar ve Baklagiller',
    'Ev Yapımı Ürünler'
  ];

  final Map<String, List<String>> citiesAndDistricts = {
    'İstanbul': [
      'Adalar',
      'Arnavutköy',
      'Ataşehir',
      'Avcılar',
      'Bağcılar',
      'Bahçelievler',
      'Bakırköy',
    ],
    'Ankara': [
      'Akyurt',
      'Altındağ',
      'Ayaş',
      'Bala',
      'Beypazarı',
    ],
    'İzmir': [
      'Aliağa',
      'Balçova',
      'Bayındır',
      'Bayraklı',
      'Bergama',
    ],
  };

  List<String> districts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Ekle'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ürün Adı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Ürünün adını girin",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    productName = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ürün adı gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürün Açıklaması",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: "Ürün hakkında kısa açıklama",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    productDescription = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ürün açıklaması gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürünün Ölçü Birimini Seçin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: selectedUnitType,
                  items: unitTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUnitType = newValue!;
                    });
                  },
                  onSaved: (value) {
                    productWeightOrAmount = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ölçü birimi gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürünün Miktarı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ör: 50 ${selectedUnitType.toLowerCase()}",
                    border: const OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    productWeightOrAmount =
                        "$value ${selectedUnitType.toLowerCase()}";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Miktar bilgisi gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Gönderim Adresi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text("İl seçin"),
                  items: citiesAndDistricts.keys.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (String? newCity) {
                    setState(() {
                      districts = citiesAndDistricts[newCity!]!;
                    });
                  },
                  onSaved: (value) {
                    productAddress = "İl: ${value!}, ";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'İl bilgisi gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text("İlçe seçin"),
                  items: districts.map((String district) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                  onSaved: (value) {
                    productAddress += "İlçe: ${value!}";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'İlçe bilgisi gerekli';
                    }
                    return null;
                  },
                  onChanged: (String? value) {},
                ),
                const SizedBox(height: 8),
                const Text(
                  "Tam Adres",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Tam adresinizi girin",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    productFullAddress = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tam adres bilgisi gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürün Kategorisi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text("Kategori seçin"),
                  items: category.map((String cat) {
                    return DropdownMenuItem<String>(
                      value: cat,
                      child: Text(cat),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      productCategory = newValue!;
                    });
                  },
                  onSaved: (value) {
                    productCategory = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kategori bilgisi gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürün Kalitesi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: productQuality.isNotEmpty ? productQuality : null,
                  items: [
                    DropdownMenuItem(value: 'A', child: Text('A (En iyi)')),
                    DropdownMenuItem(value: 'B', child: Text('B')),
                    DropdownMenuItem(value: 'C', child: Text('C')),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      productQuality = value!;
                    });
                  },
                  onSaved: (value) {
                    productQuality = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ürün kalitesi gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürün Fiyatı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ör: 15 ₺ / ${selectedUnitType.toLowerCase()}",
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    productPrice =
                        "$value ₺ / ${selectedUnitType.toLowerCase()}";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ürün fiyatı gerekli';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ürün Görselini Ekleyin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                      label: const Text("Görsel Ekle"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromRGBO(133, 8, 62, 1), // Buton rengi
                        foregroundColor: Colors.white, // Yazı rengi
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Ürün kaydetme işlemi
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Ürün başarıyla eklendi!')),
                        );
                      }
                    },
                    child: const Text('Farm2Market Üzerinden Sat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(133, 8, 62, 1), // Buton rengi
                      foregroundColor: Colors.white, // Yazı rengi
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
