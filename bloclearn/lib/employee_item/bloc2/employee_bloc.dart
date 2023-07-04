import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloclearn/employee_item/bloc2/employee_events.dart';
import 'package:bloclearn/employee_item/bloc2/employee_states.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitialState()) {
    on<EmployeeInitialEvent>(employeeInitialEvent);
    on<EmployeePositionEvent>(employeePositionEvent);
    on<EmployeePositioinSelectedEvent>(employeePositioinSelectedEvent);
    on<EmployeeJoinDateEvent>(employeeJoinDateEvent);
    on<EmployeeRetirementDateEvent>(employeeRetirementDateEvent);
    on<EmployeeSaveEvent>(employeeSaveEvent);
    on<EmployeeCancelEvent>(employeeCancelEvent);
  }

  FutureOr<void> employeeInitialEvent(
      EmployeeInitialEvent event, Emitter<EmployeeState> emit) {
    /* emit(EmployeeLoading()); */
    emit(EmployeeInitialState());
  }

  FutureOr<void> employeePositionEvent(
      EmployeePositionEvent event, Emitter<EmployeeState> emit) {
    emit(EmployeePositionState());
  }

  FutureOr<void> employeeJoinDateEvent(
      EmployeeJoinDateEvent event, Emitter<EmployeeState> emit) {
    emit(EmployeeJoinDateState());
  }

  FutureOr<void> employeeRetirementDateEvent(
      EmployeeRetirementDateEvent event, Emitter<EmployeeState> emit) {
    emit(EmployeeRetirementState());
  }

  FutureOr<void> employeeSaveEvent(
      EmployeeSaveEvent event, Emitter<EmployeeState> emit) {}

  FutureOr<void> employeeCancelEvent(
      EmployeeCancelEvent event, Emitter<EmployeeState> emit) {
    emit(EmployeeCancelState());
  }

  FutureOr<void> employeePositioinSelectedEvent(
      EmployeePositioinSelectedEvent event, Emitter<EmployeeState> emit) {
    emit(EmployeePositioinSelectedState(pos: event.p));
  }
}
