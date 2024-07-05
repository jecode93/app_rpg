import 'package:app_rpg/models/character.dart';
import 'package:app_rpg/models/vocation.dart';
import 'package:app_rpg/services/firestore_service.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // save (update) character

  // remove character

  // initially fetch characters
  void fetchCharacterOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}
