
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
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
            return buildwidget(state.storylist);
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







Widget buildwidget(List<Story> model) {



  Future<void> _launchUrl(String url) async {
final Uri uri=Uri();

  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}

  
  return Scaffold(
    backgroundColor: Colors.grey.shade400,
    appBar: AppBar(
    backgroundColor: Colors.black54,
    title: const Center(child: Text('Latest Tech News',style: TextStyle(fontWeight: FontWeight.w500),)),),
    body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            separatorBuilder: (context, index) => const SizedBox(height: 5,),
              itemCount: model.length,
              itemBuilder: (context, index) {
                Story modelclass = model[index];
                return GlassmorphicContainer(borderRadius: 1,
                  width:MediaQuery.of(context).size.width ,linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFFffffff).withOpacity(0.1),
        const Color(0xFFFFFFFF).withOpacity(0.05),
      ],
      stops: const [
        0.1,
        1,
      ]), 
                // ignore: prefer_const_constructors
                height: 80,border: 1,  borderGradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
    
      const Color(0xFFffffff).withOpacity(0.5),
      const Color((0xFFFFFFFF)).withOpacity(0.5),
    ],
  ),
                blur:2 ,
                  child: ListTile(shape: RoundedRectangleBorder(side: const BorderSide(width: 1,),
                  borderRadius: BorderRadius.circular(20)),
                    
                    title: Text(modelclass.title  ,style: const TextStyle( fontWeight: FontWeight.w700,
                    fontSize:  15,color: Colors.black),)
                  ,trailing :
                   Container(width: 40,height: 40,
                    decoration:
                    const BoxDecoration(image: DecorationImage(
                      
                      image: AssetImage('assets/images/comments.png')),
                    ), child: Center(child: Text(modelclass.descendants.toString()))),
                
                
                               subtitle: Text(modelclass.  score.toString(),style: const TextStyle( fontSize: 10, 
                               color: Colors.black87,fontWeight: FontWeight.w600),),
                  
                  
                  
                  leading: ElevatedButton(
                    
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black26,
                                    shape:   RoundedRectangleBorder(
                      borderRadius:   BorderRadius.circular(30.0),
                    ),),
                    onPressed: () => _launchUrl( modelclass.url)
                  ,
                               child: const Text('details',style: TextStyle(fontWeight: FontWeight.w300),), )),
                );
              }),
        )),
  );
}





 