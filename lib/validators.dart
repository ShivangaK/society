import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

String? charactersOnly(dynamic value) {
  if (value == null ||
      value.isEmpty ||
      RegExp(r'^[a-zA-Z\s.]+$').hasMatch(value)) {
    return null; // Valid
  }
  return 'Only characters are allowed.';
}

FormFieldValidator<String> nameValidator() {
  return FormBuilderValidators.compose(
    [
      FormBuilderValidators.required(),
      charactersOnly,
    ],
  );
}

FormFieldValidator<String> numberValidator() {
  return FormBuilderValidators.compose(
    [
      FormBuilderValidators.required(),
      FormBuilderValidators.numeric(),
      FormBuilderValidators.integer()
    ],
  );
}

String? validateAadhar(dynamic value) {
  String pattern = r'^[2-9]{1}[0-9]{11}$'; // Aadhar number pattern
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'Please enter Aadhar number';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid Aadhar number';
  }
  return null; // Valid
}

String? validatePhoneNumber(dynamic value) {
  String pattern = r'^[4-9]{1}[0-9]{9}$'; // Phone number pattern
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null; // Valid
}
