import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/social_cubit.dart';
import 'cubit/social_states.dart';


class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>SocialCubit(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(cubit.appBarTitles[cubit.currentIndex]),
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (int index)
                {
                  cubit.changeBottomNavigationBarItems(index);
                },
                items:cubit.bottomNavigationBarItems,
              )
          );
        },
      ),
    );
}
}