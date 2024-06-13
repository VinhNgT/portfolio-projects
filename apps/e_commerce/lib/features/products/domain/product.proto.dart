part of 'product.dart';

extension _ProductPrototypeX on Product {
  static const _prototype = Product(
    id: 1,
    title: 'Prototype Product\nPrototype Product',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
    category: 'proto',
    price: 9.99,
    discountPercentage: 7.17,
    rating: 4.94,
    stock: 5,
    tags: ['proto', 'proto2'],
    brand: 'Proto brand',
    sku: '99-Prototype-99',
    weight: 99,
    dimensions: ProductDimensions(
      width: 9,
      height: 99,
      depth: 999,
    ),
    warrantyInformation: '99 month warranty',
    shippingInformation: 'Ships in 9 month',
    availabilityStatus: 'Low Stock',
    reviews: [],
    returnPolicy: '99 days return policy',
    minimumOrderQuantity: 99,
    meta: ProductMeta(
      createdAt: '2024-05-23T08:56:21.618Z',
      updatedAt: '2024-05-23T08:56:21.618Z',
      barcode: '9164035109868',
      qrCode: 'https://dummyjson.com/public/qr-code.png',
    ),
    images: [
      'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
    ],
    thumbnail:
        'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
  );
}
