import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_page_bloc.dart';
import 'counter_page_view.dart';

class CounterPageProvider extends BlocProvider<CounterPageBloc> {
  CounterPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CounterPageBloc(context),
          child: const CounterPageView(),
        );
}
