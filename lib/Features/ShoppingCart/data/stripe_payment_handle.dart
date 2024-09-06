// import 'dart:convert';
// import 'package:ecommerce/Features/Auth/data/models/models.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class StripePaymentHandle {
//   Map<String, dynamic>? paymentIntent;

//   Future<void> stripeMakePayment(UserModel user, int total) async {
//     try {
//       paymentIntent = await createPaymentIntent((total * 10).toString(), 'NGN');
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   billingDetails: BillingDetails(
//                       name: user.data.name,
//                       email: user.data.email,
//                       phone: 'YOUR NUMBER',
//                       address: const Address(
//                           city: 'YOUR CITY',
//                           country: 'YOUR COUNTRY',
//                           line1: 'YOUR ADDRESS 1',
//                           line2: 'YOUR ADDRESS 2',
//                           postalCode: 'YOUR PIN CODE',
//                           state: 'YOUR STATE')),
//                   paymentIntentClientSecret: paymentIntent![
//                       'client_secret'], //Gotten from payment intent
//                   style: ThemeMode.dark,
//                   merchantDisplayName: 'E-commerce'))
//           .then((value) {});

//       //STEP 3: Display Payment sheet
//       displayPaymentSheet();
//     } catch (e) {
//       //print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       // 3. display the payment sheet.
//       await Stripe.instance.presentPaymentSheet();

//       Fluttertoast.showToast(msg: 'Payment successfully completed');
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         Fluttertoast.showToast(
//             msg: 'Error from Stripe: ${e.error.localizedMessage}');
//       } else {
//         Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
//       }
//     }
//   }

// //create Payment
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       //Request body
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//       };

//       //Make post request to Stripe
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       return json.decode(response.body);
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }

// //calculate Amount
//   calculateAmount(String amount) {
//     final calculatedAmount = (int.parse(amount)) * 100;
//     return calculatedAmount.toString();
//   }
}
