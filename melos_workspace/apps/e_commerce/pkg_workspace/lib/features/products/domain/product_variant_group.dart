import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:objectbox/objectbox.dart';
import 'package:realm/realm.dart';

part 'product_variant_group.mapper.dart';
part 'product_variant_group.realm.dart';

typedef ProductVariantGroupId = Uuid;
typedef ProductVariantId = Uuid;
typedef ProductVariantIdsSelection
    = Map<ProductVariantGroupId, ProductVariantId?>;

@MappableClass()
class ProductVariantGroup with ProductVariantGroupMappable {
  final ProductVariantGroupId id;
  final String groupName;
  final List<ProductVariant> variants;

  const ProductVariantGroup({
    required this.id,
    required this.groupName,
    this.variants = const [],
  });

  ProductVariantGroup.newId({
    required this.groupName,
    required this.variants,
  }) : id = Uuid.v4();

  factory ProductVariantGroup.fromJson(Map<String, dynamic> json) =>
      ProductVariantGroupMapper.fromJson(json);

  factory ProductVariantGroup.fromRealmObj(ProductVariantGroupRealm obj) =>
      ProductVariantGroupRealmConverter.fromRealmObj(obj);

  @override
  String toString() {
    return '$id ($groupName)';
  }
}

@Entity()
class ProductVariantGroupObjBox {
  @Id()
  int objectBoxId = 0;

  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  final String id;
  final String groupName;
  final ToMany<ProductVariantObjBox> variants;

  ProductVariantGroupObjBox({
    required this.id,
    required this.groupName,
    required this.variants,
  });

  factory ProductVariantGroupObjBox.fromEntity(ProductVariantGroup obj) {
    return ProductVariantGroupObjBox(
      id: obj.id.toString(),
      groupName: obj.groupName,
      variants: ToMany(
        items: obj.variants.map(ProductVariantObjBox.fromEntity).toList(),
      ),
    );
  }

  ProductVariantGroup toEntity() {
    return ProductVariantGroup(
      id: Uuid.fromString(id),
      groupName: groupName,
      variants: variants.map((e) => e.toEntity()).toList(),
    );
  }
}

@realm
class $ProductVariantGroupRealm {
  @PrimaryKey()
  late Uuid id;
  late String groupName;
  late List<$ProductVariantRealm> variants;
}

extension ProductVariantGroupRealmConverter on ProductVariantGroup {
  static ProductVariantGroup fromRealmObj(ProductVariantGroupRealm obj) {
    return ProductVariantGroup(
      id: obj.id,
      groupName: obj.groupName,
      variants: obj.variants.map(ProductVariant.fromRealmObj).toList(),
    );
  }

  ProductVariantGroupRealm toRealmObj(Realm realm) {
    return ProductVariantGroupRealm(
      id: id,
      groupName: groupName,
      variants: variants.map((e) => e.toRealmObj()).toList(),
    );
  }
}