import 'package:centredeformation/screens/layout/news_app/cubit/cubit.dart';
import 'package:centredeformation/screens/layout/news_app/cubit/states.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:centre_for_training/layout/news_app/cubit/cubit.dart';
// import 'package:centre_for_training/layout/news_app/cubit/states.dart';
// import 'package:centre_for_training/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return articleBuilder(list, context);
      },
    );
  }
}
