import 'dart:convert';
import 'package:pharmacy_store/model/category.dart';
import 'package:http/http.dart' as http;


class CategoryService {

  Future<List<ProductCategory>> getCategories() async {
    var client = http.Client();
    try{
      var uri = Uri.parse("https://pharmacy-api-eta.vercel.app/api/v1/categories");
      var response = await client.get(uri);
      if(response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        List categoryList = json['data'];
        List <ProductCategory> category = categoryList.map((category)=> ProductCategory.fromJson(category)).toList();
        return category;
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