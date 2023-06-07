part of 'formdata_cubit.dart';

class FormDataState extends Equatable {
  final TextEditingController fullName;
  final TextEditingController lastName;
  String? dropBoxSelected;
  String radioSelected;
  List<Hobbys> checkBoxes = [];
  List<Hobbys> selectedHobbys = [];
  int? id;

  FormDataState(
      {required this.fullName,
      required this.lastName,
      required this.dropBoxSelected,
      required this.radioSelected,
      required this.checkBoxes,
      required this.selectedHobbys,
      required this.id});

  @override
  List<Object?> get props =>
      [dropBoxSelected, radioSelected, checkBoxes, id, selectedHobbys];

  FormDataState copyWith({
    TextEditingController? fullName,
    TextEditingController? lastName,
    String? dropBoxSelected,
    String? radioSelected,
    List<Hobbys>? checkBoxes,
    List<Hobbys>? selectedHobbys,
    int? id,
  }) {
    return FormDataState(
      fullName: fullName ?? this.fullName,
      lastName: lastName ?? this.lastName,
      dropBoxSelected: dropBoxSelected ?? this.dropBoxSelected,
      radioSelected: radioSelected ?? this.radioSelected,
      checkBoxes: checkBoxes ?? this.checkBoxes,
      selectedHobbys: selectedHobbys ?? this.selectedHobbys,
      id: id ?? this.id,
    );
  }
}
