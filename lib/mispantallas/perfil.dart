import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Perfil', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/avatar.jpg', // <-- URL_DE_TU_IMAGEN_AQUI
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('¡Hola!', style: TextStyle(fontSize: 24)),
              const Text('Carlos Lozano', style: TextStyle(fontSize: 28)),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/cerrarsesion'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('Cerrar Sesion', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[800]!, width: 4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text('Mis Juegos', style: TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, 3), // Índice 3: Perfil
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
          BottomNavigationBarItem(icon: Icon(Icons.person, color: currentIndex == 3 ? Colors.blue[800] : Colors.black, size: 35), label: ''),
        ],
      ),
    );
  }
}