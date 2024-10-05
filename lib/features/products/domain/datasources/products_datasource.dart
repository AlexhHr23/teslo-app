

import '../entities/product.dart';

abstract class ProductsDatasource {

  Future<List<Product>>getAllProducts({int limit = 10, int offset = 0});
  Future<Product>getById(String id);
  Future<List<Product>>gsearchProductByTermn(String term);
  Future<Product>createUdateProduct(Map<String,dynamic> productLike);

}