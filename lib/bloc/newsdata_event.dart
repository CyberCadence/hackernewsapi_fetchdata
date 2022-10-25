part of 'newsdata_bloc.dart';


abstract class NewsdataEvent {}
class LoadNewsEvent extends NewsdataEvent{}

class LaunchUrlEvent extends NewsdataEvent{}