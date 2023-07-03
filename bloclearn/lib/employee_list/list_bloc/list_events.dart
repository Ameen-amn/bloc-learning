import 'package:flutter/material.dart';
import '../../model/employee_model.dart';
@immutable
abstract class EmployeeListEvent {}

class EmployeeListInitialEvent extends EmployeeListEvent {}

class EmployeListLoadingEvent extends EmployeeListEvent {}

class EmployeeListNavigatetoAddScreenEvent extends EmployeeListEvent {}

class EmployeeListNavigateEditScreenEvent extends EmployeeListEvent {}

class EmployeeListItemDeleteEvent extends EmployeeListEvent {
  final Employee employee;

  EmployeeListItemDeleteEvent({required this.employee});
}

class EmployeeListItemDeleteUndoEvent extends EmployeeListEvent {}
