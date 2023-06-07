import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp/screens/view/view_data_screens.dart';

import '../view/viewdata_cubit.dart';
import 'formdata_cubit.dart';

class Hobbys {
  String text;
  bool value;

  Hobbys({required this.value, required this.text});

  Hobbys copyWith({
    String? text,
    bool? value,
  }) {
    return Hobbys(
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }
}

List<Hobbys> hobbyList = [
  Hobbys(value: false, text: "Drawing"),
  Hobbys(value: false, text: "Singing"),
  Hobbys(value: false, text: "Writting"),
  Hobbys(value: false, text: "Reading"),
];

var items = [
  'Gujrat',
  'Dilhi',
  'Maharastra',
  'Panjab',
  'Hariyana',
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: BlocBuilder<FormDataCubit, FormDataState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("FullName"),
                ),
                TextFormField(
                  controller: state.fullName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Full name"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("LastName"),
                ),
                TextFormField(
                  controller: state.lastName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Last name"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Country"),
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'City'),
                  hint: const Text("test"),
                  value: state.id != null &&
                          state.dropBoxSelected != null &&
                          (state.dropBoxSelected?.isNotEmpty ?? false)
                      ? state.dropBoxSelected
                      : items.first,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      BlocProvider.of<FormDataCubit>(context)
                          .handleDropDown(newValue),
                ),
                Row(
                  children: [
                    const Text("Gender:"),
                    const Text("Male"),
                    Radio(
                      value: "M",
                      groupValue: state.radioSelected,
                      onChanged: (valuer) =>
                          BlocProvider.of<FormDataCubit>(context)
                              .handleRadio(valuer),
                    ),
                    const Text("Female"),
                    Radio(
                      value: "F",
                      groupValue: state.radioSelected,
                      onChanged: (valuer) =>
                          BlocProvider.of<FormDataCubit>(context)
                              .handleRadio(valuer),
                    ),
                  ],
                ),
                const Text("Hobby"),
                Expanded(
                  child: ListView.builder(
                    itemCount: hobbyList.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(hobbyList[index].text),
                        value: hobbyList[index].value,
                        onChanged: (newValue) {
                          context
                              .read<FormDataCubit>()
                              .handleCheckBox(index, newValue, hobbyList);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (state.id != null) {
                      context.read<FormDataCubit>().hendleEditButton(context);
                      return;
                    }
                    context.read<FormDataCubit>().handleButton(context);
                  },
                  child: state.id != null
                      ? const Text("Update")
                      : const Text("Submit"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
