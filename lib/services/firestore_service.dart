import 'package:app_rpg/models/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final ref =
      FirebaseFirestore.instance.collection('characters').withConverter(
            fromFirestore: Character.fromFirestore,
            toFirestore: (Character c, _) => c.toFirestore(),
          );
}
