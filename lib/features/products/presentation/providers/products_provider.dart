
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/products/domain/domain.dart';
import 'package:teslo_app/features/products/presentation/providers/products_repository_provider.dart';


//State notifier provider
final productsProvider = StateNotifierProvider<ProductNotifier, ProductsState>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return ProductNotifier(productsRepository: productsRepository);
});


class ProductNotifier extends StateNotifier<ProductsState> {

  final ProductsRepository productsRepository;

  ProductNotifier({
    required this.productsRepository
    }): super(ProductsState() ) {
      loadNextPage();
    }

    Future<bool> createOrUpdateProduct(Map<String,dynamic> productLike) async {
      try {
        final product = await productsRepository.createUdateProduct(productLike);
        final isProductList = state.products.any((element) => element.id == product.id);

        if(!isProductList) {
          state = state.copyWith(
            products: [...state.products, product]
          );
          return true;
        }

        state = state.copyWith(
          products: state.products
          .map((element) => (element.id == product.id) ? product: element) .toList()
        );
        return true;
      }catch(e) {
        return false;
      }

    }

  Future loadNextPage() async {

    if(state.isLoading || state.isLastPage ) return;

    state = state.copyWith(
      isLoading: true
    );

    final products = await productsRepository
    .getAllProducts(limit: state.limit, offset: state.offset);

    if( products.isEmpty ) {
      state.copyWith(
        isLoading: false,
        isLastPage: true,
      );
      return;
    }

    state = state.copyWith(
      isLastPage: false,
      isLoading: false,
      offset: state.offset + 10,
      products: [...state.products, ...products]
    );

  }
  
}


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

  ProductsState copyWith({
    bool? isLastPage,
    int? offset,
    bool? isLoading,
    List<Product>? products
  }) => ProductsState(
    isLastPage: isLastPage ?? this.isLastPage,
    offset: offset ?? this.offset,
    isLoading: isLoading ?? this.isLoading,
    products: products ?? this.products
  );

}