import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {
  const Buscar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Buscar', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black, size: 30),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Busquedas recientes:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            _buildBusquedaItem('> Free fire'),
            _buildBusquedaItem('> Clash royale'),
            _buildBusquedaItem('> Fortnite'),
            _buildBusquedaItem('> Minecraft'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, 1), // Índice 1: Buscar
    );
  }

  Widget _buildBusquedaItem(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(texto, style: const TextStyle(fontSize: 20)),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('G', style: TextStyle(color: Colors.blue[800], fontSize: 35, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.blue[800], size: 30),
              const SizedBox(width: 15),
              const Icon(Icons.account_circle, color: Colors.black87, size: 30),
            ],
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child: Container(color: Colors.black, height: 2.0),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, int currentIndex) {
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 2.0))),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) Navigator.pushReplacementNamed(context, '/miscompras');
          if (index == 1) Navigator.pushReplacementNamed(context, '/buscar');
          if (index == 2) Navigator.pushReplacementNamed(context, '/favoritos');
          if (index == 3) Navigator.pushReplacementNamed(context, '/perfil');
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: currentIndex == 0 ? Colors.blue[800] : Colors.black, size: 35), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: currentIndex == 1 ? Colors.blue[800] : Colors.black, size: 35), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: currentIndex == 2 ? Colors.blue[800] : Colors.black, size: 35), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: currentIndex == 3 ? Colors.blue[800] : Colors.black, size: 35), label: ''),
        ],
      ),
    );
  }
}