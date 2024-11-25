import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/data_selector.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/table_widget.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/wisdom_coursel.dart';
import 'package:eternal_calander_new/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateConversionView extends StatefulWidget {
  const DateConversionView({super.key});
  @override
  State<DateConversionView> createState() => _DateConversionViewState();
}

class _DateConversionViewState extends State<DateConversionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: txt('Islamic Calendar', e: St.bold20)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350.h,
              child: const TableWidget(),
            ),
            const DataSelector(),
            WisdomCarousel(),
          ],
        ),
      ),
    );
  }
}
