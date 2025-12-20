import 'package:api_call/controller/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductCubit()..getProductData(),

        child: Scaffold(
          appBar: AppBar(title: const Text('Product List')),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              switch (state) {
                case ProductLoading():
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                case ProductLoaded():
                  return GridView(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                        ),
                    children: [
                      for (var product in (state).productlist)
                        Card(
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                    ],
                  );
                case ProductError():
                  // TODO: Handle this case.
                  return Center(
                    child: Text('Error: ${(state).errorMessage}'),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
