import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackerapi_fetchdata/service/repository.dart';
import 'package:hackerapi_fetchdata/view/homepage.dart';

import 'bloc/newsdata_bloc.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        home: BlocProvider<NewsdataBloc>(
      create: (context) => NewsdataBloc( repository: Repository()),
      child:   const NewsPageList(),
    ));
  }
}
