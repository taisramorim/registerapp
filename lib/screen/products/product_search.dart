import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/blocs/get_product_bloc/get_product_bloc.dart';

class ProductSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ), onPressed: () {  },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final getProductBloc = BlocProvider.of<GetProductBloc>(context);
    final state = getProductBloc.state;

    if (state is GetProductSuccess) {
      final suggestions = state.products.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final product = suggestions[index];
          return ListTile(
            title: Text(product.name),
            onTap: () {
              close(context, product.name);
            },
          );
        } 
      );
    }else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}