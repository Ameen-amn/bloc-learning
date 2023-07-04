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
abstract class EmployeeActioState extends EmployeeState{}
class EmployeeLoading extends EmployeeState {
  
}
class EmployeeInitialState extends EmployeeState{}
class EmployeeLoadedState extends EmployeeState{}
class EmployeePositionState extends EmployeeActioState{}
class EmployeeJoinDateState extends EmployeeActioState{}
class EmployeeRetirementState extends EmployeeActioState{}
class EmployeeErrorState extends EmployeeState {
  final String message;
  const EmployeeErrorState(this.message);
}

class EmployeeAddedState extends EmployeeState {
  const EmployeeAddedState();
}
class EmployeeCancelState extends EmployeeState{}