import 'package:liberty_app/constants/utils/exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //********** DO-IT LOGO AND DO-IT IMAGE ********/
                Center(
                  child: Image.asset(
                    DoItAssetsPath.doItImage,
                    height: 100.sp,
                    width: 150.sp,
                  ),
                ),
                SizedBox(height: 10.sp,),

                //*************** ONBOARD IMAGE ************/
                Center(
                  child: Transform.scale(
                    scale: 1.7.sp,
                    child: Image.asset(
                      DoItAssetsPath.onBoardingImage,
                      height: 420.sp,
                      width: 320.sp,
                    ),
                  ),
                ),
                SizedBox(height: 50.sp,),

                //*************** JUST DO-IT TEXT ************/
                Text.rich(
                  TextSpan(
                    text: 'Just ',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: DoItColors.black,
                      letterSpacing: 0.2.sp,
                      fontFamily: 'U8-Regular',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'DO-IT',
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                          color: DoItColors.blue,
                          letterSpacing: 0.2.sp,
                          fontFamily: 'U8-Regular',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {}
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 20.sp,),

                //*********** Login Button **********************/
                DoItButton(
                  onClick: () {
                    nextScreen(context, const CreateAccountScreen());
                  },
                  width: double.infinity,
                  text: "Create account",
                ),
                SizedBox(height: 15.sp),

                Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: DoItColors.grey,
                      letterSpacing: 0.2.sp,
                      fontFamily: 'U8-Regular',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: DoItColors.blue,
                          letterSpacing: 0.2.sp,
                          fontFamily: 'U8-Regular',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            nextScreen(context, const SignInScreen());
                          }
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}