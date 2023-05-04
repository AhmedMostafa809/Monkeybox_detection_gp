import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkeybox_final/custom_widgets/button.dart';
import 'package:monkeybox_final/custom_widgets/text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:monkeybox_final/utilities/app_colors.dart';

TextEditingController LoginNameController = TextEditingController();
TextEditingController LoginEmailController = TextEditingController();
TextEditingController LoginPasswordController = TextEditingController();
TextEditingController RegisterEmailController = TextEditingController();
TextEditingController RegisterPasswordController = TextEditingController();

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> loginSize;
  late AnimationController loginController;
  late AnimatedOpacity opacityAnimation;
  Duration animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    loginController =
        AnimationController(vsync: this, duration: animationDuration);

    opacityAnimation =
        AnimatedOpacity(opacity: 0.0, duration: animationDuration);
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  Widget buildRegisterWidgets() {
    return ClipPath(
      clipper: RoundedClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        width: double.infinity,
        height: loginSize.value,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/blob-scene-haikei (1).png'),
            fit: BoxFit.cover,
          ),
          color: clr.primaryColor,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            opacity: loginController.value,
            duration: animationDuration,
            child: GestureDetector(
              onTap: isLogin
                  ? null
                  : () {
                      print("Hi");
                      print(isLogin);
                      loginController.reverse();

                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    'SignUp',
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRegisterComponents() {
    return Visibility(
      visible: isLogin,
      child: Padding(
        padding: EdgeInsets.only(left: 7.w, right: 7.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.h,
              ),
              DefaultFormField(
                controller: LoginNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                obSecured: false,
                hintText: "Name",
                prefixIcon: Icon(
                  Icons.person,
                  color: clr.primaryColor,
                  size: 20.sp,
                ),
                cursorColor: clr.primaryColor,
              ),
              SizedBox(
                height: 3.h,
              ),
              DefaultFormField(
                controller: LoginEmailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                obSecured: false,
                hintText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: clr.primaryColor,
                  size: 20.sp,
                ),
                cursorColor: clr.primaryColor,
              ),
              SizedBox(
                height: 3.h,
              ),
              DefaultFormField(
                controller: LoginPasswordController,
                keyboardType: TextInputType.emailAddress,
                obSecured: true,
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: clr.primaryColor,
                  size: 20.sp,
                ),
                cursorColor: clr.primaryColor,
              ),
              SizedBox(
                height: 3.h,
              ),
              DefaultButton(
                  Onpressed: () {},
                  text: 'Sign Up',
                  clr: Colors.transparent,
                  Height: 7.h,
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginComponents() {
    return Container(

      child: Padding(
        padding: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Log In',
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultFormField(
              controller: RegisterEmailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obSecured: false,
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email,
                color: clr.primaryColor,
                size: 20.sp,
              ),
              cursorColor: clr.primaryColor,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultFormField(
              controller: RegisterPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obSecured: true,
              hintText: "Password",
              prefixIcon: Icon(
                Icons.lock,
                color: clr.primaryColor,
                size: 20.sp,
              ),
              cursorColor: clr.primaryColor,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultButton(
                Onpressed: () {},
                text: 'Log In',
                clr: clr.lightBlue,
                Height: 7.h,
                width: double.infinity)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _defaultLoginSize = 90.h;

    loginSize = Tween<double>(begin: _defaultLoginSize, end: 20.h).animate(
        CurvedAnimation(parent: loginController, curve: Curves.linear));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration,
              child: Container(
                  height: 500,
                  // decoration: BoxDecoration(
                  //     borderRadius: new BorderRadius.vertical(
                  //     top: Radius.elliptical(150, 30),
                  //   ),
                  // ),
                  child: buildLoginComponents()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: isLogin && !loginController.isAnimating
                  ? Colors.white
                  : Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 10.h,
              child: Visibility(
                visible: isLogin,
                child: GestureDetector(
                  onTap: () {
                    loginController.forward();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Center(
                    child: Text(
                      'Log In',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: loginController,
            builder: (context, child) {
              return buildRegisterWidgets();
            },
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                child: Center(child: buildRegisterComponents()),
              ))
        ],
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
