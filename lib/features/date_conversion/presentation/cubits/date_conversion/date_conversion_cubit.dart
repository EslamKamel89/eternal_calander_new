// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eternal_calander_new/core/enums/response_state.dart';
import 'package:eternal_calander_new/features/date_conversion/domain/entities/selected_date_conversion_entity.dart';
import 'package:eternal_calander_new/features/date_conversion/domain/repo/date_conversion_repo.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/data_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_conversion_state.dart';

class DateConversionCubit extends Cubit<DateConversionState> {
  final DateConversionRepo dateConversionRepo;
  DateConversionCubit({
    required this.dateConversionRepo,
  }) : super(DateConversionState());
  void goToYear(String yearStr) {
    int year;
    try {
      year = int.parse(yearStr);
      year = year < state.firstDay.year ? state.firstDay.year : year;
      year = year > state.lastDay.year ? state.lastDay.year : year;
    } catch (e) {
      year = DateTime.now().year;
    }
    emit(DateConversionState(selectedYear: year));
  }

  Future getSelectedDateInfo(DateTime selectedDate) async {
    // final t = prt('getSelectedDateInfo - DateConversionCubit');
    // emit(state.copyWith(getSelectedDateInfoState: ResponseState.loading, selectedGeorgianDate: selectedDate));
    // final result = await dateConversionRepo.getDateConversion(selectedDate);
    // return result.fold(
    //   (Failure failure) {
    //     pr(failure, t);
    //     emit(
    //       state.copyWith(
    //         getSelectedDateInfoState: ResponseState.failure,
    //         selectedOldHijriDate: null,
    //         selectedNewHijriDate: null,
    //         selectedDateConversionEntity: null,
    //       ),
    //     );
    //   },
    //   (SelectedDateConversionEntity model) {
    //     pr(model, t);
    //     emit(
    //       state.copyWith(
    //         selectedGeorgianDate: selectedDate,
    //         selectedDateConversionEntity: model,
    //         getSelectedDateInfoState: ResponseState.success,
    //       ),
    //     );
    //   },
    // );

    emit(state.copyWith(getSelectedDateInfoState: ResponseState.loading, selectedGeorgianDate: selectedDate));
    final entity = SelectedDateConversionEntity(
      selectedGeorgianDate: selectedDate,
      selectedOldHijriDate: 'Jumada I 23, 1446 AH',
      selectedNewHijriDate: 'Jumada I 23, 1446 AH',
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(getSelectedDateInfoState: ResponseState.failure));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        selectedGeorgianDate: selectedDate,
        selectedDateConversionEntity: entity,
        getSelectedDateInfoState: ResponseState.success,
      ),
    );
  }
}
