part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState();
  
  @override
  List<Object> get props => [];
}

final class CatalogInitial extends CatalogState {}

final class CatalogFailure extends CatalogState{}
final class CatalogLoading extends CatalogState {}
final class CatalogSuccess extends CatalogState {
  final List<CatalogModel> catalog;
  const CatalogSuccess(this.catalog);
  
  @override
  List<Object> get props => [catalog];
}
