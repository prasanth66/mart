import 'package:get/get_rx/src/rx_types/rx_types.dart';
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

int sortString(ProductModel a, ProductModel b) {
  final propertyA = a.name.toLowerCase();
  final propertyB = b.name.toLowerCase();
  int compare = propertyA.compareTo(propertyB);
  if (compare < 0) {
    return -1;
  } else if (compare > 0) {
    return 1;
  } else {
    return 0;
  }
}

