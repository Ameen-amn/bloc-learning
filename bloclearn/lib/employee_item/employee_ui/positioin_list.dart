import 'package:bloclearn/employee_item/bloc2/employee_bloc.dart';
import 'package:bloclearn/employee_item/bloc2/employee_events.dart';
import 'package:flutter/material.dart';

class EmployeePosition extends StatelessWidget {
  final EmployeeBloc employeeBloc;
  final String selectedRole;
  EmployeePosition(
      {super.key, required this.selectedRole, required this.employeeBloc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      leading: const Icon(Icons.cases),
      title: Text(selectedRole == '' ? 'select role' : selectedRole),
      trailing: Icon(Icons.arrow_drop_down),
      onTap: () {
        employeeBloc.add(EmployeePositionEvent('Select Role'));
      },
    );
  }
}

class PositionList extends StatelessWidget {
  final EmployeeBloc employeeBloc;
  PositionList({
    required this.employeeBloc,
    super.key,
  });

  final List<String> positions = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        onClosing: () {},
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: positions
                .map((position) => Column(
                      children: [
                        ListTile(
                          onTap: () {
                            employeeBloc.add(
                                EmployeePositioinSelectedEvent(p: position));
                            Navigator.of(context).pop();
                          },
                          title: Text(
                            position,
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                      ],
                    ))
                .toList(),
          );
        });
  }
}
