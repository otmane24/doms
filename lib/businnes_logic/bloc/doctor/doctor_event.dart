part of 'doctor_bloc.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();

  @override
  List<Object> get props => [];
}

class GetDoctor extends DoctorEvent {
  const GetDoctor();
  @override
  List<Object> get props => [];
}
