import 'package:app_1/layout/cubit/cubit.dart';
import 'package:app_1/layout/cubit/state.dart';
import 'package:app_1/shared/componet/componet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsGetBusinessLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var list = NewsCubit.get(context).business!.articles;
          return articalBulder(list!, context);
        }
      },
    );
  }
}
