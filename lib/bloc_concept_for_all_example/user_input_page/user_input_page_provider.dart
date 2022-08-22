import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_input_page_bloc.dart';
import 'user_input_page_view.dart';

class UserInputPageProvider extends BlocProvider<UserInputPageBloc> {
  UserInputPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => UserInputPageBloc(context),
          child: const UserInputPageView(),
        );
}
