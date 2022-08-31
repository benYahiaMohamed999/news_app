import 'package:app_1/layout/cubit/cubit.dart';
import 'package:app_1/layout/cubit/state.dart';
import 'package:app_1/models/newsModel.dart';
import 'package:app_1/shared/componet/componet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key});
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search must be not Empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child:articalBulder(
                 list,context,
                 ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
