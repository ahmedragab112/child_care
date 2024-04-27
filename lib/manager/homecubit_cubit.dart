import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:childcare/function/image_picker.dart';
import 'package:childcare/main.dart';
import 'package:childcare/model/child_data_model.dart';
import 'package:childcare/model/mom_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

part 'homecubit_state.dart';

class HomeCubit extends Cubit<HomecubitState> {
  File? galleryImage;
  File? camerImage;
  bool isMeal = true;
  List<MomDataMode>? moms;
  List<ChildDataModel>? childes;
  HomeCubit() : super(HomecubitInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController momNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController fatherPhoneController = TextEditingController();
  TextEditingController momPhoneController = TextEditingController();
  String date = 'select date';
  TextEditingController id = TextEditingController();
  Future<void> pickCameraImage() async {
    emit(HomecubitInitial());
    camerImage = await PickImage.cameraPick();
    emit(UploadImage());
  }

  Future<void> pickGalleryImage() async {
    emit(HomecubitInitial());
    galleryImage = await PickImage.galleryPick();
    emit(UploadImage());
  }

  void displayChilds() {
    emit(HomecubitInitial());
    var notesBox = Hive.box<ChildDataModel>(childBox);
    childes = notesBox.values.toList();
    emit(LoadChildData());
  }

  void displayMoms() {
    emit(HomecubitInitial());
    var notesBox = Hive.box<MomDataMode>(momBox);
    moms = notesBox.values.toList();
    emit(LoadMomData());
  }

  void addMom() {
    emit(AddLoading());
    try {
      Box notesBox = Hive.box<MomDataMode>(momBox);
      notesBox.add(MomDataMode(
        name: momNameController.text,
        phoneNumber: momPhoneController.text
      ));
      displayMoms();
      emit(AddMomSuccessState());
      log('add ------------------------------------------');
    } catch (e) {
      emit(AddMomErrorState(errorMassage: e.toString()));
    }
  }

  void addchild() async {
    emit(AddLoading());
    try {
      Box notesBox = Hive.box<ChildDataModel>(childBox);
      await notesBox.add(ChildDataModel(
        name: firstNameController.text + lastNameController.text,
        age: ageController.text,
        bloodType: bloodTypeController.text,
        date: date,
        fatherName: fatherNameController.text,
        fatherPhone: fatherPhoneController.text,
        id: id.text,
        imagePath: galleryImage?.path ?? camerImage?.path,
        isMeal: isMeal,
      ));
      displayChilds();
      emit(AddChildSuccessState());
      log('db lenght : ${childes!.length}');
      log('add ------------------------------------------');
    } catch (e) {
      emit(AddChildErrorState(errorMassage: e.toString()));
    }
  }

  changeSex(bool value) {
    emit(HomecubitInitial());
    isMeal = value;
    emit(ChangeSex());
  }
}
