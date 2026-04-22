import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4FA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF1e40af),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1e40af).withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.bolt_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              // Title
              Text(
                'TestBus',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF1e40af),
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Streamline your distribution.',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF576069),
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 80),
              // Sign In Button
              _buildGoogleSignInButton(context),
              const SizedBox(height: 24),
              Text(
                'By signing in, you agree to our Terms and Conditions.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: const Color(0xFF576069).withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF1e40af),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1e40af).withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
                    width: 24,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.g_mobiledata,
                      color: Color(0xFF4285F4),
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 54,
                  ), // Center text accounting for the logo
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
