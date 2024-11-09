import 'package:e_shopping/controllers/auth_controller.dart';
import 'package:e_shopping/views/screens/authentications_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();

  late String email;

  late String password;

  bool isLoading = false;

  loginUser(BuildContext context)async {
    setState(() {
      isLoading = true;
    });
    await _authController.signinUsers(context: context, email: email, password: password).whenComplete((){
      _formKey.currentState!.reset();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login Your Account',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: const Color(0xFF0d120E),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontSize: 23,
                    ),
                    ),
                    Text('To Explore the world exclusives',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: const Color(0xFF0d120E),
                      fontSize: 14,
                      letterSpacing: 0.2
                    ),
                    ),
                    Image.asset('assets/images/Illustration.png',
                    width: 200,
                    height: 200,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Email', 
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                        
                        ),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter your email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Enter your email',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                        fontSize: 14,
                        letterSpacing: 0.1
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icons/email.png',
                            width: 20,
                            height: 20,
                          ),
                        )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Password', 
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                        
                        ),
                      ),
                    ),
                    TextFormField(
                       onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter your password';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Enter your password',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                        fontSize: 14,
                        letterSpacing: 0.1
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icons/password.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        suffixIcon: const Icon(Icons.visibility)
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () async{
                        if(_formKey.currentState!.validate()){
                          loginUser(context);
                        } else {
                          debugPrint('Failed');
                        }
                      },
                      child: Container(
                        width: 319,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(colors: [
                            Color(0xFF102DE1),
                            Color(0xCC0D6EFF)
                          ])
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 278,
                              top: 19,
                              child: Opacity(opacity: 0.5, 
                              child: Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 12,
                                    color: const Color(0xFF103DE5)
                                  ),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                              ),
                              )
                              ),
                                Positioned(
                                  left: 311,
                                  top: 36,
                                  child: Opacity(opacity: 0.3,
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    clipBehavior: Clip.antiAlias,
                                    decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)
                                    ),
                                  ),
                                  )
                                  ),
                                  Positioned(
                                    left: 281,
                                    top: -10,
                                    child: Opacity(
                                      opacity: 0.3,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      )
                                    ),
                                    Center(child: isLoading ? const CircularProgressIndicator(color: Colors.white,) : Text(
                                    'Sign In',
                                    style: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                      ),
                                    ))
                          ],
                        )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text('Need an Account?',
                        style: GoogleFonts.roboto(
                          fontWeight:FontWeight.w500,
                          letterSpacing: 1 ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const RegisterScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF103DE5),
                              fontWeight: FontWeight.bold
                            ),
                            ),
                        )
                      ],
                    )
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