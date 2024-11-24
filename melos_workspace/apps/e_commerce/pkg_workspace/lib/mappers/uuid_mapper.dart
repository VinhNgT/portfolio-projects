import 'package:dart_mappable/dart_mappable.dart';
import 'package:sane_uuid/uuid.dart';

class UuidMapper extends SimpleMapper<Uuid> {
  const UuidMapper();

  @override
  Uuid decode(dynamic value) {
    return Uuid.fromString(value);
  }

  @override
  dynamic encode(Uuid self) {
    return self.toString();
  }
}
