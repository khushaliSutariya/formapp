import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp/screens/details/detail_Screens.dart';
import 'package:formapp/screens/home/home_view.dart';
import 'package:formapp/screens/view/viewdata_cubit.dart';
import '../home/formdata_cubit.dart';

class ViewDataScreens extends StatelessWidget {
  int index;
  List allUsers;

  ViewDataScreens({Key? key, required this.index, required this.allUsers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Data"),
        ),
        body: BlocBuilder<ViewdataCubit, ViewDataState>(
          builder: (context, state) {
            return (allUsers.isEmpty)
                ? const Text("No Data Found")
                : ListView.builder(
                    itemCount: allUsers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.deepOrange.shade200,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider<FormDataCubit>(
                                  create: (context) => FormDataCubit(
                                      context: context,
                                      itemId: allUsers[index]["pid"]),
                                  child: DetailScreens(
                                    fullName: allUsers[index]["fullName"],
                                    lastName: allUsers[index]["lastName"],
                                    country: allUsers[index]["country"],
                                    gender: allUsers[index]["gender"],
                                    hobby: allUsers[index]["hobbyData"],
                                  )),
                            ));
                            print("name:${allUsers[index]["fullName"]}");
                          },
                          child: Card(
                            elevation: 5.0,
                            color: Colors.amber.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Full Name: ${allUsers[index]["fullName"]}"),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlocProvider(
                                                    create: (context) =>
                                                        FormDataCubit(
                                                            itemId:
                                                                allUsers[index]
                                                                    ["pid"])
                                                          ..getSingleData(
                                                              0),
                                                    child: const HomeView(),
                                                  ),
                                                ));
                                          },
                                          icon: const Icon(Icons.edit)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
