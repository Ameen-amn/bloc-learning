import 'package:bloclearn/employee_item/bloc2/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EmployeeJoiningDate extends StatefulWidget {
  final DateTime selectedJDate;
  final EmployeeBloc employeeBloc;
  const EmployeeJoiningDate(
      {required this.employeeBloc, required this.selectedJDate, super.key});

  @override
  State<EmployeeJoiningDate> createState() => _EmployeeJoiningDateState();
}

class _EmployeeJoiningDateState extends State<EmployeeJoiningDate> {
  DateTime jdate = DateTime.now();
  void _onDaySelected(DateTime currentDay, DateTime focuesDay) {
    setState(() {
      jdate = focuesDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //height: MediaQuery.of(context).size.height * 0.65,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color(0xffEDF8FF)),
                            onPressed: () {},
                            child: Text(
                              "Today",
                              style: TextStyle(color: Color(0xff1DA1F2)),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color(0xffEDF8FF)),
                            onPressed: () {},
                            child: Text(
                              "Tuesday",
                              style: TextStyle(color: Color(0xff1DA1F2)),
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color(0xffEDF8FF)),
                            onPressed: () {},
                            child: Text(
                              "Next Tuesday",
                              style: TextStyle(color: Color(0xff1DA1F2)),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color(0xffEDF8FF)),
                            onPressed: () {},
                            child: Text(
                              "After 1 Week",
                              style: TextStyle(color: Color(0xff1DA1F2)),
                            )),
                      ),
                    ),
                  ],
                ),
                TableCalendar(
                    shouldFillViewport: false,
                    rowHeight: 30,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                    focusedDay: widget.selectedJDate,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, widget.selectedJDate),
                    onDaySelected: _onDaySelected,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2050)),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  color: Color(0xff1DA1F2),
                ),
                Text("data"),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffEDF8FF)),
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Color(0xff1DA1F2)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffEDF8FF)),
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(color: Color(0xff1DA1F2)),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
