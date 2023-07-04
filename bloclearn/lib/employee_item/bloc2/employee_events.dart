abstract class EmployeeEvent {
  const EmployeeEvent();
}


class EmployeeInitialEvent extends EmployeeEvent{}
class EmployeeLoadedEvent extends EmployeeEvent{}
class EmployeePositionEvent extends EmployeeEvent{
}
class EmployeeJoinDateEvent extends EmployeeEvent{}
class EmployeeRetirementDateEvent extends EmployeeEvent{}
class EmployeeSaveEvent extends EmployeeEvent{
}

class EmployeeCancelEvent extends EmployeeEvent{
  
}