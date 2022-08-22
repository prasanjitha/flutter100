import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'teacher_profile_page_bloc.dart';
import 'teacher_profile_page_view.dart';

class TeacherProfilePageProvider extends BlocProvider<TeacherProfilePageBloc> {
  TeacherProfilePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => TeacherProfilePageBloc(context),
          child: const TeacherProfilePageView(),
        );
}
