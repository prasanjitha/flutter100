import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'future_api_example_page_bloc.dart';
import 'future_api_example_page_view.dart';

class FutureApiExamplePageProvider
    extends BlocProvider<FutureApiExamplePageBloc> {
  FutureApiExamplePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => FutureApiExamplePageBloc(context),
          child: const FutureApiExamplePageView(),
        );
}
