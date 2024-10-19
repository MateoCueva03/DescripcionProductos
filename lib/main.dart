import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equipos Tecnológicos',
      theme: ThemeData(
        primaryColor: Colors.teal,
        secondaryHeaderColor: Colors.orangeAccent,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ElementosScreen(),
    );
  }
}

class ElementosScreen extends StatelessWidget {
  final List<Elemento> elementos = [
    Elemento(
      nombre: 'Monitor',
      descripcion: 'MONITOR LG 27Inc IPS Full HD 1ms 75Hz-FreeSync | 27MP60G-B',
      imagenUrl:
          'https://i0.wp.com/cemco.com.ec/wp-content/uploads/2021/10/Monitor-LG-27MP60G-B.webp?fit=720%2C660&ssl=10',
    ),
    Elemento(
      nombre: 'Smartwatch',
      descripcion:
          'Compatible con Teléfonos HUAWEI, iOS y Android. Batería de Hasta 2 Semanas.',
      imagenUrl: 'https://m.media-amazon.com/images/I/41Bj9wVPp+L._AC_.jpg',
    ),
    Elemento(
      nombre: 'NUBWO G06',
      descripcion:
          'Audífonos inalámbricos para videojuegos con micrófono para PS5, PS4.',
      imagenUrl:
          'https://m.media-amazon.com/images/I/61hRlwVl79L.__AC_SY300_SX300_QL70_FMwebp_.jpg',
    ),
    Elemento(
      nombre: 'iPhone 16',
      descripcion:
          'Pantalla Super Retina XDR; Resolución de 2556 x 1179 pixeles a 460 ppi.',
      imagenUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfScXp8-PnaCWmryWIwEeDB6ryfdgAxdYyRQ&s',
    ),
    Elemento(
      nombre: 'Smart TV 43',
      descripcion:
          'Pantalla LED 4K UHD, sonido Dolby Digital Plus, potencia de salida de 20 W.',
      imagenUrl:
          'https://i0.wp.com/novedadeskaren.ec/wp-content/uploads/2022/09/43LM6350PSB.jpg?fit=1000%2C1000&ssl=1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Equipos Tecnológicos'),
      ),
      body: ListView.builder(
        itemCount: elementos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetalleElementoScreen(elemento: elementos[index]),
                ),
              );
            },
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              color: Colors.teal[50],
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    elementos[index].imagenUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  elementos[index].nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, // Aumentar el tamaño de fuente
                    color: Colors.teal,
                  ),
                ),
                subtitle: Text(
                  elementos[index].descripcion,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14, // Tamaño de fuente más legible
                    color:
                        Colors.black87, // Color más oscuro para mejor contraste
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.teal),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetalleElementoScreen extends StatelessWidget {
  final Elemento elemento;

  const DetalleElementoScreen({super.key, required this.elemento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(elemento.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(elemento.imagenUrl,
                    height: 200, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              elemento.nombre,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Text(
              elemento.descripcion,
              style: const TextStyle(
                  fontSize: 16, color: Colors.black87), // Color más oscuro
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                textStyle: const TextStyle(
                    fontSize: 16), // Aumentar el tamaño del texto del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Elemento {
  final String nombre;
  final String descripcion;
  final String imagenUrl;

  Elemento(
      {required this.nombre,
      required this.descripcion,
      required this.imagenUrl});
}
