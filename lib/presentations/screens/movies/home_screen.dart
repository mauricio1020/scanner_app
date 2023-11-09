import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:scanner_app/presentations/providers/movies/movies_providers.dart';
import 'package:scanner_app/presentations/providers/products/products_providers.dart';

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

  @override
  void initState() {
    super.initState();
    //ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(nowProductsProvider.notifier).loadNextPage();
  }

  Future _incrementCounter() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "Cancel", true, ScanMode.DEFAULT);
    setState(() {
      _value = _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
   // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowProducts = ref.watch(nowProductsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Valor capturado scan'),
          Text(_value, style: Theme.of(context).textTheme.headlineMedium),
          Expanded(
            child: ListView.builder(
              //itemCount: nowPlayingMovies.length,
              itemCount: nowProducts.length,
              itemBuilder: (context, index) {
               // final movie = nowPlayingMovies[index];
                final product = nowProducts[index];
                return ListTile(
                 // title: Text(movie.title),
                  title: Text(product.image),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.settings_overscan),
      ),
    );
  }
}
