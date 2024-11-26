// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eternal_calander_new/features/date_conversion/domain/entities/selected_date_conversion_entity.dart';

class SelectedDateConversionModel extends SelectedDateConversionEntity {
  SelectedDateConversionModel({
    super.selectedGeorgianDate,
    super.selectedOldHijriDate,
    super.selectedNewHijriDate,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'selectedGeorgianDate': selectedGeorgianDate?.millisecondsSinceEpoch,
      'selectedOldHijriDate': selectedOldHijriDate,
      'selectedNewHijriDate': selectedNewHijriDate,
    };
  }

  factory SelectedDateConversionModel.fromJson(Map<String, dynamic> json) {
    return SelectedDateConversionModel(
      selectedGeorgianDate: json['selectedGeorgianDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['selectedGeorgianDate'] as int)
          : null,
      selectedOldHijriDate: json['selectedOldHijriDate'] != null ? json['selectedOldHijriDate'] as String : null,
      selectedNewHijriDate: json['selectedNewHijriDate'] != null ? json['selectedNewHijriDate'] as String : null,
    );
  }
}
