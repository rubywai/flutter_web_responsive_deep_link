import 'package:text_view/api/model/country.dart';

import '../../const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';
@RestApi(baseUrl : Const.BASE_URL)
abstract class ApiService{
 factory ApiService(Dio dio) => _ApiService(dio);

 @GET(Const.ALL)
 Future<List<Country>> getCountry();

}