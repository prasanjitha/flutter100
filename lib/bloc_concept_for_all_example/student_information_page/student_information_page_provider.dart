import 'package:flutter/foundation.dart';
import 'package:flutter100/models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_information_page_bloc.dart';
import 'student_information_page_view.dart';

class StudentInformationPageProvider
    extends BlocProvider<StudentInformationPageBloc> {
  final String user;
  StudentInformationPageProvider({Key? key, required this.user})
      : super(
          key: key,
          create: (context) => StudentInformationPageBloc(context, user),
          child: const StudentInformationPageView(),
        );
}
