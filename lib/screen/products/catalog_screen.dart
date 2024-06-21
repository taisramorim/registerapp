import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/blocs/get_product_bloc/get_product_bloc.dart';
import 'package:registerapp/models/product/product_model.dart';
import 'package:registerapp/screen/products/product_search.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});
  static const String id = 'catalog-screen';

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'All';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Our Catalog'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context, 
                delegate: ProductSearch()
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildCategoryButtons(),
            Expanded(
              child: BlocBuilder<GetProductBloc, GetProductState>(
                builder: (context, state) {
                  if (state is GetProductSuccess) {
                    // Filter products by search query
                    final filteredProducts = state.products.where((product) {
                      final matchesQuery = product.name.toLowerCase().contains(_searchQuery.toLowerCase());
                      final matchesCategory = _selectedCategory == 'All' || product.category == _selectedCategory;
                      return matchesQuery && matchesCategory;
                    }).toList();            
                     return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 9 / 17,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, int i) {
                          final product = filteredProducts[i];
                          return Material(
                            elevation: 3,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                // Handle product tap
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        product.imageUrl,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      product.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      limitDescription(product.description),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is GetProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text('Error'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    final categories = ['All', 'Bem Estar', 'Capilar', 'Saúde', 'Others'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(category),
              selected: _selectedCategory == category,
              onSelected: (isSelected) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  String limitDescription(String description) {
    int dotIndex = description.indexOf('.');
    return dotIndex != -1
        ? description.substring(0, dotIndex + 1)
        : description;
  }
}