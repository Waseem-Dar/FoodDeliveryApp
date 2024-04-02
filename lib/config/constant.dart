import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant{

  static void showSnackBar(BuildContext context, String msg,String icon) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageIcon(AssetImage(icon),size: 23,color: AppColors.mainColor,),
          Text(msg,style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      padding: const EdgeInsets.symmetric(vertical: 8),
      duration: const Duration(seconds: 1 ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
      width: 230,
    ));
  }



static String about1 = "This app is your go-to food delivery app, designed to bring convenience, variety,  and satisfaction right to your doorstep. Whether you're craving  comforting classics, exploring exotic flavors, or seeking healthier  options, It has you covered with a diverse selection of  restaurants and cuisines.";

static String about2 = "Discovering your next culinary adventure is effortless with  its intuitive interface. Browse through an extensive array of  restaurants, ranging from local gems to popular chains, conveniently  sorted by cuisine type, price range, and user ratings. Our curated  collections and recommendations ensure that you never run out of  inspiration for your next meal.";

static String about3 = "Ordering your favorite dishes is a breeze. Simply select your desired items from the menu, customize them to your preferences, and proceed to checkout with just a few taps. Our secure payment system ensures a seamless transaction, allowing you to focus on the excitement of anticipating your meal's arrival.";
static String about4 = "Track the progress of your order in real-time with  live updates, so you'll always know exactly when to expect your delicious delivery. Our advanced logistics technology ensures timely and efficient service, so you can enjoy your food while it's still hot and fresh.";
static String about5 = "We prioritize your satisfaction above all else. That's why we offer dedicated customer support to address any inquiries or concerns you may have along the way. Your feedback is invaluable to us, as we continually strive to enhance your dining experience and exceed your expectations.";
static String about6 = "Experience the convenience and delight of hassle-free food delivery with us. Download the app today and embark on a culinary journey that's tailored to your tastes, preferences, and cravings. Whether you're dining solo, hosting a gathering, or treating your loved ones, We are here to elevate every mealtime moment.";

static String privacy1 = "The collected personal information is primarily used to facilitate food orders and deliveries. It may also be used for purposes such as account management, customer support, marketing communications, and personalization of the user experience.";
static String privacy2 = "The app is committed to maintaining the security of users' personal information and employs various measures to protect it from unauthorized access, disclosure, alteration, or destruction. This may include encryption, secure payment processing, and regular security audits.";
static String privacy3 = "The app may engage third-party service providers or partners to facilitate certain functions such as payment processing, delivery services, or analytics. These third parties are typically required to adhere to similar privacy standards and are prohibited from using users' personal information for any purpose other than providing the contracted services.";
static String privacy4 = "The app may use cookies and similar tracking technologies to enhance user experience, analyze trends, administer the app, and gather demographic information. Users may have the option to manage their cookie preferences through their device or browser settings.";
static String privacy5 = "Users are typically provided with options to manage their account settings, update their personal information, and opt out of certain types of communications or data processing activities.";
static String privacy6 = "The app may disclose users' personal information when required by law or in response to valid legal requests, such as subpoenas or court orders. Additionally, personal information may be disclosed in connection with mergers, acquisitions, or other business transactions involving the app.";
static String privacy7 = "The app reserves the right to update its privacy policy periodically to reflect changes in its practices or legal requirements. Users are usually notified of significant changes and may be required to review and accept the updated policy to continue using the app.";
static String privacy8 = "The privacy policy typically provides contact information for users to reach out with any questions, concerns, or requests regarding their personal information and privacy practices.";


static String terms1 = "By accessing or using our Service, you agree to be bound by these Terms. If you do not agree to all of the provisions set forth in these Terms, you may not access or use the Service.";
static String terms2 = "By accessing or using our Service, you agree to comply with these Terms. If you do not agree with any part of these Terms, you may not use our Service.";
static String terms3 = "You must be at least 18 years old to use our Service. By using the Service, you represent and warrant that you are at least 18 years old.";
static String terms4 = "You agree to use the Service only for lawful purposes and in compliance with all applicable laws and regulations.";
static String terms5 = "To access certain features of the Service, you may be required to register for an account. When registering for an account, you agree to provide accurate, current, and complete information about yourself.";
static String terms6 = "You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.";
static String terms7 = "You agree to pay all fees associated with your use of the Service as described on the platform. Fees may include the cost of goods, delivery fees, and applicable taxes.";
static String terms8 = "Payment processing services for users of the Service are provided by third-party payment processors. We are not responsible for any actions or inactions of such third parties.";
static String terms9 = "You retain ownership of any content you submit or upload to the Service. By submitting content, you grant us a non-exclusive, worldwide, royalty-free, perpetual, irrevocable, sublicensable right to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, and display such content.";
static String terms10 = "You agree not to submit any content that is unlawful, defamatory, obscene, or otherwise objectionable.";
static String terms11 = "All content included on the Service, such as text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, and software, is the property of [Food Delivery App] or its content suppliers and protected by international copyright laws.";
static String terms12 = "We reserve the right to terminate or suspend your access to the Service at any time, without notice, for any reason.";
static String terms13 = 'The Service is provided on an "as is" and "as available" basis, without any warranties of any kind, either express or implied. We do not warrant that the Service will be uninterrupted or error-free, that defects will be corrected, or that the Service is free of viruses or other harmful components.';
static String terms14 = "In no event shall [Food Delivery App], its affiliates, or their respective officers, directors, employees, or agents be liable for any indirect, incidental, special, consequential, or punitive damages, arising out of or in connection with your use of the Service.";
static String terms15 = "These Terms shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law provisions.";
static String terms16 = "We reserve the right to update or modify these Terms at any time without prior notice. By continuing to access or use the Service after we have posted a revised version of these Terms, you agree to be bound by the revised Terms.";
static String terms17 = "If you have any questions about these Terms, please contact us at [contact email or address].";
static String terms18 = "By using the Service, you acknowledge that you have read, understood, and agree to be bound by these Terms.";

static String termsO1 = "Violate any laws or regulations.";
static String termsO2 = "interfere with or disrupt the Service or servers or networks connected to the Service.";
static String termsO3 = "Attempt to gain unauthorized access to any portion of the Service.";
static String termsO4 = "Use the Service to transmit any viruses or harmful code.";

}