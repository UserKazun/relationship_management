import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:relationship_management/src/services/auth.dart';

abstract class ItemsController {
  static Future createItem({
    String categoryKey,
    String name,
    String birthday,
    String hobby,
    bool isLiked,
  }) async {
    FirebaseUser user = await Auth.getCurrentUser();
    return Firestore.instance.collection('items').add({
      'uid': user.uid,
      'categoryKey': categoryKey,
      'name': name,
      'birthday': birthday,
      'hobby': hobby,
      'isLiked': isLiked,
    });
  }

  static Stream<QuerySnapshot> getUserItems(String uid) {
    return Firestore.instance
        .collection('items')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }
}
