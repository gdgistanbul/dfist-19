@JS()
library storage;

import 'package:js/js.dart';

external Storage get localStorage;

@JS()
class Storage {
  int length;
  external void setList(String key, List<String> item);
  external dynamic getList(String key);
  external void clear();
}
