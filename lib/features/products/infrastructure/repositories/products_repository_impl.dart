

import '../../domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository{

  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<Product> createUdateProduct(Map<String, dynamic> productLike) {
    return datasource.createUdateProduct(productLike);
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int offset = 0}) {
    return datasource.getAllProducts(limit: limit, offset: offset);
  }

  @override
  Future<Product> getById(String id) {
    return datasource.getById(id);
  }

  @override
  Future<List<Product>> gsearchProductByTermn(String term) {
    return datasource.gsearchProductByTermn(term);
  }

}