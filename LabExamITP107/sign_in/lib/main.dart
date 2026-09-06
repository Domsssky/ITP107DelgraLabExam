import 'package:flutter/material.dart';


void main() {
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITP107 Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black87,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
      ),
      home: SignUpScreen(),
    );
  }
}


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _lastAction = 'Try tapping, double tapping, or long pressing the button below.';

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor:  Colors.amber,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/847/847969.png'),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[800],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sign up to get started with ITP107',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 28),

              Card(
                elevation: 4,
                shadowColor: Colors.black26,
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      TextField(
                        controller: _nameController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: _inputDecoration(
                          label: 'Full Name',
                          icon: Icons.person_outline,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: _inputDecoration(
                          label: 'Email Address',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: _inputDecoration(
                          label: 'Password',
                          icon: Icons.lock_outlined,
                        ).copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF6B7280),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  print('Sign Up button pressed!.');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              Divider(thickness: 1, height: 70,),

              GestureDetector(
                onTap: _handleSingleTap,
                onDoubleTap: _handleDoubleTap,
                onLongPress: _handleLongPress,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.amberAccent, Colors.white], begin: AlignmentGeometry.centerRight,end: AlignmentGeometry.centerLeft),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Click Me',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _lastAction,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white38,
                  ),
                ),
              ),  
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 13),
                  ),
                  TextButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print('Log in button pressed!');
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF3A59D1),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  InputDecoration _inputDecoration({required String label, required IconData icon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.amber
      ),
     
      prefixIcon: Icon(icon, color: Colors.amber),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.amber),
      ),
    );
  }

  void _handleSingleTap() {
    print('Hello World!');
    setState(() {
      _lastAction = 'Single Tap detected!';
    });
  }


  void _handleDoubleTap() {
 
    print('Course Code: ITP107');
    print('Course Description: Application Development - a course focused on building mobile applications');


    setState(() {
      _lastAction = 'Double Tap detected!';
    });
  }


  void _handleLongPress() {
    print('Full Name: DELGRA, MARK DOMINIC N.');
    setState(() {
      _lastAction = 'Long Press detected!';
    });
  }
}



