import 'package:flutter/material.dart';

class DetalleCompra extends StatelessWidget {
  const DetalleCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text('Detalles Compra', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildJuegoItem('Roblox', '450 \$', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/juego2.jpg'), // <-- URL_DE_TU_IMAGEN_AQUI
          const Divider(color: Colors.grey, thickness: 1),
          _buildJuegoItem('Minecraft', '500 \$', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/mclogo.jpg'), // <-- URL_DE_TU_IMAGEN_AQUI
          const Divider(color: Colors.grey, thickness: 1),
          _buildJuegoItem('Geometry Dash', '250 \$', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/gd.jpg'), // <-- URL_DE_TU_IMAGEN_AQUI
          const Divider(color: Colors.grey, thickness: 1),
          const SizedBox(height: 20),
          const Text('Estado: Pagado', style: TextStyle(fontSize: 22)),
          Row(
            children: [
              const Text('Costo total: ', style: TextStyle(fontSize: 22)),
              Text('\$1,200', style: TextStyle(fontSize: 22, color: Colors.blue[800], fontWeight: FontWeight.bold)),
            ],
          ),
          const Text('Compra: HUF0045', style: TextStyle(fontSize: 22)),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, 0),
    );
  }

  Widget _buildJuegoItem(String nombre, String precio, String urlImagen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.network(urlImagen, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nombre, style: const TextStyle(fontSize: 20)),
              Text(precio, style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
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