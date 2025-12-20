part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {
  const ProductLoading();
  @override
  List<Object> get props => [];
}

final class ProductLoaded extends ProductState {
  final List<ProductModel> productlist;

  const ProductLoaded(this.productlist);

  @override
  List<Object> get props => [productlist];
}

final class ProductError extends ProductState {
  final String errorMessage;

  const ProductError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
