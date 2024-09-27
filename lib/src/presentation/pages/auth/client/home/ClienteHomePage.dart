// lib/src/presentation/pages/auth/client/home/ClienteHomePage.dart
import 'package:demo_view_shopify/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:flutter/material.dart';

//vista cliente contenido
class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Boss'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/woman.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Text('Menu de opciones',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Colors.green,
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              iconColor: Colors.green,
              title: Text('Ventas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              iconColor: Colors.green,
              title: Text('Productos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              iconColor: Colors.green,
              title: Text('Salir'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
