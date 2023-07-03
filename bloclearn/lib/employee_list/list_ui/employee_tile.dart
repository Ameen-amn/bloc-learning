import 'package:flutter/material.dart';

import '../../model/employee_model.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;
  const EmployeeTile({required this.employee, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      ),
    );
  }
}
