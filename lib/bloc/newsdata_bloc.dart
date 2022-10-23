import 'package:bloc/bloc.dart';
import 'package:hackerapi_fetchdata/model/Newsmodeldata.dart';
import 'package:hackerapi_fetchdata/service/repository.dart';
import 'package:meta/meta.dart';
 

part 'newsdata_event.dart';
part 'newsdata_state.dart';

class NewsdataBloc extends Bloc<NewsdataEvent, NewsdataState> {
  
  
  final Repository repository;
  
  NewsdataBloc({required this.repository}) : super(NewsdataInitial()) {


    on<NewsdataEvent>((event, emit)async {

      if (event is LoadNewsEvent) {
        emit(NewsdataLoadingstate());

        List<Story> modelclass = await repository. getStories();
        if (modelclass == null) {
          emit(Errorstate(message: 'please check network'));
        } else {
          emit(NewsdataLoadedstate( storylist: modelclass  ));
        }

 
      }
    




    }
  

  );}
  }