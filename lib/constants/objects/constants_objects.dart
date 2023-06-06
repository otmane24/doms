import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/screen/appointment/components/fee_information_object.dart';
import 'package:doms/screen/invite_friend/components/friend_object.dart';
import 'package:doms/screen/notification/components/notification_object.dart';

import '../../models/doctor.dart';
import '../../screen/boarding/components/slider_objects.dart';
import '../../screen/home/components/special_doctor_object.dart';

List<SliderObjet> sliderObjetList = [
  SliderObjet(
    image: '$pngsPath/onBorading1.png',
    title: AppLanguage.strings.onBoardingTitle1,
    description: AppLanguage.strings.onBoardingSubTitle1,
    backgroundColor: ColorManager.onBoradingBackground1,
  ),
  SliderObjet(
    image: '$pngsPath/onBorading2.png',
    title: AppLanguage.strings.onBoardingTitle2,
    description: AppLanguage.strings.onBoardingSubTitle2,
    backgroundColor: ColorManager.onBoradingBackground2,
  ),
  SliderObjet(
    image: '$pngsPath/onBorading3.png',
    title: AppLanguage.strings.onBoardingTitle3,
    description: AppLanguage.strings.onBoardingSubTitle3,
    backgroundColor: ColorManager.onBoradingBackground3,
  ),
];

List<SpecialDoctorObject> specialDoctorObjectList = [
  SpecialDoctorObject(
    imagePath: '$svgsPath/stethoscope.svg',
    name: 'Consultation',
    colorBackgound: ColorManager.specialDoctorBackground1,
    colorOpacity: ColorManager.specialDoctorBackground1Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/teeth.svg',
    name: 'Dental',
    colorBackgound: ColorManager.specialDoctorBackground2,
    colorOpacity: ColorManager.specialDoctorBackground2Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/heart.svg',
    name: 'Heart',
    colorBackgound: ColorManager.specialDoctorBackground3,
    colorOpacity: ColorManager.specialDoctorBackground3Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/clinic.svg',
    name: 'Hospitals',
    colorBackgound: ColorManager.specialDoctorBackground4,
    colorOpacity: ColorManager.specialDoctorBackground4Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/medicine.svg',
    name: 'Medicines',
    colorBackgound: ColorManager.specialDoctorBackground5,
    colorOpacity: ColorManager.specialDoctorBackground5Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/care-2.svg',
    name: 'Physician',
    colorBackgound: ColorManager.specialDoctorBackground6,
    colorOpacity: ColorManager.specialDoctorBackground6Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/bandage.svg',
    name: 'Skin',
    colorBackgound: ColorManager.specialDoctorBackground7,
    colorOpacity: ColorManager.specialDoctorBackground7Op,
    nbrDoctor: 265,
  ),
  SpecialDoctorObject(
    imagePath: '$svgsPath/syringe.svg',
    name: 'Surgeon',
    colorBackgound: ColorManager.specialDoctorBackground8,
    colorOpacity: ColorManager.specialDoctorBackground8Op,
    nbrDoctor: 265,
  ),
];

List<Doctor> topDoctorObjectList = [
  Doctor(
      imagePath: '$pngsPath/doctor1.png',
      name: 'Dr. Bellamy N',
      specialty: 'Viralogist',
      vote_count: 13,
      is_online: true),
  Doctor(
      imagePath: '$pngsPath/doctor2.png',
      name: 'Dr. Mensah T',
      specialty: 'Oncologists',
      vote_count: 130,
      is_online: false),
  Doctor(
      imagePath: '$pngsPath/doctor3.png',
      name: 'Dr. Klimisch J',
      specialty: 'Surgeon',
      vote_count: 135,
      is_online: false),
  Doctor(
      imagePath: '$pngsPath/doctor4.png',
      name: 'Dr. Martinez K',
      specialty: 'Pediatrician',
      vote_count: 130,
      is_online: false),
  Doctor(
      imagePath: '$pngsPath/doctor5.png',
      name: 'Dr. Marc M',
      specialty: 'Rheumatologists',
      vote_count: 130,
      is_online: false),
  Doctor(
      imagePath: '$pngsPath/doctor6.png',
      name: 'Dr. O’Boyle J',
      specialty: 'Radiologists',
      vote_count: 135,
      is_online: true),
  Doctor(
      imagePath: '$pngsPath/doctor2.png',
      name: 'Dr. Mensah T',
      specialty: 'Oncologists',
      vote_count: 130,
      is_online: false),
  Doctor(
      imagePath: '$pngsPath/doctor1.png',
      name: 'Dr. Bellamy N',
      specialty: 'Viralogist',
      vote_count: 135,
      is_online: true),
];
List<Doctor> topDoctorObjectList2 = [
  Doctor(
      id: '1',
      imagePath: '$pngsPath/doctors1.png',
      name: 'Dr. Bellamy N',
      specialty: 'Viralogist',
      vote_count: 135,
      is_online: true,
      description: 'Cardio specialistr - Oran Hospital'),
  Doctor(
      id: '2',
      imagePath: '$pngsPath/doctors2.png',
      name: 'Dr. Mensah T',
      specialty: 'Oncologists',
      vote_count: 130,
      is_online: false,
      description: 'Cardio specialistr - Oran Hospital',
      is_like: false),
  Doctor(
      id: '3',
      imagePath: '$pngsPath/doctors3.png',
      name: 'Dr. Klimisch J',
      specialty: 'Surgeon',
      vote_count: 135,
      is_online: false,
      description: 'Cardio specialistr - Oran Hospital'),
  Doctor(
      id: '4',
      imagePath: '$pngsPath/doctors4.png',
      name: 'Dr. Martinez K',
      specialty: 'Pediatrician',
      vote_count: 130,
      is_online: false,
      description: 'Cardio specialistr - Oran Hospital',
      is_like: false),
  Doctor(
      id: '5',
      imagePath: '$pngsPath/doctors5.png',
      name: 'Dr. Marc M',
      specialty: 'Rheumatologists',
      vote_count: 130,
      is_online: false,
      description: 'Cardio specialistr - Oran Hospital',
      is_like: false),
];
List<NotificationObject> notificationObjectList = [
  NotificationObject(
    title: 'Appointement Alarm',
    body:
        'Your appointme,t will be start after 15 minutes n stay with app and take care',
    image: '$pngsPath/card_notification1.png',
    time: DateTime(
      2023,
      06,
      03,
    ),
  ),
  NotificationObject(
    title: 'Appointement confirmed',
    body:
        'Your appointme,t will be start after 15 minutes n stay with app and take care',
    image: '$pngsPath/card_notification2.png',
    time: DateTime(
      2023,
      06,
      03,
    ),
  ),
  NotificationObject(
    title: 'Appointement Alarm',
    body:
        'Your appointme,t will be start after 15 minutes n stay with app and take care',
    image: '$pngsPath/card_notification3.png',
    time: DateTime(
      2023,
      06,
      02,
    ),
  ),
  NotificationObject(
    title: 'Appointement Alarm',
    body:
        'Your appointme,t will be start after 15 minutes n stay with app and take care',
    image: '$pngsPath/card_notification1.png',
    time: DateTime(
      2023,
      03,
      24,
    ),
  ),
  NotificationObject(
    title: 'Appointement Alarm',
    body:
        'Your appointme,t will be start after 15 minutes n stay with app and take care',
    image: '$pngsPath/card_notification1.png',
    time: DateTime(
      2023,
      03,
      24,
    ),
  ),
];

List<FeeInformationObject> feeInfomationObjectList = [
  FeeInformationObject(
    imagePath: '$pngsPath/chat.png',
    title: AppLanguage.strings.messagingFeeInformationText,
    subTitle: AppLanguage.strings.messagingDescriptionFeeInformationText,
    price: '\$5',
  ),
  FeeInformationObject(
    imagePath: '$pngsPath/call.png',
    title: AppLanguage.strings.voiceCallFeeInformationText,
    subTitle: AppLanguage.strings.voiceCallDescriptionFeeInformationText,
    price: '\$10',
  ),
  FeeInformationObject(
    imagePath: '$pngsPath/videocam.png',
    title: AppLanguage.strings.videoCallFeeInformationText,
    subTitle: AppLanguage.strings.videoCallDescriptionFeeInformationText,
    price: '\$20',
  ),
];
List<FriendObject> friendObjectList = [
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend1.png',
      isInvited: false,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend2.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend3.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend4.png',
      isInvited: false,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend5.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend6.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend7.png',
      isInvited: false,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend1.png',
      isInvited: false,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend2.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend3.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend4.png',
      isInvited: false,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend5.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend6.png',
      isInvited: true,
      phone: '+213 5648-756-458'),
  FriendObject(
      name: 'Dr. Eleanor Pena',
      avatar: '$pngsPath/friend7.png',
      isInvited: false,
      phone: '+213 5648-756-458'),
];
