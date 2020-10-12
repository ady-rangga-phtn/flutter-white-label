import 'package:flutter_white_label/data/network/endpoints.dart';
import 'package:flutter_white_label/data/network/rest_client.dart';
import 'package:flutter_white_label/models/products_model.dart';

class ProductsViewModel {
  RestClient resClient = RestClient();

  Future<List<ProductsModel>> getProducts() async {
    final response = await resClient.get(Endpoints.getProducts);
    return productsFromJson(response.toString());
  }
}