import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';

part 'new_cart_item_form.mapper.dart';

@MappableClass()
class NewCartItemForm with NewCartItemFormMappable {
  final int quantity;
  final ProductVariantIdsSelection variantSelection;

  const NewCartItemForm({
    required this.quantity,
    required this.variantSelection,
  }) : assert(quantity > 0);

  const NewCartItemForm.initial({required Product product})
      : this(
          quantity: 1,
          variantSelection: const {},
        );

  NewCartItemForm.fromCartItem(CartItem cartItem)
      : this(
          quantity: cartItem.orderItem.quantity,
          variantSelection: cartItem.orderItem.variantSelection,
        );
}
