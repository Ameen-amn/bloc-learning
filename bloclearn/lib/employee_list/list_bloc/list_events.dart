import 'package:flutter/material.dart';

@immutable
abstract class EmployeeListEvent {}

class EmployeeListInitialEvent extends EmployeeListEvent{}
class EmployeListLoadingEvent extends EmployeeListEvent{}
class EmployeeListNavigatetoAddScreenEvent extends EmployeeListEvent{}
class EmployeeListNavigateEditScreenEvent extends EmployeeListEvent{}
class EmployeeListItemDeleteEvent extends EmployeeListEvent{}
class EmployeeListItemDeleteUndoEvent extends EmployeeListEvent{}
