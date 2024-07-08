// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/pokemon_provider.dart';
// import 'models/pokemon.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => PokemonProvider()),
//       ],
//       child: MaterialApp(
//         title: 'Flutter PokeAPI Demo',
//         home: PokemonListScreen(),
//       ),
//     );
//   }
// }

// class PokemonListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pokémon List'),
//       ),
//       body: Consumer<PokemonProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return ListView.builder(
//             itemCount: provider.pokemonList.length,
//             itemBuilder: (context, index) {
//               Pokemon pokemon = provider.pokemonList[index];
//               return ListTile(
//                 title: Text(pokemon.status),
//                 onTap: () {
//                   // Puedes agregar una navegación a un detalle de Pokémon aquí
//                 },
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<PokemonProvider>(context, listen: false).fetchPokemon();
//         },
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_provider.dart';
import 'models/pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Dog API Demo',
        home: DogImageScreen(),
      ),
    );
  }
}

class DogImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Dog Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<PokemonProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return CircularProgressIndicator();
                } else if (provider.dogImageUrl.isNotEmpty) {
                  return Image.network(
                    provider.dogImageUrl,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Text('Failed to load dog image.');
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PokemonProvider>(context, listen: false).fetchRandomDogImage();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
