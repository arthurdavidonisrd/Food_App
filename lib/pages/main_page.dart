import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Top App Bar
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            ),
          ],
        ),
        // Componente de Bottom Navigation ⤵️
        bottomNavigationBar: BottomNavigation(),

        // Corpo da página
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Títulos
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's eat",
                        style: TextStyle(
                          fontSize: 28,
                          color: const Color.fromARGB(255, 55, 55, 55),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Some great food!",
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // Campo de busca
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search your �🍟🍔",
                      labelText: "Search",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 228, 228, 228),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),

                // Seção de produtos recomendados
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Products",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Lista horizontal de comidas
                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFoodCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
                        title: 'Burger',
                        price: '\$12.99',
                        rating: '4.8',
                      ),
                      _buildFoodCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                        title: 'Pizza',
                        price: '\$15.99',
                        rating: '4.6',
                      ),
                      _buildFoodCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1559847844-5315695dadae',
                        title: 'Fries',
                        price: '\$8.99',
                        rating: '4.2',
                      ),
                      _buildFoodCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
                        title: 'Chicken',
                        price: '\$14.99',
                        rating: '4.5',
                      ),
                    ],
                  ),
                ),

                // Espaçamento para a próxima seção
                SizedBox(height: 30),

                // Seção de categorias
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Food Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // Grid de categorias
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  children: [
                    _buildCategoryItem(Icons.local_pizza, "Pizza"),
                    _buildCategoryItem(Icons.fastfood, "Fast Food"),
                    _buildCategoryItem(Icons.emoji_food_beverage, "Drinks"),
                    _buildCategoryItem(Icons.cake, "Desserts"),
                    _buildCategoryItem(Icons.icecream, "Ice Cream"),
                    _buildCategoryItem(Icons.set_meal, "Meals"),
                    _buildCategoryItem(Icons.restaurant, "Restaurant"),
                    _buildCategoryItem(Icons.more_horiz, "More"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir cards de comida
  Widget _buildFoodCard({
    required String imageUrl,
    required String title,
    required String price,
    required String rating,
  }) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem com coração de favorito
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          // Detalhes do produto
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(rating),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir itens de categoria
  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.orange.withOpacity(0.2),
          child: Icon(icon, color: Colors.orange),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
