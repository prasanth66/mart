import 'package:mart/model/product_model.dart';

int mySortComparisonAsc(ProductModel a, ProductModel b) {
  final propertyA = a.rating;
  final propertyB = b.rating;
  if (propertyA < propertyB) {
    return -1;
  } else if (propertyA > propertyB) {
    return 1;
  } else {
    return 0;
  }
}

int mySortComparisonDsc(ProductModel a, ProductModel b) {
  final propertyA = a.rating;
  final propertyB = b.rating;
  if (propertyA < propertyB) {
    return 1;
  } else if (propertyA > propertyB) {
    return -1;
  } else {
    return 0;
  }
}

