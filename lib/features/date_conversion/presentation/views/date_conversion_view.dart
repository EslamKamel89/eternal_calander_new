import 'package:eternal_calander_new/core/widgets/default_drawer.dart';
import 'package:eternal_calander_new/core/widgets/sizer.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/data_selector.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/table_widget.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/wisdom_coursel.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/widgets/year_search_widget.dart';
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
      resizeToAvoidBottomInset: false,
      drawer: const DefaultDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Sizer(),
            const YearSearchWidget(),
            const TableWidget(),
            const DataSelector(),
            SizedBox(height: 25.h),
            WisdomCarousel(),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
