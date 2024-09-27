// lib/src/domain/utils/ListToString.dart
String ListToString(dynamic data) {
  String message = "";
  if (data is List<dynamic>) {
    message = (data).join("");
  } else if (data is String) {
    message = data;
  }
  return message;
}
