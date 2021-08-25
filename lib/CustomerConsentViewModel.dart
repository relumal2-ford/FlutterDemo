import 'package:flutter/material.dart';

class CustomerConsentViewModel extends ChangeNotifier {
   String? _groupValue;
   String? get groupValue => _groupValue;

   bool? _networkStatus;
   bool? get networkStatus => _networkStatus;

   void setSelectedButton(String? value)  {
     _groupValue = value;
     _networkStatus = value == "A";
     notifyListeners();
   }
}