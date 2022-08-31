import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../shared/componet/componet.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          builder: (context) => ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (BuildContext context, int index) =>
                buildArticlItem(list[index], context),
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
          ),
          condition: list.length > 0,
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
