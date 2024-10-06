
import 'package:teslo_app/features/products/domain/entities/product.dart';


//State notifier provider
class ProductsState {

  final int limit;
  final bool isLastPage;
  final int offset;
  final bool isLoading;
  final List<Product> products;

  ProductsState({
    this.isLastPage = false, 
    this.limit = 10, 
    this.offset = 0, 
    this.isLoading = false, 
    this.products = const[]
  });

  ProductsState copyWith(
    bool? isLastPage,
    int? offset,
    bool? isLoading,
    List<Product>? products
  ) => ProductsState(
    isLastPage: isLastPage ?? this.isLastPage,
    offset: offset ?? this.offset,
    isLoading: isLoading ?? this.isLoading,
    products: products ?? this.products
  );

}