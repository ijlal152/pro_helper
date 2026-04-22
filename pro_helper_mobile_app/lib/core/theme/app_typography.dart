import 'package:flutter/material.dart';

class AppTypography {
  // Base font sizes - will be scaled based on screen size
  static const double _baseHeadline1 = 32.0;
  static const double _baseHeadline2 = 28.0;
  static const double _baseHeadline3 = 24.0;
  static const double _baseHeadline4 = 20.0;
  static const double _baseHeadline5 = 18.0;
  static const double _baseHeadline6 = 16.0;
  static const double _baseBody1 = 16.0;
  static const double _baseBody2 = 14.0;
  static const double _baseCaption = 12.0;
  static const double _baseButton = 16.0;

  // Get scaling factor based on screen width
  static double _getScaleFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Mobile: < 600
    if (width < 600) {
      return width < 360 ? 0.85 : 1.0;
    }
    // Tablet: 600-1024
    else if (width < 1024) {
      return 1.15;
    }
    // Desktop: >= 1024
    else {
      return 1.3;
    }
  }

  // Responsive font size calculator
  static double responsiveFontSize(BuildContext context, double baseSize) {
    final scaleFactor = _getScaleFactor(context);
    return baseSize * scaleFactor;
  }

  // Get responsive text theme
  static TextTheme getResponsiveTextTheme(BuildContext context) {
    final scaleFactor = _getScaleFactor(context);

    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseHeadline1 * scaleFactor,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseHeadline2 * scaleFactor,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.3,
        height: 1.2,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseHeadline3 * scaleFactor,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        height: 1.3,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseHeadline4 * scaleFactor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.3,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseHeadline5 * scaleFactor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseHeadline6 * scaleFactor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseBody1 * scaleFactor,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseBody2 * scaleFactor,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseCaption * scaleFactor,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.4,
        height: 1.4,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: _baseButton * scaleFactor,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.25,
        height: 1.2,
      ),
    );
  }

  // Static text styles for common use cases (use with context for responsiveness)
  static TextStyle headline1(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseHeadline1),
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle headline2(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseHeadline2),
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  static TextStyle headline3(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseHeadline3),
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline4(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseHeadline4),
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline5(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseHeadline5),
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline6(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseHeadline6),
    fontWeight: FontWeight.w600,
  );

  static TextStyle body1(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseBody1),
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static TextStyle body2(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseBody2),
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static TextStyle caption(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseCaption),
    fontWeight: FontWeight.normal,
  );

  static TextStyle button(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: responsiveFontSize(context, _baseButton),
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
  );

  // Aliases for better naming consistency
  static TextStyle headingLarge(BuildContext context) => headline1(context);
  static TextStyle headingMedium(BuildContext context) => headline4(context);
  static TextStyle headingSmall(BuildContext context) => headline6(context);
  static TextStyle bodyLarge(BuildContext context) => body1(context);
  static TextStyle bodyMedium(BuildContext context) => body2(context);
  static TextStyle bodySmall(BuildContext context) => caption(context);

  // Utility method to get text scale factor for widgets
  static double getTextScaleFactor(BuildContext context) {
    return _getScaleFactor(context);
  }
}
