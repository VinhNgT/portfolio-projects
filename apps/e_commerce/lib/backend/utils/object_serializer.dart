/// Store the serialization and deserialization functions for a class.
class ObjectSerializer<T> {
  ObjectSerializer({
    required this.fromJson,
    required this.toJson,
  });

  final T Function(Map<String, dynamic> json) fromJson;
  final Map<String, dynamic> Function(T object) toJson;
}
