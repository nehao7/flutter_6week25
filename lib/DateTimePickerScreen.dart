import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatetimePickerScreen extends StatefulWidget {
  const DatetimePickerScreen({super.key});

  @override
  State<DatetimePickerScreen> createState() => _DatetimePickerScreenState();
}

class _DatetimePickerScreenState extends State<DatetimePickerScreen> {
  DateTime? selectedDate;
  late String formattedDate;
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2000),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    // formattedDate = selectedDate != null
    //     ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
    //     : "No date selected";
    return  Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        OutlinedButton(onPressed: _selectDate, child: const Text('Select Date')),
        ElevatedButton(onPressed: (){
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
            initialEntryMode: DatePickerEntryMode.calendar,
            initialDatePickerMode: DatePickerMode.day,
            helpText: 'Select Booking Date',
            cancelText: 'No',
            confirmText: 'Yes',
            fieldLabelText: 'Booking Date',
            fieldHintText: 'dd/mm/yyyy',
            errorFormatText: 'Enter a valid date',
            errorInvalidText: 'Date out of range',
            //Block days example
            selectableDayPredicate: (DateTime date) {
              return date.weekday != DateTime.saturday && date.weekday != DateTime.sunday;
            },
            locale: const Locale('hi'),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: Colors.grey[200],
                ),
                child: child!,
              );
            },
          );

        }, child:Text("Date picker customized")),
        ElevatedButton(onPressed: (){
          //Show date of birth (max today)
          showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(), // ⛔ Don't allow future dates
          );
        }, child: Text(""))
      ],
    );
  }
}
