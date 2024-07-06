import 'package:dart_mappable/dart_mappable.dart';
import 'package:logger/logger.dart';

class LoggerLevelMapper extends SimpleMapper<Level> {
  const LoggerLevelMapper();

  @override
  Level decode(dynamic value) {
    return Level.values.byName(value);
  }

  @override
  dynamic encode(Level self) {
    return self.name;
  }
}
