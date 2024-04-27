part of 'homecubit_cubit.dart';

abstract class HomecubitState extends Equatable {
  const HomecubitState();

  @override
  List<Object> get props => [];
}

class HomecubitInitial extends HomecubitState {}

class UploadImage extends HomecubitState {}

class LoadChildData extends HomecubitState {}

class AddChildSuccessState extends HomecubitState {}

class AddChildErrorState extends HomecubitState {
  final String errorMassage;

  const AddChildErrorState({required this.errorMassage});
}

class ChangeSex extends HomecubitState{

}

class AddLoading extends HomecubitState{}

class LoadMomData extends HomecubitState{}
class AddMomSuccessState extends HomecubitState{}
class AddMomErrorState extends HomecubitState{

  final String errorMassage;

  const AddMomErrorState({required this.errorMassage});
}