import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trampoapp/screens/login_screen.dart';
import 'package:trampoapp/values/colors.dart';
import 'package:trampoapp/values/styles.dart';

import '../utils/BaseScreen.dart';
import '../utils/CustomButton.dart';
import '../utils/RouteNames.dart';
import '../values/strings.dart';
import '../view_model/LoginViewModel.dart';
import 'MainScreen.dart';

class SignUpScreen extends BaseScreen {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier(true);
  final ValueNotifier<bool> _obscureConfirmNotifier = ValueNotifier(true);
  final ValueNotifier<String> _passwordStrength = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              'SIGN UP',
              style: textDarkW50016.copyWith(fontSize: 22.sp),
            ),
            const Text(
              'Create Your Account',
              style: textDescriptionW40014,
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildFieldLabel('User Name'),
                  _buildTextField(_usernameController, 'Enter Username', svgIconPath: 'assets/images/ic_user.svg'),


                  const SizedBox(height: 10),
                  _buildFieldLabel('Email Address'),
                  _buildTextField(_emailController, 'Enter Email', svgIconPath: 'assets/images/ic_user.svg', keyboardType: TextInputType.emailAddress),

                  const SizedBox(height: 10),
                  _buildFieldLabel('Password'),
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscureTextNotifier,
                    builder: (_, obscure, __) {
                      return _buildPasswordField(
                        controller: _passwordController,
                        obscureText: obscure,
                        toggleObscure: () => _obscureTextNotifier.value = !obscure,
                        onChanged: (value) {
                          _passwordStrength.value = _getPasswordStrength(value);
                        },
                      );
                    },
                  ),
                 /* const SizedBox(height: 6),
                  ValueListenableBuilder<String>(
                    valueListenable: _passwordStrength,
                    builder: (_, strength, __) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        strength.isNotEmpty ? 'Strength: $strength' : '',
                        style: TextStyle(
                          fontSize: 14,
                          color: strength == 'Strong'
                              ? Colors.green
                              : strength == 'Medium'
                              ? Colors.orange
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
*/
                  const SizedBox(height: 10),
                  _buildFieldLabel('Confirm Password'),
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscureConfirmNotifier,
                    builder: (_, obscure, __) {
                      return _buildPasswordField(
                        controller: _confirmPasswordController,
                        obscureText: obscure,
                        toggleObscure: () => _obscureConfirmNotifier.value = !obscure,
                      );
                    },
                  ),

                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text('Forgot Password?', style: textOrangeW50016),
                    ),
                  ),

                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                     /* if (_formKey.currentState?.validate() ?? false) {
                        if (_passwordController.text != _confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Passwords do not match')),
                          );
                        } else {
                          // Trigger signup
                        }
                      }*/

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen(),
                      ));
                    },
                  ),
                 /* SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeThemeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_passwordController.text != _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Passwords do not match')),
                            );
                          } else {
                            // Trigger signup
                          }
                        }
                      },
                      child: Text(
                        'SIGN UP',
                        style: textWhiteW50016.copyWith(fontSize: 22),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(child: Divider(thickness: 1, color: AppColors.description)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or",
                    style: textDescriptionW40014.copyWith(fontSize: 16),
                  ),
                ),
                const Expanded(child: Divider(thickness: 1, color: AppColors.description)),
              ],
            ),

            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.orangeThemeColor, width: 1),
                padding: const EdgeInsets.symmetric(vertical: 12),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'CONTINUE WITH GOOGLE',
                style: textOrangeW50016.copyWith(fontSize: 20),
              ),
            ),

            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.login);
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: textDescriptionW40014.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: textOrangeW50016,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: textDescriptionW40014),
    );
  }


  // with svg icon at the left
  Widget _buildTextField(
      TextEditingController controller,
      String hintText, {
        TextInputType keyboardType = TextInputType.text,
        required String svgIconPath,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textLightW40016,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              svgIconPath,
              width: 20,
              height: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          return null;
        },
      ),
    );
  }


  /* Widget _buildTextField(
      TextEditingController controller,
      String hintText, {
        TextInputType keyboardType = TextInputType.text,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textLightW40016,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          return null;
        },
      ),
    );
  }*/



/*  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Enter Password',
          hintStyle: textLightW40016,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.orangeThemeColor,
            ),
            onPressed: toggleObscure,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
      ),
    );
  }*/

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Enter Password',
          hintStyle: textLightW40016,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/images/ic_pwd.svg',
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.orangeThemeColor,
            ),
            onPressed: toggleObscure,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
      ),
    );
  }


  String _getPasswordStrength(String password) {
    if (password.length >= 8 && RegExp(r'[A-Z]').hasMatch(password) && RegExp(r'\d').hasMatch(password)) {
      return 'Strong';
    } else if (password.length >= 6) {
      return 'Medium';
    } else {
      return 'Weak';
    }
  }
}
