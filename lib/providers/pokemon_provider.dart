// import 'package:flutter/material.dart';
// import '../models/pokemon.dart';
// import '../services/api_services.dart';

// class PokemonProvider with ChangeNotifier {
//   final ApiService _apiService = ApiService();
//   List<Pokemon> _pokemonList = [];
//   bool _isLoading = false;

//   List<Pokemon> get pokemonList => _pokemonList;
//   bool get isLoading => _isLoading;

//   Future<void> fetchPokemon() async {
//     _isLoading = true;
//     notifyListeners();

//     _pokemonList = await _apiService.fetchPokemonList();
//     _isLoading = false;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import '../models/pokemon.dart'; // Aunque este import no sea necesario para este código, lo he dejado por si acaso se usaría en otro lugar
import '../services/api_services.dart';

class PokemonProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String _dogImageUrl = "";
  bool _isLoading = false;

  String get dogImageUrl => _dogImageUrl;
  bool get isLoading => _isLoading;

  Future<void> fetchRandomDogImage() async {
    _isLoading = true;
    notifyListeners();

    try {
      _dogImageUrl = await _apiService.fetchRandomDogImage();
    } catch (e) {
      // Handle error
      print('Error fetching dog image: $e');
      _dogImageUrl = ""; // Clear previous image URL on error
    }

    _isLoading = false;
    notifyListeners();
  }
}
