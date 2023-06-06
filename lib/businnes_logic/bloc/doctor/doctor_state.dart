part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  List<Doctor> doctors;
  DoctorLoaded({required this.doctors});
}

class DoctorError extends DoctorState {
  final String message;

  const DoctorError({required this.message});
}
