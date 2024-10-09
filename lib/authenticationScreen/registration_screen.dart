import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> 
{
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();
  
  //Apearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //lifr stype
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrendTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livvingSituationTextEditingController = TextEditingController();
  TextEditingController willingToReLocateTextEditingController = TextEditingController();
  TextEditingController RelationshipYouAreLookingForTextEditingController = TextEditingController();

  //Background cultural value
  TextEditingController nationnalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethniccityTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "to get Started Now",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              //Choose image circle avatar
              GestureDetector(
                onTap: ()
                {

                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "images/profile_avatar.jpg"
                  ),
                  backgroundColor: Colors.black,
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              
              //personal info
              const Text(
                "Personal Info",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // Name
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // email
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //password
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //age
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // phone
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: phoneTextEditingController,
                  labelText: "PhoneNo",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // city
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // country
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // profile Heading
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profilr Headinh",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // looking for in a partner
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "Looking for in a partner",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}