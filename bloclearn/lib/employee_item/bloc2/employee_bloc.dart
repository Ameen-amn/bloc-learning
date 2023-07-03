import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloclearn/employee_item/bloc2/employee_events.dart';
import 'package:bloclearn/employee_item/bloc2/employee_states.dart';
import '../bloc2/employee_states.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitialState()) {
    on<EmployeeInitialEvent>(employeeInitialEvent);
    on<EmployeeSaveEvent>(employeeSaveEvent);
  }

  FutureOr<void> employeeInitialEvent(
      EmployeeInitialEvent event, Emitter<EmployeeState> emit) {
    emit(EmployeeLoading());
    emit(EmployeeInitialState());
  }

  FutureOr<void> employeeSaveEvent(
      EmployeeSaveEvent event, Emitter<EmployeeState> emit) {}
}
