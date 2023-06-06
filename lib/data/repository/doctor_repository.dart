import 'package:dio/dio.dart';
import 'package:doms/models/doctor.dart';

import '../../presentation/laungaes/main.dart';
import '../web_service/doctor_web_service.dart';

class DoctorRepository {
  final DoctorWebService bookingWebService;
  DoctorRepository(this.bookingWebService);

  Future getDoctor() async {
    try {
      final Response getDoctorResponse = await bookingWebService.getDoctor();
      if (getDoctorResponse.statusCode == 200) {
        final doctorData = getDoctorResponse.data;
        List<Doctor> doctorList = [];

        for (var doctor in doctorData) {
          doctorList.add(Doctor.fromJson(doctor));
        }
        return doctorList;
      }

      return AppLanguage.strings.responseErrorText;
    } catch (e) {
      print('error in get doctor repository $e');
      return AppLanguage.strings.responseErrorText;
    }
  }
}
