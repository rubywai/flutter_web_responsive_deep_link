import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:text_view/api/model/country.dart';
import 'package:text_view/api/service/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:text_view/screen/responseive/responsive.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder<List<Country>>(
         future: ApiService(Dio()).getCountry(),
          builder: (ctx,snapshot){
            if(snapshot.hasData){
                return ListScreen(snapshot.data!);
            }
            else if(snapshot.hasError){
              return Center(child: Text("Error ${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          },
      )
    );
  }
  

}