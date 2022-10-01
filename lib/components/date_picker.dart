import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart';

// ignore: use_key_in_widget_constructors
class SelectedDatePicker extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SelectedDatePickerState createState() => _SelectedDatePickerState();
}

class _SelectedDatePickerState extends State<SelectedDatePicker> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: SizedBox(
        height: 300,
        width: 500,
        child: SingleChildScrollView(
          child: SfDateRangePicker(
            showTodayButton: false,
            showActionButtons: true,
            confirmText: 'OK',
            selectionColor: kSecondaryColor,
            backgroundColor: kWhiteColor,
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.single,
            onSelectionChanged: selectionChanged,
            onSubmit: (value) {
              Navigator.pop(context, selectedDate);
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDate = DateFormat('dd.MM').format(args.value);

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  Widget getDateRangePicker() {
    return SizedBox(
      height: 250,
      child: Card(
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: selectionChanged,
        ),
      ),
    );
  }
}
