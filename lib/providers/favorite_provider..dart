import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class FavoriteProvider with ChangeNotifier {
  List<int> _favoriteIds = [];
  SharedPreferences? _prefs;

  List<int> get favoriteIds => _favoriteIds;

  FavoriteProvider() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    try {
      if (_prefs == null) {
        _prefs = await SharedPreferences.getInstance();
        await _loadFavorites();
      }
    } catch (e) {
      debugPrint('Error initializing SharedPreferences: $e');
    }
  }

  bool isFavorite(int id) => _favoriteIds.contains(id);

  void toggleFavorite(int id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    _saveFavorites();
    notifyListeners();
  }


  Future<void> _saveFavorites() async {
    try {
      if (_prefs == null) {
        await _initPrefs();
      }
      if (_prefs != null) {
        await _prefs!.setString('favorites', json.encode(_favoriteIds));
      } else {
        debugPrint('SharedPreferences not initialized');
      }
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  // Load favorites from shared preferences
  Future<void> _loadFavorites() async {
    try {
      if (_prefs == null) {
        await _initPrefs();
      }
      if (_prefs != null) {
        final favoritesJson = _prefs!.getString('favorites');
        if (favoritesJson != null) {
          _favoriteIds = List<int>.from(json.decode(favoritesJson));
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }
}
