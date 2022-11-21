
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';




class DropDownForm extends StatefulWidget {
  String hintText;
  String? validatorText;
  List<String> dropdownText;
  ValueChanged<String?> onChanged;
  double? width;
  double? height;
  Offset offset;
  String? value;

  DropDownForm(
      {Key? key,
        required this.hintText,
        required this.dropdownText,
        this.validatorText,
        required this.onChanged,
        this.width= 200,
        this.height=100,
        this.offset=const Offset(0,0),
        this.value

      })
      : super(key: key);

  @override
  State<DropDownForm> createState() => _DropDownFormState();
}

class _DropDownFormState extends State<DropDownForm> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      focusColor: Colors.white,
      value: widget.value,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 1.0,

          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 1.0,
          ),
        ),
      ),
      offset:widget.offset ,
      dropdownWidth: widget.width,
      dropdownMaxHeight: widget.height,
      isExpanded: true,
      hint: Text(
        widget.hintText,
        style: TextStyle(fontSize: 14),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      items: widget.dropdownText
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
              fontSize: 14,
              overflow: TextOverflow.ellipsis
          ),
        ),
      ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return widget.validatorText;
        }
      },
      onChanged: widget.onChanged,
    );
  }
}