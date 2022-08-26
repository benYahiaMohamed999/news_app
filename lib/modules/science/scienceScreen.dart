import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../shared/componet/componet.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
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
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
