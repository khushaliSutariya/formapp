part of 'viewdata_cubit.dart';


class ViewDataState extends Equatable {
  final List allUsers;
  const ViewDataState({required this.allUsers});
  @override
  List<Object?> get props =>[allUsers];

  ViewDataState copyWith({
    List? allUsers,
  }) {
    return ViewDataState(
      allUsers: allUsers ?? this.allUsers,
    );
  }
}
