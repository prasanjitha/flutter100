import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_home_page_bloc.dart';
import 'student_home_page_view.dart';

class StudentPageProvider extends BlocProvider<StudentPageBloc> {
  StudentPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => StudentPageBloc(context),
          child: const StudentPageView(),
        );
}
