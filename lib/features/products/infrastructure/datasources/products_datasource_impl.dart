

import 'package:dio/dio.dart';
import 'package:teslo_app/config/config.dart';
import 'package:teslo_app/features/products/infrastructure/mapers/product_maper.dart';

import '../../domain/domain.dart';

class ProductsDatasourceImpl extends ProductsDatasource{

  late final Dio dio;
  final String accessToken;

  ProductsDatasourceImpl({
    required this.accessToken
    }): dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        headers: {
          'Authorization': 'Bearer $accessToken'
        }
      )
    );

  @override
  Future<Product> createUdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement createUdateProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int offset = 0}) async{
    final response = await dio.get<List>('/products?limit=$limit&offset=$offset');
    final List<Product> products = [];
    for(var product in response.data ?? [] ){
      products.add( ProductMaper.jsonToEntity(product) );
    }
    return products;

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