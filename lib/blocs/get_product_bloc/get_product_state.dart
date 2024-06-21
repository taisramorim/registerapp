part of 'get_product_bloc.dart';

sealed class GetProductState extends Equatable {
  const GetProductState();
  
  @override
  List<Object> get props => [];
}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}
final class GetProductFailure extends GetProductState {}
final class GetProductSuccess extends GetProductState {
  final List<Product> products;
  
  const GetProductSuccess(this.products);
  
  @override
  List<Object> get props => [products];
}