part of 'newsdata_bloc.dart';

 
abstract class NewsdataState {}

class NewsdataInitial extends NewsdataState {}


class NewsdataLoadingstate extends NewsdataState {}

class NewsdataLoadedstate extends NewsdataState {
  List <Story> storylist;

   NewsdataLoadedstate({required this.storylist});
}



class Errorstate extends NewsdataState {
  final String message;
Errorstate({required this.message});
  
}