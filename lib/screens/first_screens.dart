// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formapp/screens/view/view_data_screens.dart';
// import 'package:formapp/screens/view/viewdata_cubit.dart';
//
// import 'home/formdata_cubit.dart';
// import 'home/home_view.dart';
//
// class FirstScreens extends StatelessWidget {
//   const FirstScreens({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => BlocProvider(
//                     create: (context) => FormDataCubit(context: context),
//                     child: const HomeView(),
//                   ),
//                 ));
//               },
//               child: const Text("Insert")),
//           const SizedBox(
//             height: 20.0,
//           ),
//           ElevatedButton(onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => BlocProvider<ViewdataCubit>(
//                   create: (context) => ViewdataCubit(),
//                   child: ViewDataScreens(
//                     index: status,
//                     allUsers: userdata,
//                   )),
//             ));
//           }, child: const Text("View")),
//         ],
//       ),
//     );
//   }
// }
