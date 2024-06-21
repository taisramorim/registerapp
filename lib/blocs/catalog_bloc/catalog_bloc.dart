import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registerapp/models/catalog/catalog_model.dart';
import 'package:registerapp/repositories/catalog/catalog_repo.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepository _catalogRepository;
  
  CatalogBloc(this._catalogRepository) : super(CatalogInitial()) {
    on<CatalogEvent>((event, emit) async {
      emit(CatalogLoading());
      try {
        List<CatalogModel> catalog = await _catalogRepository.getCatalog();
        emit(CatalogSuccess(catalog));
      } catch (e) {
        emit(CatalogFailure());
      }
     });
  }
}
