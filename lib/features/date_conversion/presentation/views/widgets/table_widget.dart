import 'package:eternal_calander_new/core/extensions/context-extensions.dart';
import 'package:eternal_calander_new/core/widgets/sizer.dart';
import 'package:eternal_calander_new/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              _showIslamicInfo(context, selectedDay);
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: context.secondaryHeaderColor,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10.w)),
              headerMargin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(10),
              ),
              formatButtonTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
              ),
              titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showIslamicInfo(BuildContext context, DateTime selectedDay) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            color: context.secondaryHeaderColor.withOpacity(0.4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              txt('Date Information', e: St.bold18, c: context.primaryColor),
              const SizedBox(height: 10.0),
              Column(
                children: [
                  _buildDateRow(image: 'calendar_5.png', title: 'Georgian date', date: '2013-12-14'),
                  _buildDateRow(image: 'calendar_7.png', title: 'Old Hijri date', date: 'Jumada I 23, 1446 AH'),
                  _buildDateRow(image: 'calendar_9.png', title: 'New Hijri date', date: 'Jumada I 23, 1446 AH'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDateRow({required String title, required String date, required image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/images/$image',
            width: 30.w,
            height: 30.w,
          ),
          const Sizer(),
          txt('$title: ', e: St.semi14, c: context.primaryColor),
          txt(date, e: St.reg14),
        ],
      ),
    );
  }
}
