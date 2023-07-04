abstract class EmployeeEvent {
  const EmployeeEvent();
}

class EmployeeInitialEvent extends EmployeeEvent {}

class EmployeeLoadedEvent extends EmployeeEvent {}

class EmployeePositionEvent extends EmployeeEvent {
  final String position;

  EmployeePositionEvent(this.position);
}

class EmployeeJoinDateEvent extends EmployeeEvent {}

class EmployeeRetirementDateEvent extends EmployeeEvent {}

class EmployeeSaveEvent extends EmployeeEvent {}

class EmployeeCancelEvent extends EmployeeEvent {}

class EmployeePositioinSelectedEvent extends EmployeeEvent {
  final String p;

  EmployeePositioinSelectedEvent({required this.p});
}
