import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'teacher_home_page_bloc.dart';
import 'teacher_home_page_view.dart';

class TeacherHomePageProvider extends BlocProvider<TeacherHomePageBloc> {
  TeacherHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => TeacherHomePageBloc(context),
          child: const TeacherHomePageView(),
        );
}
