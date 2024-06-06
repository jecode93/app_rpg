import 'package:app_rpg/models/stats.dart';

class Character with Stats {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.id,
  });

  // fields
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // getters
  bool get isFave => _isFav;
  
  void toglleIsFav() {
    _isFav = !_isFav;
  }
}
