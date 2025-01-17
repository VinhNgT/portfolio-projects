/// Generate ids for testing purposes.
///
/// The [baseId] is used to generate ids with a specific prefix.
///
/// The final id will be generated by concatenating the [baseId] with the
/// current id. The current id is a number that is padded with zeros to match
/// the length of the [to] number.
///
/// For example if [baseId] is 1234, [from] is 1, and [to] is 9999, the
/// generated ids will be 12340001, 12340002, ..., 12349999.
class MockIdsGenerator implements Iterator<int> {
  /// Create a new instance of [MockIdsGenerator].
  MockIdsGenerator({
    this.baseId,
    this.from = 1,
    this.to = 9999,
  }) {
    assert(from < to);
    assert(from >= 0);
    _current = from;
  }

  /// The base id to use as a prefix for the generated ids.
  final int? baseId;

  /// The starting id.
  final int from;

  /// The ending id.
  final int to;

  late int _current;

  @override
  int get current => int.parse(
        '${baseId ?? ''}'
        '${_current.toString().padLeft(to.toString().length, '0')}',
      );

  @override
  bool moveNext() {
    if (_current < to) {
      _current++;
      return true;
    }

    return false;
  }

  /// Move to the next id and return it.
  ///
  /// This is the equivalent of calling [moveNext] and then [current].
  ///
  /// If the generator has reached the end, a [StateError] will be thrown.
  int moveNextAndGet() {
    if (moveNext()) {
      return current;
    }

    throw StateError('Generator has reached the end.');
  }
}
