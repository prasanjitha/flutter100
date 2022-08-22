import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'subject_details_page_bloc.dart';
import 'subject_details_page_view.dart';

class SubjectDetailsPageProvider extends BlocProvider<SubjectDetailsPageBloc> {
  SubjectDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => SubjectDetailsPageBloc(context),
          child: const SubjectDetailsPageView(),
        );
}
