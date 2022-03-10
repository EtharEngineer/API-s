import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/services/testJob_services.dart';
import 'package:flutter/cupertino.dart';

class testJobs_view_model extends ChangeNotifier {
  List<Jobs> _jobsList = [];
  List<String> interests_p = ['Engineer, Computer'];

  Future<void> fetchJobs(List interests) async {
    _jobsList = await Job_services().fetchJobs(interests_p);
    notifyListeners();
  }

  List<Jobs> get jobsList => _jobsList;
}
