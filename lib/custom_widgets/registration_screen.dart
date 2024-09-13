import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:society/validators.dart';

import '../app/modules/home/controllers/home_controller.dart';
import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentStep = 0;
  final HomeController homeController = Get.put(HomeController());

  var lastDate18Years;

  @override
  Widget build(BuildContext context) {
    var mobilePlatform = GetPlatform.isMobile;

    DateTime today = DateTime.now();
    lastDate18Years = DateTime(today.year - 18, today.month, today.day);

    return Scaffold(
        backgroundColor: myDefaultBackgroundColor,
        appBar: mobilePlatform ? mobileAppBar : myAppBarDesktop,
        // appBar: myAppBar2,
        drawer: mobilePlatform ? mobileDrawer(context) : null,
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.green)),
          child: Stepper(
            type:
                mobilePlatform ? StepperType.vertical : StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () async {
              switch (currentStep) {
                case 0:
                  if (homeController.formKey.currentState!.saveAndValidate()) {
                    setState(() => currentStep += 1);
                  }

                  break;

                case 1:
                  if (homeController.formKeyContactDetails.currentState!
                      .saveAndValidate()) {
                    setState(() => currentStep += 1);
                  }

                  break;
              }

              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                //print('completed ');

                if (homeController.formKeyNomineeDetails.currentState!
                    .saveAndValidate()) {
                  //print('Inside if after next');

                  final formData = homeController.formKey.currentState!.value;
                  final contactDetails =
                      homeController.formKeyContactDetails.currentState!.value;

                  final nomineeDetails =
                      homeController.formKeyNomineeDetails.currentState!.value;

                  // Details of all 3 Steps merged together
                  final Map<String, dynamic> mergedDetails = {
                    ...formData,
                    ...contactDetails,
                    ...nomineeDetails
                  };

                  //print(mergedDetails);

                  if (homeController.formKey.currentState!
                          .fields['MEMBERSHIPID']!.value ==
                      null) {
                    //print('Inside Save to API');
                    // await homeController.sendToAPIForSave(formData);
                  } else {
                    //print('Inside Edit to API');
                    //print(mergedDetails);
                    await homeController.memberDetailsEdit(mergedDetails);
                  }
                }
                //send data to server
              }

              //  else {
              //   //print('Inside Else');
              //   setState(() => currentStep += 1);
              // }
            },
            onStepTapped: (value) => setState(() => currentStep = value),
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
            controlsBuilder: (context, controlsDetails) {
              final isLastStep = currentStep == getSteps().length - 1;
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: controlsDetails.onStepContinue,
                        icon: const Icon(Icons.navigate_next_rounded),
                        label: Text(isLastStep ? 'Confirm' : 'Next'),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: controlsDetails.onStepCancel,
                          icon: const Icon(Icons.arrow_back_sharp),
                          label: const Text('Back'),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  List<Step> getSteps() {
    var profilePic = Expanded(
      child: Column(
        children: [
          Obx(
            () {
              final imageBytes = homeController.imageBytes.value;
              //print("Inside view pic ${imageBytes?.length}");

              return imageBytes == null
                  // () => homeController.imageUrlPic.value == null
                  ? const Column(
                      children: [
                        Text(
                          'Select Image from Camera/gallery',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('web/gruhaslogo.png'),
                          ),
                          // child: CircularAvatar('web/gruhaslogo.jpeg'),
                        ),
                      ],
                    )
                  : CircleAvatar(
                      radius: GetPlatform.isMobile ? 70.0 : 120.0,
                      child: Image.memory(
                        homeController.imageBytes.value!,
                        // fit: BoxFit.contain,
                      ),
                      // child: Image.network(
                      // homeController.imageUrlPic.value),
                      // child: FormBuilderImagePicker(
                      //   name: 'profileImage1',
                      //   maxImages: 1,
                      // ),
                      // backgroundImage: NetworkImage(
                      //     homeController.imageBytes.value),
                    );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetPlatform.isMobile
                  ? Container()
                  : TextButton.icon(
                      onPressed: null,
                      //Uncomment to work on Desktop
                      // () {
                      //   if (kIsWeb && kDebugMode) {
                      //     homeController.pickImage();
                      //   }
                      // },
                      icon: const Icon(
                        Icons.image_search_rounded,
                        size: 26,
                        color: Colors.black,
                      ),
                      label: const Text('Click to Change Photo')),
              // IconButton(
              //   onPressed: //null,
              //       //  homeController.picImage(),
              //       () {
              //     // final pickedFile = await ImagePicker()
              //     //     .pickImage(source: ImageSource.gallery);
              //     // if (pickedFile == null) return;
              //     // homeController.selectedImagePath.value =
              //     //     pickedFile.path;
              //     homeController.pickImage();
              //   },
              //   icon: Icon(
              //     Icons.image_search_rounded,
              //     size: 26,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
    var personalDetails = Expanded(
      flex: GetPlatform.isMobile ? 1 : 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FormBuilderTextField(
            name: 'AADHAR_NO',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            // readOnly: true,
            maxLength: 12,
            decoration: const InputDecoration(labelText: 'Aadhar No.'),
            controller: homeController.AADHAR_NOController,

            validator: validateAadhar,
          ),
          FormBuilderTextField(
            controller: homeController.MEMBERSHIPIDController,
            name: 'MEMBERSHIPID',
            readOnly: true,
            decoration: const InputDecoration(labelText: 'MembershipID'),
            // validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            controller: homeController.NAMEController,
            name: 'NAME',
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Name'),
            maxLength: 40,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: nameValidator(),
          ),
          FormBuilderDateTimePicker(
            controller: homeController.dobController,
            name: 'DOB',
            format: DateFormat.yMd(),
            // format: DateFormat("M/d/yyyy"),
            // initialValue: DateTime.now(),
            // initialValue: DateFormat("M/d/yyyy")
            // .parse(homeController.dobController.text),
            //  firstDate: DateTime.now(1950),
            // lastDate: lastDate18Years,
            inputType: InputType.date,
            valueTransformer: (value) => value!.toIso8601String(),
            decoration: const InputDecoration(
              labelText: 'Date of Birth (mm/dd/yyyy)',
              suffixIcon: Icon(Icons.calendar_month_rounded),
            ),
          ),
          FormBuilderTextField(
            controller: homeController.FATHER_HUSBAND_NAMEController,
            keyboardType: TextInputType.text,
            maxLength: 40,
            name: 'FATHER_HUSBAND_NAME',
            decoration: const InputDecoration(labelText: 'Father/Husband Name'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: nameValidator(),
          ),
          FormBuilderTextField(
            controller: homeController.BIRTH_PLACEController,
            keyboardType: TextInputType.text,
            maxLength: 40,
            name: 'BIRTH_PLACE',
            decoration: const InputDecoration(labelText: 'BirthPlace'),
            validator: nameValidator(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Personal Details'),
        content: FormBuilder(
          // key: _formKey,
          key: homeController.formKey,
          skipDisabled: true,
          child: Row(
            children: [
              personalDetails,
              profilePic,
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('Contact Details'),
        content: FormBuilder(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          // key: _formKey,
          key: homeController.formKeyContactDetails,
          skipDisabled: true,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'MOBILENO',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                maxLength: 10,
                controller: homeController.MOBILENOController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (homeController.MOBILENOController.text.isNotEmpty) {
                        homeController.fetchMemberDetails(
                          int.parse(homeController.MOBILENOController.text),
                        );
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
                validator: validatePhoneNumber,
              ),
              FormBuilderTextField(
                controller: homeController.ALTERNATE_MOBILE_NOController,
                name: 'ALTERNATE_MOBILE_NO',
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Alternate Mobile Number',
                ),
                validator: validatePhoneNumber,
              ),
              FormBuilderTextField(
                controller: homeController.EMAILController,
                name: 'EMAIL',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email.'),
                validator: FormBuilderValidators.email(),
              ),
              FormBuilderTextField(
                controller: homeController.ALTERNATE_EMAILController,
                name: 'ALTERNATE_EMAIL',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(labelText: 'Alternate Email.'),
                validator: FormBuilderValidators.email(),
              ),
              FormBuilderTextField(
                controller: homeController.PERMANENT_ADDRESSController,
                name: 'PERMANENT_ADDRESS',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.streetAddress,
                decoration:
                    const InputDecoration(labelText: 'Permanent Address'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                controller: homeController.CORRESPONDANCE_ADDRESSController,
                name: 'CORRESPONDANCE_ADDRESS',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.streetAddress,
                decoration:
                    const InputDecoration(labelText: 'Correspondence Address'),
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        title: const Text('Nominee Details'),
        content: FormBuilder(
          // key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: homeController.formKeyNomineeDetails,
          skipDisabled: true,
          child: Column(
            children: [
              FormBuilderTextField(
                controller: homeController.NOMINEE_NAMEController,
                name: 'NOMINEE_NAME',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Nominee Name',
                ),
                validator: nameValidator(),
              ),
              FormBuilderTextField(
                controller: homeController.NOMINEE_MOBILEController,
                name: 'NOMINEE_MOBILE',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                ),
                validator: validatePhoneNumber,
              ),
              FormBuilderTextField(
                controller: homeController.NOMINEE_AGEController,
                name: 'NOMINEE_AGE',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nominee Age.',
                ),
                validator: numberValidator(),
              ),
              FormBuilderTextField(
                controller: homeController.NOMINEE_RELATIONSHIPController,
                name: 'NOMINEE_RELATIONSHIP',
                decoration:
                    const InputDecoration(labelText: 'Nominee Relationship.'),
                validator: FormBuilderValidators.required(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              FormBuilderTextField(
                controller: homeController.NOMINEE_ADDRESSController,
                name: 'NOMINEE_ADDRESS',
                decoration:
                    const InputDecoration(labelText: 'Nominee Address.'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
