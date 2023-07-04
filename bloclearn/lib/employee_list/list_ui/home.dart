import 'package:bloclearn/employee_item/employee_ui/employee_screen.dart';
import 'package:bloclearn/employee_list/list_bloc/list_bloc.dart';
import 'package:bloclearn/employee_list/list_bloc/list_events.dart';
import 'package:bloclearn/employee_list/list_bloc/list_state.dart';
import 'package:bloclearn/employee_list/list_ui/employee_tile.dart';
import 'package:bloclearn/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/employee_data.dart';

class EmployeeListScreen extends StatefulWidget {
  /* static const routeName = '/'; */
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> allList = [];
  @override
  void initState() {
    employeeListBloc.add(EmployeeListInitialEvent());
    allList = EmployeeData.employeeData
        .map((e) => Employee(
              id: e['id'],
              name: e['name'],
              position: e['position'],
              dateOfJoining: e['jdate'],
              dateofRetirement: e['rdate'],
            ))
        .toList();
    listCreating();

    super.initState();
  }

  final List<Employee> _current = [];
  final List<Employee> _previous = [];
  void listCreating() {
    allList.forEach((element) {
      if (element.dateofRetirement == 'No Date') {
        _current.add(element);
      } else {
        _previous.add(element);
      }
    });
  }

  final EmployeeListBloc employeeListBloc = EmployeeListBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeListBloc, EmployeeListState>(
      bloc: employeeListBloc,
      buildWhen: (previous, current) => current is! EmployeeListActionState,
      listenWhen: (previous, current) => current is EmployeeListActionState,
      listener: (context, state) {
        // TODO: implement listener
        if (state is EmployeeListAddPageActionState) {
          print("changge rotute");
          Navigator.of(context).pushNamed(EmployeeItemScreen.routeName);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case EmployeeListLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case EmployeeListEmptyState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("EmployeeList"),
              ),
              floatingActionButton: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  employeeListBloc.add(EmployeeListNavigatetoAddScreenEvent());
                  /*  context
                  .read<EmployeeListBloc>()
                  .add(EmployeeListNavigatetoAddScreenEvent());  */ //Change here
                },
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/empty.png'),
                    const Text("No employee records found")
                  ],
                ),
              ),
            );
          case EmployeeListLoadedState:
            final successState = state as EmployeeListLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("EmployeeList"),
              ),
              floatingActionButton: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  employeeListBloc.add(EmployeeListNavigatetoAddScreenEvent());
                  /*  context
                  .read<EmployeeListBloc>()
                  .add(EmployeeListNavigatetoAddScreenEvent());  */ //Change here
                },
              ),
              body: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .07,
                      color: Color(0xffE5E5E5),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Text(
                          "Swipe left to delete",
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: successState.employeList.any(
                            (element) => element.dateofRetirement == "No Date"),
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                color: const Color(0xffE5E5E5),
                                child: const Text(
                                  "Current Employees",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff1DA1F2)),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: _current.length,
                                    itemBuilder: (context, i) {
                                      /* if (successState
                                            .employeList[i].dateofRetirement ==
                                        'No Date') { */
                                      return EmployeeTile(
                                          employeeListBloc: employeeListBloc,
                                          employee: _current[i]);
                                      // }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: successState.employeList.any(
                            (element) => element.dateofRetirement != "No Date"),
                        child: SizedBox(
                          height: 400,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                color: const Color(0xffE5E5E5),
                                child: const Text(
                                  "Previous Employees",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff1DA1F2)),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: _previous.length,
                                    itemBuilder: (context, i) {
                                      return EmployeeTile(
                                          employeeListBloc: employeeListBloc,
                                          employee: _previous[i]);
                                      // }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          case EmployeeListErrorState:
            return const Scaffold(
              body: Text("Employee list error"),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
