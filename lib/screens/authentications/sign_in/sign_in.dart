import 'package:liberty_app/constants/utils/exports.dart';
import 'package:liberty_app/screens/nav/main_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isAllFieldFilled = false;
  bool isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isAllFieldFilled = emailController.text.isNotEmpty && 
        passwordController.text.isNotEmpty;
    });
  }


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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///////////////////////////////////////////////////////////
                  ///*************** HEADER SECTION ******************/
                  ///////////////////////////////////////////////////////////
                  HeaderWidget(
                    headText: '',
                    firstBodyText: ' ',
                    secondBodyText: ' ',
                    thirdBodyText: '',
                  ),
                  SizedBox(height: 30.sp,),

                  Center(
                    child: Image.asset(
                      DoItAssetsPath.doItImage,
                      height: 50.sp,
                      width: 150.sp,
                    ),
                  ),
                  SizedBox(height: 15.sp,),

                  Center(
                    child: DoItText(
                      text: 'Welcome Back !',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      textColor: DoItColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),

                  ///////////////////////////////////////////////////////////
                  ///*************** TEXT FIELD SECTION ******************/
                  ///////////////////////////////////////////////////////////

                  ///*************** Email Address Text Field ******************/
                  SizedBox(
                    child: TextFieldBox(
                      controller: emailController,
                      headText: "",
                      showHeader: false,
                      hintText: "Enter Email",
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),

                  ///*************** Password Text Field ******************/
                  TextFieldBox(
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
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),

                  DoItText(
                    text: 'Forgot Password?',
                    fontSize: 14.sp,
                  ),
                  SizedBox(height: 100.sp,),
                  
                  ///////////////////////////////////////////////////////////
                  ///*************** BUTTON SECTION SECTION **************/
                  ///////////////////////////////////////////////////////////
                  Row(
                    children: [
                      Expanded(
                        child: DoItButton(
                          onClick: () {
                            if(isAllFieldFilled){
                              modalNotification(
                                message: 'Account successfully created',
                                context: context,
                                isError: false,
                              );
                              nextScreenReplace(context, const MainPage(pageIndex: 0,));
                            } else if(!isAllFieldFilled){
                              modalNotification(
                                message: 'Please fill all the fields',
                                context: context,
                                isError: true,
                              );
                            }
                          },
                          width: double.infinity,
                          text: "Sign in",
                        ),
                      ),
                      SizedBox(width: 10.sp,),

                      Container(
                        height: 60.sp,
                        width: 60.sp,
                        decoration: BoxDecoration(
                          border: Border.all(color: DoItColors.blue, width: 0.5.sp),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            DoItAssetsPath.fingerPrintIcon,
                            height: 34.sp,
                            width: 34.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25.sp),

                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: DoItColors.grey,
                          letterSpacing: 0.2.sp,
                          fontFamily: 'U8-Regular',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create Account',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: DoItColors.blue,
                              letterSpacing: 0.2.sp,
                              fontFamily: 'U8-Regular',
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, const CreateAccountScreen());
                              }
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}