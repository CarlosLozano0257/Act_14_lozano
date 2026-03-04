import 'package:flutter/material.dart';

class CerrarSesion extends StatelessWidget {
  const CerrarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Cerrar Sesión',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Cancelar', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/miscompras', (route) => false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[800]!, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Salir', style: TextStyle(fontSize: 18, color: Colors.blue[800])),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, 3), // Mantiene el icono de perfil activo
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