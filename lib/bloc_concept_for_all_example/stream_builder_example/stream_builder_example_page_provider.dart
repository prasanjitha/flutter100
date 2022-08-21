import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stream_builder_example_page_bloc.dart';
import 'stream_builder_example_page_view.dart';

class StreamBuilderExamplePageProvider
    extends BlocProvider<StreamBuilderExamplePageBloc> {
  StreamBuilderExamplePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => StreamBuilderExamplePageBloc(context),
          child: const StreamBuilderExamplePageView(),
        );
}
