import 'dart:convert';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchlistStorage {
  static const String _watchlistKey = "watchlist";
  static const String _historyKey = "history";

  /// Load watchlist
  static Future<List<MovieDetials>> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(_watchlistKey) ?? [];
    return list.map((e) => MovieDetials.fromJson(jsonDecode(e))).toList();
  }

  /// Toggle movie in watchlist
  static Future<void> toggle(MovieDetials movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<MovieDetials> currentList = await load();

    bool exists = currentList.any((m) => m.id == movie.id);
    if (exists) {
      currentList.removeWhere((m) => m.id == movie.id);
    } else {
      currentList.add(movie);
    }

    List<String> encoded =
        currentList.map((m) => jsonEncode(m.toJson())).toList();
    await prefs.setStringList(_watchlistKey, encoded);
  }

  /// Check if movie exists in watchlist
  static Future<bool> isSaved(int id) async {
    List<MovieDetials> currentList = await load();
    return currentList.any((m) => m.id == id);
  }

  /// Load history
  static Future<List<MovieDetials>> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(_historyKey) ?? [];
    return list.map((e) => MovieDetials.fromJson(jsonDecode(e))).toList();
  }

  /// Add movie to history
  static Future<void> addToHistory(MovieDetials movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<MovieDetials> currentList = await loadHistory();
    // prevent duplicates
    currentList.removeWhere((m) => m.id == movie.id);
    currentList.insert(0, movie); // newest on top
    List<String> encoded =
        currentList.map((m) => jsonEncode(m.toJson())).toList();
    await prefs.setStringList(_historyKey, encoded);
  }

  /// Optional: Profile info
  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  static Future<int?> getAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("avatarId");
  }
}
