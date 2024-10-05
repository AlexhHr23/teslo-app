

import '../../domain/domain.dart';

class ProductsDatasourceImpl extends ProductsDatasource{
  @override
  Future<Product> createUdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement createUdateProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int offset = 0}) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Product> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> gsearchProductByTermn(String term) {
    // TODO: implement gsearchProductByTermn
    throw UnimplementedError();
  }

}