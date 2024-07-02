import 'package:app_rpg/models/character.dart';
import 'package:app_rpg/models/vocation.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
        id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
    Character(
        id: '2',
        name: 'Jonny',
        vocation: Vocation.junkie,
        slogan: 'Light me up...'),
    Character(
        id: '3',
        name: 'Crimson',
        vocation: Vocation.raider,
        slogan: 'Fire in the hole!'),
    Character(
        id: '4',
        name: 'Shaun',
        vocation: Vocation.ninja,
        slogan: 'Alright then gang.'),
  ];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
