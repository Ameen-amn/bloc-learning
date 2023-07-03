abstract class EmployeeEvent {
  const EmployeeEvent();
}


class EmployeeInitialEvent extends EmployeeEvent{}
class EmployeeLoadedEvent extends EmployeeEvent{}
class EmployeeSaveEvent extends EmployeeEvent{

}

class EmployeeCancelEvent extends EmployeeEvent{
  
}