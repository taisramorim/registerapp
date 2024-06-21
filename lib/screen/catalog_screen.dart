import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/blocs/catalog_bloc/catalog_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 0, 95, 98),
          foregroundColor: Colors.white,
          title: const Text('Products'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogSuccess) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 9 / 17,
                  ),
                  itemCount: state.catalog.length,
                  itemBuilder: (context, int i) {
                    final catalog = state.catalog[i];
                    return Material(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  catalog.imageUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                catalog.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                limitDescription(catalog.description),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is CatalogLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Error'));
              }
            },
          ),
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