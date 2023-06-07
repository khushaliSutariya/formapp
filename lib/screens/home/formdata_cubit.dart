import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp/screens/view/view_data_screens.dart';
import 'package:formapp/screens/view/viewdata_cubit.dart';
import '../hendlers/database_hendlers.dart';
import 'home_view.dart';

part 'formdata_state.dart';

class FormDataCubit extends Cubit<FormDataState> {
  final BuildContext? context;
  final int? itemId;

  FormDataCubit({this.context, this.itemId})
      : super(FormDataState(
          fullName: TextEditingController(),
          lastName: TextEditingController(),
          dropBoxSelected: '',
          checkBoxes: const [],
          radioSelected: 'M',
          selectedHobbys: const [],
          id: itemId,
        )) {
    dataView();
  }

  void dataView() async {
    DatabaseHandler obj = DatabaseHandler();
    List userdata = (await obj.viewUsers());
    print("userData :: ${jsonEncode(userdata)}");
  }

  void handleCheckBox(int index, bool? newValue, List list) {
    List<Hobbys>? data = List.from(list)..[index].value = newValue!;
    List<Hobbys>? tempdata =
        data.where((element) => element.value == true).toList();
    emit(
      state.copyWith(
        selectedHobbys: tempdata,
      ),
    );
  }

  void handleRadio(value) => emit(state.copyWith(radioSelected: value));

  void handleDropDown(value) => emit(state.copyWith(dropBoxSelected: value));

  void handleButton(BuildContext context) async {
    var fullName = state.fullName.text;
    var lastName = state.lastName.text;
    var gender = state.radioSelected;
    var country = state.dropBoxSelected;
    var hobbyData = state.selectedHobbys
        .where((element) => element.value == true)
        .map((e) => e.text)
        .toList()
        .join(",");
    DatabaseHandler obj = DatabaseHandler();
    var iId =
        await obj.insertUsers(fullName, lastName, gender, country, hobbyData);
    print("Record insert$iId");
    List userdata = (await obj.viewUsers());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider<ViewdataCubit>(
          create: (context) => ViewdataCubit(),
          child: ViewDataScreens(
            index: iId,
            allUsers: userdata,
          )),
    ));
  }

  void hendleEditButton(BuildContext context) async {
    var fullName = state.fullName.text;
    var lastName = state.lastName.text;
    var gender = state.radioSelected;
    var country = state.dropBoxSelected;
    var hobbyData = state.selectedHobbys
        .where((element) => element.value == true)
        .map((e) => e.text)
        .toList()
        .join(",");
    DatabaseHandler obj = DatabaseHandler();
    var status = await obj.updateUsers(
        fullName, lastName, gender, country, hobbyData, itemId);
    print("Record update$status");
    List userdata = (await obj.viewUsers());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider<ViewdataCubit>(
          create: (context) => ViewdataCubit(),
          child: ViewDataScreens(
            index: status,
            allUsers: userdata,
          )),
    ));
  }

  void getSingleData(int index) async {
    DatabaseHandler obj = DatabaseHandler();
    var data = await obj.getSingleUsers(itemId);
    state.fullName.text = data[index]['fullName'];
    state.lastName.text = data[index]["lastName"];
    state.dropBoxSelected = data[index]["country"];
    String hobby = data[index]["hobbyData"];
    List<String> addHobby = hobby.split(",");
    List<Hobbys> tempList = List.from(state.selectedHobbys);
    for (var newvalue in addHobby) {
      int index = tempList.indexWhere((element) => element.text == newvalue);
      if (index != -1) {
        tempList[index] = tempList[index].copyWith(value: true);
      }
    }
    print("addhobby${addHobby}");
    emit(state.copyWith(
        radioSelected: data[index]['gender'], selectedHobbys: tempList));
  }
}
