import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../hendlers/database_hendlers.dart';
part 'viewdata_state.dart';

class ViewdataCubit extends Cubit<ViewDataState> {
  ViewdataCubit() : super(ViewDataState(allUsers: List.empty()));

  // void viewdata() async{
  //   DatabaseHandler obj = DatabaseHandler();
  //   List userdata = (await obj.viewUsers());
  //   emit(state.copyWith(allUsers: userdata));

  // }



}
