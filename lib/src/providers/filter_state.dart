import 'package:flutter/cupertino.dart';

class FilterState with ChangeNotifier {
  FilterState();

  String nameFilter = '';
  bool filterEnabled = false;

}
