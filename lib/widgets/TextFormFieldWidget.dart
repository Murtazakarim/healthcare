import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../appStyles/appColors.dart';

class TextFieldWidget extends StatefulWidget {
  String hintText;
  Widget? icon;
  String? initialValue;
  var validator;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction textInputAction;
  TextInputType textInputType;
  Function(String) callback;
  TextFieldWidget(
      {Key? key,
        required this.hintText,
        this.textInputType = TextInputType.text,
        this.icon,
        this.initialValue,
        this.inputFormatters,
        this.validator,
        this.textInputAction = TextInputAction.done,
        required this.callback})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppStyles.errorColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppStyles.errorColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          filled: true,
          errorStyle: AppStyles.kTextStyleSize14grayColor.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppStyles.errorColor,
          ),
          hintText: widget.hintText,
          hintTextDirection: TextDirection.ltr,
          hintStyle: AppStyles.kTextStyleSize14grayColor.copyWith(
            color: AppStyles.lightGreyColor,

          ),
          prefixIcon: widget.icon,
          counter: null,
        ),
        keyboardType: widget.textInputType,
        initialValue: widget.initialValue,
        onChanged: (value) {
          setState(() {
            widget.callback(value);
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
      ),
    );
  }
}
