import 'dart:convert';

import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/API/model/Jobs_model.dart';

import 'package:http/http.dart' as http;

class Job_services {
  final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<Jobs>> fetchJobs(List interests) async {
    try {
      var url;
      List<Jobs> allData = [];
      print("**************#######&&&&&&&&");
      print(interests);
      for (String interest in interests) {
        url = Uri.parse(
            'https://customsearch.googleapis.com/customsearch/v1?cx=931e438f39f6499c6&exactTerms=${interests}&sort=date&key=AIzaSyCC9TrOYMA6FKhBrd57u113aRIfoy2iDEQ');

        http.Response response = await http.get(url);
        List<Jobs> jobs_list = [];
        if (response.statusCode == 200) {
          String data = response.body;
          var jsonData = jsonDecode(data);

          Jobs_model jobs = Jobs_model.fromJson(jsonData);
          jobs_list = jobs.jobs_model.map((e) => Jobs.fromJson(e)).toList();
          allData = [...allData, ...jobs_list];
          // print(news_list);

        } else {
          throw (response.statusCode);
        }
      }
    } catch (e) {
      throw (e.toString());
    }
    return [];
  }
}
