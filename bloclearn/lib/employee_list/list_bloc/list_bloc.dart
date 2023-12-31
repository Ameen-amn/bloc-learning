import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloclearn/model/employee_model.dart';

import './list_events.dart';
import './list_state.dart';
import '../../data/employee_data.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeListBloc() : super(EmployeeListInitialState()) {
    on<EmployeeListInitialEvent>(employeeListInitialEvent);
    on<EmployeeListNavigatetoAddScreenEvent>(
      employeeListItemAddEvent,
    );
    on<EmployeeListNavigateEditScreenEvent>(
      employeeListNavigateEditScreenEvent,
    );
    on<EmployeeListItemDeleteEvent>(employeeListItemDeleteEvent);
  }

  FutureOr<void> employeeListInitialEvent(
      EmployeeListInitialEvent event, Emitter<EmployeeListState> emit) async {
    emit(EmployeeListLoadingState());
    await Future.delayed(const Duration(
      seconds: 2,
    ));
    emit(EmployeeData.employeeData.isNotEmpty
        ? EmployeeListLoadedState(
            employeList: EmployeeData.employeeData
                .map((e) => Employee(
                      id: e['id'],
                      name: e['name'],
                      position: e['position'],
                      dateOfJoining: e['jdate'],
                      dateofRetirement: e['rdate'],
                    ))
                .toList())
        : EmployeeListEmptyState());
  }

  FutureOr<void> employeeListItemAddEvent(
      EmployeeListNavigatetoAddScreenEvent event,
      Emitter<EmployeeListState> emit) {
    print("trying to add new employee");
    emit(EmployeeListAddPageActionState());
  }

  FutureOr<void> employeeListNavigateEditScreenEvent(
    EmployeeListNavigateEditScreenEvent event,
    Emitter<EmployeeListState> emit,
  ) {
    emit(EmployeeListEditPageActionState());
  }

  FutureOr<void> employeeListItemDeleteEvent(
    EmployeeListItemDeleteEvent event,
    Emitter<EmployeeListState> emit,
  ) {
    //remove the product from  list;
    //
    emit(EmployeeListLoadedState(employeList: []));
  }
}
