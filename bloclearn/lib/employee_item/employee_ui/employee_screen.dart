import 'package:bloclearn/employee_item/bloc2/employee_bloc.dart';
import 'package:bloclearn/employee_item/bloc2/employee_events.dart';
import 'package:bloclearn/employee_item/bloc2/employee_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './joining_date.dart';
import './positioin_list.dart';
import './retirement_date.dart';

class EmployeeItemScreen extends StatefulWidget {
  static const routeName = '/EmployeeItemScreen';

  EmployeeItemScreen({super.key});

  @override
  State<EmployeeItemScreen> createState() => _EmployeeItemScreenState();
}

class _EmployeeItemScreenState extends State<EmployeeItemScreen> {
  final _formKey = GlobalKey<FormState>();
  EmployeeBloc employeeBloc = EmployeeBloc();
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController retirementDate = TextEditingController();

  @override
  void initState() {
    employeeBloc.add(EmployeeInitialEvent());
    super.initState();
  }

  DateTime jDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee Detail"),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.blue),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        print("save new employee");

                        employeeBloc.add(EmployeeSaveEvent());
                      },
                      child: Text("Save")),
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocConsumer<EmployeeBloc, EmployeeState>(
        bloc: employeeBloc,
        listener: (context, state) {
          if (state is EmployeePositionState) {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return PositionList(
                    employeeBloc: employeeBloc,
                  );
                });
          } else if (state is EmployeeJoinDateState) {
            showDialog(
                context: context,
                builder: (context) {
                  return EmployeeJoiningDate(
                    employeeBloc: employeeBloc,
                    selectedJDate: jDate,
                  );
                });
          } else if (state is EmployeeRetirementState) {
            showDialog(
                context: context,
                builder: (context) {
                  return const EmployeeRetirementDate();
                });
          }
        },
        listenWhen: (previous, current) => current is EmployeeActioState,
        buildWhen: (previous, current) => current is! EmployeeActioState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case EmployeeInitialState:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.person_2_outlined,
                                    color: Colors.blue),
                                hintText: "Employee Name",
                                border: OutlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 23),
                            child: EmployeePosition(
                              selectedRole: '',
                              employeeBloc: employeeBloc,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            )),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      employeeBloc.add(EmployeeJoinDateEvent(
                                          selectedDate: jDate));
                                    },
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Color(0xff323238),
                                    ),
                                    label: const Text(
                                      'To Day',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff323238)),
                                    )),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Color(0xff323238),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            )),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      employeeBloc
                                          .add(EmployeeRetirementDateEvent());
                                    },
                                    label: const Text(
                                      'No Date',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff323238)),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            case EmployeePositioinSelectedState:
              final selectedRole = state as EmployeePositioinSelectedState;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.person_2_outlined,
                                    color: Colors.blue),
                                hintText: "Employee Name",
                                border: OutlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 23),
                            child: EmployeePosition(
                              selectedRole: selectedRole.pos,
                              employeeBloc: employeeBloc,
                            ),
                            /* style: const TextButton.s(
                                  contentPadding: EdgeInsets.all(0),
                                  prefixIcon: Icon(Icons.cases_outlined,
                                      color: Colors.blue),
                                  hintText: "Position",
                                  border: OutlineInputBorder()), */
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            )),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      employeeBloc.add(EmployeeJoinDateEvent(
                                          selectedDate: jDate));
                                    },
                                    icon: Icon(
                                      Icons.date_range,
                                      color: Color(0xff323238),
                                    ),
                                    label: Text(
                                      'To Day',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff323238)),
                                    )),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Color(0xff323238),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            )),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      employeeBloc
                                          .add(EmployeeRetirementDateEvent());
                                    },
                                    label: Text(
                                      'No Date',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff323238)),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            case EmployeeJoinDateState:
              final selectedRole = state as EmployeeJoinDateState;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.person_2_outlined,
                                    color: Colors.blue),
                                hintText: "Employee Name",
                                border: OutlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 23),
                            child: EmployeePosition(
                              selectedRole: '',
                              employeeBloc: employeeBloc,
                            ),
                            /* style: const TextButton.s(
                                  contentPadding: EdgeInsets.all(0),
                                  prefixIcon: Icon(Icons.cases_outlined,
                                      color: Colors.blue),
                                  hintText: "Position",
                                  border: OutlineInputBorder()), */
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            )),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      employeeBloc.add(EmployeeJoinDateEvent(
                                          selectedDate: jDate));
                                    },
                                    icon: Icon(
                                      Icons.date_range,
                                      color: Color(0xff323238),
                                    ),
                                    label: Text(
                                      'To Day',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff323238)),
                                    )),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Color(0xff323238),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            )),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      employeeBloc
                                          .add(EmployeeRetirementDateEvent());
                                    },
                                    label: Text(
                                      'No Date',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff323238)),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
