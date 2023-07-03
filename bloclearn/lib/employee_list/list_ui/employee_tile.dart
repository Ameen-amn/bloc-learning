import 'package:bloclearn/employee_list/list_bloc/list_bloc.dart';
import 'package:bloclearn/employee_list/list_bloc/list_events.dart';
import 'package:flutter/material.dart';

import '../../model/employee_model.dart';

class EmployeeTile extends StatelessWidget {
  final EmployeeListBloc employeeListBloc;
  final Employee employee;
  const EmployeeTile(
      {required this.employeeListBloc, required this.employee, super.key});

  Widget deletBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(employee.id),
      direction: DismissDirection.endToStart,
      background: deletBg(),
      onDismissed: (direction) {
        employeeListBloc.add(EmployeeListItemDeleteEvent(employee: employee));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          action: SnackBarAction(label: 'Undo', onPressed: () {}),
          duration: const Duration(seconds: 2),
          content: const Text('Employee Data has been deleted'),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(employee.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employee.position),
              Text(employee.dateofRetirement == 'No Date'
                  ? 'From ' + employee.dateOfJoining
                  : employee.dateOfJoining + '-' + employee.dateofRetirement)
            ],
          ),

          //contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
