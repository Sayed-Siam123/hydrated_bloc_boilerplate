import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider{

  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://devportal.flipper.com.bd/api/v1',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      "X-Authorization" : "1y8eGr8r75OOp2D4aMtbsDe6RJbONQL6iIOdH67COieqflQUBu52xTMFgBa6VJdE"
    }
  ));

  //static const _baseUrl = 'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me';
  
  /*Future<dynamic> fetchFeaturedSeller() async {
    Uri uri = Uri.parse("$_baseUrl&opt=trending_seller");
    Response response = await http.get(uri);
    return jsonDecode(response.body);
  }

  Future<dynamic> fetchTrendingProducts() async {
    Uri uri = Uri.parse("$_baseUrl&opt=trendingProducts");
    Response response = await http.get(uri);
    return jsonDecode(response.body);
  }

  Future<dynamic> fetchNewArrival() async {
    Uri uri = Uri.parse("$_baseUrl&opt=newArrivals");
    Response response = await http.get(uri);
    return jsonDecode(response.body);
  }

  Future<dynamic> fetchNewShops() async {
    Uri uri = Uri.parse("$_baseUrl&opt=newShops");
    Response response = await http.get(uri);
    return jsonDecode(response.body);
  }

  Future<dynamic> fetchProducts() async {
    Uri uri = Uri.parse("$_baseUrl&opt=stories");
    Response response = await http.get(uri);
    return jsonDecode(response.body);
  }*/

  fetchHomeData() async{
    var response = await dio.get("/product-categories");
    print(response.data);
  }

}