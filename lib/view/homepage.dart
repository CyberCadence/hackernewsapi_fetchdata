import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/newsdata_bloc.dart';
import '../model/Newsmodeldata.dart';
 class NewsPageList extends StatelessWidget {
  const NewsPageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BlocBuilder<NewsdataBloc, NewsdataState>(
        builder: (context, state) {
          if (state is NewsdataInitial) {
            context.read<NewsdataBloc>().add(LoadNewsEvent());
          }
          if (state is NewsdataLoadingstate) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsdataLoadedstate) {
            return buildNewsData(state. storylist);
          }

 
          if (state is Errorstate) {
            return   Center(
              child: Text(state.message.toString()),
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        },
      )),
    );
  }
}

Widget buildNewsData(List<Story>storyList){


return Scaffold(body: ListView.builder(
  itemCount: storyList.length,
  itemBuilder: ( (context, index) {
Story story=storyList[index];


  return ListTile(title: Text(story.title),);
})),);

}