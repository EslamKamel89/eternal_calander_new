import 'package:dartz/dartz.dart';
import 'package:eternal_calander_new/core/Errors/failure.dart';
import 'package:eternal_calander_new/features/date_conversion/data/models/selected_date_conversion_model.dart';

abstract class DateConversionRepo {
  Future<Either<Failure, SelectedDateConversionModel>> getDateConversion(DateTime selectedDate);
}
