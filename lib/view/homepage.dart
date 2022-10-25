
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/newsdata_bloc.dart';
import '../model/Newsmodeldata.dart';
 class NewsPageList extends StatelessWidget {
 

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

  Future<void> _launchUrl(String url) async {
final Uri uri=Uri();

  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}

return Scaffold(
  
  body: ListView.builder(
  itemCount: storyList.length,   //https://www.flutter.dev
  itemBuilder: ( (context, index) {
Story story=storyList[index];


  return ListTile(title: Text(story.title),
  subtitle:  GestureDetector(
    child: const Text('click here'),
    onTap: () => launchUrl(Uri.parse( story.url ))),);
})
)
,
);

}

 