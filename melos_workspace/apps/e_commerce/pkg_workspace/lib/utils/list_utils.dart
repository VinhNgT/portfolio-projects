import 'package:collection/collection.dart';

extension ListX<E> on List<E> {
  /// Separates the elements of the list with the specified separator.
  ///
  /// The [separator] is inserted between each pair of elements in the list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4];
  /// List<int> separatedNumbers = numbers.separated(0);
  /// print(separatedNumbers); // Output: [1, 0, 2, 0, 3, 0, 4]
  /// ```
  ///
  /// Returns a new list with the elements separated by the [separator].
  List<E> separated(E separator) {
    return fold(
      [],
      (previousValue, element) {
        if (previousValue.isNotEmpty) {
          previousValue.add(separator);
        }
        previousValue.add(element);
        return previousValue;
      },
    );
  }
}

/// A [List] that uses [ListEquality] to compare equality instead of
/// [List.==].
class EqualityList<T> extends DelegatingList<T> {
  /// Creates a new [EqualityList] that delegates to [base].
  EqualityList(super.base);

  /// Creates a new [EqualityList] from an [Iterable].
  EqualityList.from(Iterable<T> elements) : super(elements.toList());

  final listEquality = ListEquality<T>();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is List<T> &&
          runtimeType == other.runtimeType &&
          listEquality.equals(this, other);

  @override
  int get hashCode => Object.hashAll(this);
}
