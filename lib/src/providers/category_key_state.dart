import 'package:flutter/cupertino.dart';
import 'package:relationship_management/src/controllers/category_controller.dart';

class CategoryKeyState extends ChangeNotifier {
  Map<String, dynamic> _saveCategoryKey = {
    'categoryKey': ['仕事', 'プライベート']
  };

  CategoryKeyState() {
    _fetchFromDatabase();
  }

  Map<String, List<String>> get categoryKey {
    Map<String, List<String>> formatted = Map();
    formatted['categoryKey'] = _saveCategoryKey['categoryKey'].cast<String>();

    return formatted;
  }

  void _fetchFromDatabase() async {
    Map<String, dynamic> categoryKey =
        await CategoryController.fetchCategoryKey();
    if (categoryKey != null) _saveCategoryKey = categoryKey;
    notifyListeners();
  }

  void updateCategoryKey(String categoryKey) {
    notifyListeners();
    CategoryController.updateCategoryKey(_saveCategoryKey);
  }
}
