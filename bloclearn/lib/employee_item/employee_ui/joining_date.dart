import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class EmployeeJoiningDate extends StatelessWidget {
  const EmployeeJoiningDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0,
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
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
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            headerPadding: EdgeInsets.symmetric(horizontal: 0),
                          ),
                          focusedDay: DateTime.now(),
                          firstDay: DateTime(2000),
                          lastDay: DateTime(2050)),
                      Spacer(),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
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
                      )
                    ],
                  ),
                ),
              );
  }
}