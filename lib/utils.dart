import 'package:flutter/foundation.dart';

List<int>? convertToIntList(Object? object) {
  try {
    if (object == null) return null;

    // If object is already a List<int>
    if (object is List<int>) return object;

    // If object is a List of something else
    if (object is List) {
      return object.map((item) {
        if (item is int) return item;
        if (item is String) return int.parse(item);
        throw FormatException('Cannot convert item $item to int');
      }).toList();
    }

    // If object is something else entirely
    throw FormatException('Object $object cannot be converted to List<int>');
  } catch (e) {
    if (kDebugMode) {
      print('Error converting to List<int>: $e');
    }
    return null;
  }
}
