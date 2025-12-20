import 'dart:math';

import 'package:api_call/model/product_model.dart';
import 'package:api_call/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductLoading());

  ProductRepo productRepo = ProductRepo();

  Future<void> getProductData() async {
    await Future.delayed(Duration(seconds: 5));
    emit(const ProductLoading());
    try {
      final List<ProductModel> products = await productRepo
          .getProductData();
      emit(ProductLoaded(products));
    } catch (e, s) {
      print('ERROR: $e');
      print('STACK: $s');
      emit(ProductError(e.toString()));
    }
  }
}
