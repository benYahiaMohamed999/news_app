import 'package:app_1/layout/cubit/state.dart';
import 'package:app_1/shared/blocObserver.dart';
import 'package:app_1/shared/componet/componet.dart';
import 'package:app_1/shared/local/remote/dio_helper.dart';
import 'package:app_1/shared/style/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/cubit.dart';
import 'layout/new_layout/newsLayout.dart';
import 'shared/local/cache_Helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark ?? false));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getScience()
              ..getbusiness()
              ..getSports(),),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getbusiness()
            ..initializeTheme(theme: isDark),
        )
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.read<NewsCubit>().isDark ? darkTheme : lightTheme,
            home: NewsLayoute(),
          );
        },
      ),
    );
  }
}
