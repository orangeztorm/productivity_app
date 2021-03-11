// Manages data for our for our work schedule

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:productivity_app/models/workModel.dart';

class WorkListModel extends ChangeNotifier{

  // Name of our hive box

  String _boxName = "workBox";

  List<WorkModel> _works = [];

  // Holds our active work
  WorkModel _activeWork;

  // Get work to be done
  // Fets all work from the Hive Box
  void getWorks() async {
    var box = await Hive.openBox<WorkModel>(_boxName);

    // Update our provider state data with a hive read, and refresh the ui
    _works = box.values.toList();
    notifyListeners();
  }

  /// Get work to be done
  /// Retrieve specfic work from the hive box
  WorkModel getWork(index) {
    return _works[index];
  }

  /// Work count
  /// Returns the length of the work array
  int get workCounts {
    return _works.length;
  }

  /// Add Work
  /// - Saves work data to Hive box persistent storage
  /// - Updates our List with the hive data by read
  /// - Notifies listeners to update the UI, which will be a consumer of the _work List
  void addWork(WorkModel workModel) async{
    var box = await Hive.openBox(_boxName);

    // Add a work to our box
    await box.add(workModel);

    // Update our provider state data with a hive read, and refresh the ui
    _works = box.values.toList();
    notifyListeners();
  }

  /// Delete all work
  void deleteAllContact() async {
    var box = await Hive.openBox<WorkModel>(_boxName);

    await box.clear();

    // Update _works List with all box values
    _works = box.values.toList();

    print("Deleted all scheduled Work");

    // Update UI
    notifyListeners();
  }


  /// Delete work
  void deleteContact(index) async {
    var box = await Hive.openBox<WorkModel>(_boxName);

    await box.deleteAt(index);

    // Update _works List with all box values
    _works = box.values.toList();

    print("Deleted Work");

    // Update UI
    notifyListeners();
  }

  /// Edit Contact
  /// Overwrites our existing contact based on key with a brand new updated Contact object
  // void editContact({WorkModel workMoedel, int contactKey}) async {
  //   var box = await Hive.openBox<WorkModel>(_boxName);

    
  //   // Update UI
  //   notifyListeners();
  // }

}