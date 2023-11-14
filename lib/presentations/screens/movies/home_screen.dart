import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:scanner_app/api_service.dart';
import 'package:scanner_app/infrastructure/models/product/product.dart';
//import 'package:scanner_app/presentations/providers/movies/movies_providers.dart';
//import 'package:scanner_app/presentations/providers/products/products_providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _HomeView()),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  late String _counter, _value = "";
  List<Product> _products = [];
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    //ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    //ref.read(nowProductsProvider.notifier).loadNextPage();
  }

  Future _incrementCounter() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "Cancel", true, ScanMode.DEFAULT);
    final List<Product> products = await fetchDataFromApi(_counter);

    setState(() {
      _value = _counter;
      _products =
          products; // _albums es una variable de clase para almacenar los álbumes
    });
  }

  @override
  Widget build(BuildContext context) {
    // Resto de tu código...
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Valor capturado scan'),
            Text(_value, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columnSpacing: 20.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
                columns: [
                  DataColumn(
                    label: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'EAN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    tooltip: 'EAN', // Añade tooltip
                    // No necesitas numeric: false aquí
                  ),
                  DataColumn(
                    label: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'Nombre',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    tooltip: 'Nombre', // Añade tooltip
                    // No necesitas numeric: false aquí
                  ),
                ],
                rows: _products.map((Product product) {
                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08);
                        }
                        return const Color.fromARGB(82, 161, 188, 211)
                            .withOpacity(0.3);
                      },
                    ),
                    cells: [
                      DataCell(
                        Container(
                          constraints: const BoxConstraints(maxHeight: 80.0),
                          child: Center(
                            child: Text(
                              product.codEan,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          constraints: const BoxConstraints(maxHeight: 80.0),
                          child: Center(
                            child: Text(
                              product.nombreProducto,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            // Nueva fila con tres celdas
            Container(
              height: 80.0,
              // Ajusta la altura según tus necesidades
              decoration: BoxDecoration(
                color: Colors.orange,
                // Color de fondo de la primera fila
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _products.map((Product product) {
                  return Container(
                    constraints: const BoxConstraints(maxHeight: 90.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centra los elementos
                      children: [
                        const Text('PVP FULL',
                            style: TextStyle(color: Colors.black)),
                        const VerticalDivider(color: Colors.black),
                        SizedBox(
                          width: 90,
                          child: Center(
                            child: Text(
                              product.pvp,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const VerticalDivider(color: Colors.black),
                        SizedBox(
                          width: 70,
                          child: Center(
                            child: Text(
                              product.descuento,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            // Nueva fila con tres celdas
            Container(
              height: 80.0,
              // Ajusta la altura según tus necesidades
              decoration: BoxDecoration(
                color: Colors.blue,
                // Color de fondo de la segunda fila
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _products.map((Product product) {
                  return Container(
                    constraints: const BoxConstraints(maxHeight: 80.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centra los elementos
                      children: [
                        const Text('PVP FULL',
                            style: TextStyle(color: Colors.black)),
                        const VerticalDivider(
                            color: Colors.black), // Añade una línea vertical
                        const SizedBox(width: 150),
                        Text(
                          product.pvp,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 80.0,
              // Ajusta la altura según tus necesidades
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                // Color de fondo de la tercera fila
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _products.map((Product product) {
                  return Container(
                    constraints: const BoxConstraints(maxHeight: 80.0),
                    child: Flexible(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Centra los elementos
                        children: [
                          const Text('Evento',
                              softWrap: true,
                              style: TextStyle(color: Colors.black)),
                          Text(
                            product.pvp,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 350.0,
                          child: Image.network(_products[index].img),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.settings_overscan),
      ),
    );

  }
}
