import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';

part 'cart_item.mapper.dart';

@MappableClass()
class CartItem with CartItemMappable {
  final Product product;
  final Set<ProductVariant> selectedVariants;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
    this.selectedVariants = const {},
  });

  static final prototype = CartItem(
    product: Product.prototype,
    quantity: 1,
    selectedVariants: {
      Product.prototype.variantsGroup[0].variants[0],
    },
  );
}
