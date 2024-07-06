import 'package:dart_mappable/dart_mappable.dart';

class DurationSecondsMapper extends SimpleMapper<Duration> {
  const DurationSecondsMapper();

  @override
  Duration decode(dynamic value) {
    return Duration(seconds: int.parse(value));
  }

  @override
  dynamic encode(Duration self) {
    return self.inSeconds;
  }
}
