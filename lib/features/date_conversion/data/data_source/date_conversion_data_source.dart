// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eternal_calander_new/core/api_service/api_consumer.dart';
import 'package:eternal_calander_new/core/api_service/end_points.dart';
import 'package:eternal_calander_new/core/heleprs/print_helper.dart';
import 'package:eternal_calander_new/features/date_conversion/data/models/selected_date_conversion_model.dart';

class HomeRepoDataSource {
  final ApiConsumer api;
  HomeRepoDataSource({
    required this.api,
  });
  Future<SelectedDateConversionModel> getDateConversion(DateTime selectedDate) async {
    final t = prt('getDateConversion - HomeRepoDataSource');
    final data = await api.get(
      '${EndPoint.dateConversionEndPoint}/${selectedDate.toString()}',
    );
    SelectedDateConversionModel model = pr(SelectedDateConversionModel.fromJson(data), t);
    return model;
  }
}
