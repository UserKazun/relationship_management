import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:relationship_management/src/services/auth.dart';

abstract class ItemsController {
  static Future createItem({
    String name,
    String gender,
    String character,
    String character2,
    String character3,
    String hobby,
    bool isLiked,
  }) async {
    FirebaseUser user = await Auth.getCurrentUser();
    return Firestore.instance.collection('items').add({
      'uid': user.uid,
      'name': name,
      'gender': gender,
      'character': character,
      'character2': character2,
      'character3': character3,
      'hobby': hobby,
      'time': DateTime.now(),
      'isLiked': isLiked,
    });
  }

  static Stream<QuerySnapshot> getUserItems(String uid) {
    return Firestore.instance
        .collection('items')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  static Future deleteItem(String itemId) {
    return Firestore.instance.collection('items').document(itemId).delete();
  }

  static Future updateFavorite(String itemId, bool favorite) {
    return Firestore.instance
        .collection('items')
        .document(itemId)
        .updateData({'isLiked': favorite});
  }

  static List<DocumentSnapshot>filterAllItems(Iterable<DocumentSnapshot> items) {
    return items.where((item) => item['uid'] == '').toList();
  }
}
