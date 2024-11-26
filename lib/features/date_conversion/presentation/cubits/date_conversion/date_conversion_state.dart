// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'date_conversion_cubit.dart';

class DateConversionState {
  int? selectedYear;
  DateTime firstDay = DateTime.utc(100, 1, 1);
  DateTime lastDay = DateTime.utc(3000, 12, 31);
  DateTime? selectedGeorgianDate;
  // String? selectedOldHijriDate;
  // String? selectedNewHijriDate;
  ResponseState? getSelectedDateInfoState = ResponseState.initial;
  SelectedDateConversionEntity? selectedDateConversionEntity;
  DataProcessingOption selectedOption = DataProcessingOption.after;
  DateConversionState({
    this.selectedYear,
    this.selectedGeorgianDate,
    // this.selectedOldHijriDate,
    // this.selectedNewHijriDate,
    this.selectedDateConversionEntity,
    this.getSelectedDateInfoState,
  });

  DateConversionState copyWith({
    int? selectedYear,
    DateTime? selectedGeorgianDate,
    String? selectedOldHijriDate,
    String? selectedNewHijriDate,
    SelectedDateConversionEntity? selectedDateConversionEntity,
    ResponseState? getSelectedDateInfoState,
  }) {
    return DateConversionState(
      selectedYear: selectedYear ?? this.selectedYear,
      selectedGeorgianDate: selectedGeorgianDate ?? this.selectedGeorgianDate,
      // selectedOldHijriDate: selectedOldHijriDate ?? this.selectedOldHijriDate,
      // selectedNewHijriDate: selectedNewHijriDate ?? this.selectedNewHijriDate,
      selectedDateConversionEntity: selectedDateConversionEntity ?? this.selectedDateConversionEntity,
      getSelectedDateInfoState: getSelectedDateInfoState ?? this.getSelectedDateInfoState,
    );
  }

  @override
  String toString() {
    // return 'DateConversionState(selectedYear: $selectedYear, selectedGeorgianDate: $selectedGeorgianDate, selectedOldHijriDate: $selectedOldHijriDate, selectedNewHijriDate: $selectedNewHijriDate, getSelectedDateInfoState: $getSelectedDateInfoState, selectedDateConversionEntity: $selectedDateConversionEntity, selectedOption: $selectedOption)';
    return 'DateConversionState(selectedYear: $selectedYear, selectedGeorgianDate: $selectedGeorgianDate, getSelectedDateInfoState: $getSelectedDateInfoState, selectedDateConversionEntity: $selectedDateConversionEntity, selectedOption: $selectedOption)';
  }
}
