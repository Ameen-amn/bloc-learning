import 'package:flutter/material.dart';

@immutable
abstract class EmployeeState {
  /* final String name;
  final String position;
  final DateTime dateOfJoining;
  final DateTime? dateofRetirement; */
  const EmployeeState(
      /*  {
    required this.name,
    required this.position,
    required this.dateOfJoining,
    this.dateofRetirement,
  } */
      );
}

class EmployeeLoading extends EmployeeState {
  const EmployeeLoading();
}

class EmployeeError extends EmployeeState {
  final String message;
  const EmployeeError(this.message);
}

class EmployeeAdded extends EmployeeState {
  const EmployeeAdded();
}
