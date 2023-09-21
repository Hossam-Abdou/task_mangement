

abstract class TasksState {}

class TasksInitial extends TasksState {}

class AddTasksSuccess extends TasksState {}
class AddTasksError extends TasksState {}
class AddTasksLoading extends TasksState {}


class GetEmployeeLoading extends TasksState {}
class GetEmployeeSucc extends TasksState {}
class GetEmployeeError extends TasksState {}

class RadioValueChanged extends TasksState {}