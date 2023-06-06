import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doms/data/repository/doctor_repository.dart';
import 'package:doms/data/web_service/doctor_web_service.dart';
import 'package:doms/models/doctor.dart';
import 'package:equatable/equatable.dart';

import '../../../presentation/laungaes/main.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorInitial()) {
    on<GetDoctor>(_getDoctor);
  }
}

FutureOr<void> _getDoctor(GetDoctor event, Emitter<DoctorState> emit) async {
  try {
    emit(DoctorLoading());

    final response = await DoctorRepository(DoctorWebService()).getDoctor();

    if (response is List<Doctor>) {
      emit(DoctorLoaded(doctors: response));
    } else {
      emit(DoctorError(message: AppLanguage.strings.responseErrorText));
    }
  } catch (e) {
    emit(DoctorError(message: e.toString()));
  }
}
