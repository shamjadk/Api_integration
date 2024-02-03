import 'package:riverpod/riverpod.dart';
import 'package:screl_test/controller/api_service.dart';
import 'package:screl_test/model/api_model.dart';

final apiProvider = FutureProvider<List<ApiModel>?>((ref) async {
  return ApiService.fetchData();
});
