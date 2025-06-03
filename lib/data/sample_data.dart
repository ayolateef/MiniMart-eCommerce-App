

import 'package:mini_mart_project/themes/app_images.dart';

import '../models/products.dart';

class SampleData {
  static final List<Product> products = [
    Product(
      id: 1,
      name: 'Apple iPhone 16 \n128GB|Teal',
      price: 700.00,
      imageUrl: AppImages.iPhone,
      description: 'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.\n'
          'There will be no visible cosmetic imperfections when held at an arm’s length.\n'
          'This product will have a battery which exceeds 80% capacity relative to new.\n'
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box.\n'
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
      inStock: true,
    ),
    Product(
      id: 2,
      name: 'M4 Macbook Air 13”\n256GB|Sky blue',
      price: 1000.00,
      imageUrl:  AppImages.laptop,
      description: 'High-performance smartphone with advanced camera.',
      inStock: true,
    ),
    Product(
      id: 3,
      name: 'Google Pixel 9A\n128GB|Iris',
      price: 499.00,
      imageUrl: AppImages.googlePixel,
      description: 'Powerful laptop for professional use.',
      inStock: true,
    ),
    Product(
      id: 4,
      name: 'Apple Airpods 4\nActive Noise Cancellation|Teal',
      price: 129.00,
      imageUrl: AppImages.iPod,
      description: 'Ergonomic wireless mouse for productivity.',
      inStock: true,
    ),
  ];
}