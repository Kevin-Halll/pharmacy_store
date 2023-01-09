import 'dart:convert';

import 'package:pharmacy_store/model/products.dart';
import 'package:http/http.dart' as http;


class ProductService {

  // Since this function returns a list of products for cases of an error you can just return an empty array.
  // Better practice is to have this function smaller and only doing a single thing.
  // This way you do not need to return a null value.
  Future<List<Product>> getProducts() async {
    var client = http.Client();
    try{
      var uri = Uri.parse("https://pharmacy-api-eta.vercel.app/api/v1/products");
      var response = await client.get(uri);
      //The response comes from the get client. therefore it has statusCode and body which is very important.
      //Having this range ensures that any successful status code will be accounted for
      if(response.statusCode >= 200 && response.statusCode < 300) {
        // The response.body is a string so we need to convert it to a map so we can properly mutate and get the other data types in the response.
        var json = jsonDecode(response.body);
        //use the data property of the json response, then tell dart that we want to use it as a List.
        List productList = json['data'];
        //Since we have a list we have access to the map function which we use to transform the data into a Product with the fromJson method.
        List <Product> products = productList.map((product)=> Product.fromJson(product)).toList();
        return products;
      } else {
        print("failed to get products");
        return [];
      }
    }catch(error){
      print(error);
      return [];
    }

  }
}