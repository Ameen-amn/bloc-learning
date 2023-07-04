import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EmployeeRetirementDate extends StatelessWidget {
  const EmployeeRetirementDate({super.key});

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
                              "No Date",
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
                              "To Day",
                              style: TextStyle(color: Color(0xff1DA1F2)),
                            )),
                      ),
                    ),
                  ],
                ),
                TableCalendar(
                    shouldFillViewport: false,
                    rowHeight: 30,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                    focusedDay: DateTime.now(),
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
