import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay razorpay = Razorpay();

  @override
  void onInit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }


  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void openCheckout() async {
    // log('hello');
    try {
      var options = {
        'key': 'rzp_test_s5X1Pzqy6aD6QO',
        'amount': 100, // ₹1850
        'name': 'Acme Corp',
        'description': 'Payment',
        'prefill': {'contact': '9999999999', 'email': 'test@gmail.com'},
      };

      print('open check out ');
      // log('$options');
      razorpay.open(options);
    } catch (e) {
      print('Error$e');
    }
  }

  void handleError(PaymentFailureResponse reasponse) {
    Get.snackbar('Error', 'Payment Fail${reasponse.message}');
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar('Success', '${response.paymentId}');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar('Wallet', response.walletName ?? '');
  }


}
