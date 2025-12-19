import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_getx/models/details_data_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  RxList<DetailsDataModel> _dataList = <DetailsDataModel>[].obs;
  List<DetailsDataModel> get dataList => _dataList.value;

  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool val) => _isLoading.value = val;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
    print('on init being called');
  }

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('json/detail.json');
    _dataList.value =  DetailsDataModel.listFromJson(jsonString);
  }

  @override
  void onClose() {
    super.onClose();
    print('on close being called');
  }
}
