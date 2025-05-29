import 'package:liberty_app/constants/utils/exports.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///////////////////////////////////////////////////////////
                    ///*************** HEADER SECTION ******************/
                    ///////////////////////////////////////////////////////////
                    HeaderWidget(
                      headText: 'Create Account',
                      firstBodyText: 'Please fill the details below to create a ',
                      secondBodyText: 'DO-IT ',
                      thirdBodyText: 'account',
                      showBody: true,
                    ),
                    SizedBox(height: 30.sp,),
                
                    ///////////////////////////////////////////////////////////
                    ///*************** TEXT FIELD SECTION ******************/
                    ///////////////////////////////////////////////////////////
                    ///*************** Name Text Field ******************/
                    SizedBox(
                      child: TextFieldBox(
                        controller: nameController,
                        headText: "",
                        showHeader: false,
                        hintText: "Name",
                        labelText: 'Name',
                        keyboardType: TextInputType.text,
                        onChanged: (p0) {
                          String text = nameController.text;
                          // Split the text into words
                          List<String> words = text.split(' ');
                          for (int i = 0; i < words.length; i++) {
                            if (words[i].isNotEmpty) {
                              words[i] = words[i][0].toUpperCase() +
                                  words[i].substring(1).toLowerCase();
                            }
                          }
                          text = words.join(' ');
                          nameController.text = text;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                
                    ///*************** Email Address Text Field ******************/
                    SizedBox(
                      child: TextFieldBox(
                        controller: emailController,
                        headText: "",
                        showHeader: false,
                        hintText: "Enter Email",
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$")
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                
                    ///*************** Phone Number Text Field ******************/
                    SizedBox(
                      child: TextFieldBox(
                        controller: phoneNumberController,
                        headText: "",
                        showHeader: false,
                        maxLength: 11,
                        hintText: "Enter Mobile Number",
                        labelText: 'Mobile Number',
                        keyboardType: TextInputType.number,
                        suffixIcon: SizedBox(
                          width: 60.sp,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/countries/ng.svg',
                                height: 20.sp,
                                width: 30.sp,
                              ),
                
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: DoItColors.grey,
                                size: 40.sp,
                              )
                            ],
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Mobile number is required';
                          }
                          if (value.length != 11) {
                            return 'Enter a valid 11-digit number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                
                    ///*************** Password Text Field ******************/
                    SizedBox(
                      child: TextFieldBox(
                        controller: passwordController,
                        headText: "",
                        showHeader: false,
                        hintText: "Enter Password",
                        labelText: 'Password',
                        keyboardType: TextInputType.text,
                        obscureText: !isPasswordVisible,
                        onChanged: (p){},
                        suffixIcon: Icon(
                          isPasswordVisible 
                            ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                          color: DoItColors.grey,
                        ),
                        onIconPressed: (){
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                
                    DoItText(
                      text: 'Password must be atleast 8 characters',
                      fontSize: 14.sp,
                      textColor: DoItColors.grey,
                    ),
                    SizedBox(height: 70.sp,),
                    
                    ///////////////////////////////////////////////////////////
                    ///*************** BUTTON SECTION SECTION **************/
                    ///////////////////////////////////////////////////////////
                    DoItButton(
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          // Proceed with valid form
                          modalNotification(
                              message: 'Account successfully created',
                              context: context,
                              isError: true,
                            );

                          nextScreenReplace(context, const MainPage(pageIndex: 0,));
                        }
                      },
                      width: double.infinity,
                      text: "Create account",
                    ),
                    SizedBox(height: 15.sp),
                
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: DoItText(
                          text: 'Privacy policy',
                          fontSize: 14.sp,
                          textColor: DoItColors.grey,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}