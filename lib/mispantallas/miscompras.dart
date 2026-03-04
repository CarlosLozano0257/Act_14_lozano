import 'package:flutter/material.dart';

class MisCompras extends StatelessWidget {
  const MisCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text('Mis Compras', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildCompraItem(context, '26.04.26', 'HUF010'),
          const Divider(color: Colors.grey, thickness: 1),
          _buildCompraItem(context, '20.02.26', 'COOP123'),
          const Divider(color: Colors.grey, thickness: 1),
          _buildCompraItem(context, '14.02.26', 'FAM158'),
          const Divider(color: Colors.grey, thickness: 1),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, 0),
    );
  }

  Widget _buildCompraItem(BuildContext context, String fecha, String codigo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Espacio para la imagen G
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/gameshop.jpg', // <-- URL_DE_TU_IMAGEN_AQUI
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fecha, style: const TextStyle(fontSize: 16)),
                Text(codigo, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/detallecompra'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue[800]!, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Detalles', style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }

  // --- WIDGETS REUTILIZADOS EN TODAS LAS PANTALLAS ---
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