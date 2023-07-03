import '../../model/employee_model.dart';

abstract class EmployeeListState {}

abstract class EmployeeListActionState extends EmployeeListState {}

class EmployeeListInitialState extends EmployeeListState{}
class EmployeeListLoadingState extends EmployeeListState {}

class EmployeeListEmptyState extends EmployeeListState {}

//Data base already have data
class EmployeeListLoadedState extends EmployeeListState {
  final List<Employee> employeList;
  EmployeeListLoadedState({
    required this.employeList,
  });
}

class EmployeeListErrorState extends EmployeeListState {}

//Action
class EmployeeListAddPageActionState extends EmployeeListActionState {}

class EmployeeListEditPageActionState extends EmployeeListActionState {}
