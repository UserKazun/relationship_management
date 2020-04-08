import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:relationship_management/src/services/auth.dart';

abstract class CategoryController {
  static Map<String, dynamic> _categoryKey = {
    'category_key': ['全て', '最近', 'お気に入り', '仕事', 'プライベート']
  };

  static Future<Map<String, dynamic>> fetchCategoryKey() async {
    try {
      FirebaseUser user = await Auth.getCurrentUser();
      DocumentSnapshot doc = await Firestore.instance
          .collection('categoryKey')
          .document(user.uid)
          .get();
      if (doc == null) return _categoryKey;
      return {
        'category_key': List<String>.from(doc.data['categoryKey'])
      };
    } catch (error) {
      return null;
    }
  }

  static void updateCategoryKey(Map<String, dynamic> categoryKey) async {
    FirebaseUser user = await Auth.getCurrentUser();
    await Firestore.instance
        .collection('categoryKey')
        .document(user.uid)
        .setData(categoryKey);
  }
}
