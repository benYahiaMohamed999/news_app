import 'package:app_1/layout/cubit/cubit.dart';
import 'package:app_1/layout/cubit/state.dart';
import 'package:app_1/modules/search/search.dart';
import 'package:app_1/shared/componet/componet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayoute extends StatelessWidget {
  const NewsLayoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, Search());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await cubit.changeAppMode();
                },
                icon: const Icon(
                  Icons.brightness_4,
                ),
              ),
            ],
          ),
          body: cubit.Screns[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.bottomChangeNavBar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}
