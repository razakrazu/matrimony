import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {

  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleWallet);
  }

  void openCheckout() {
    var options = {
      'key': 'YOUR_KEY',
      'amount': 185000, // ₹1850
      'name': 'Acme Corp',
      'description': 'Payment',
      'prefill': {
        'contact': '9999999999',
        'email': 'test@gmail.com'
      }
    };

    _razorpay.open(options);
  }

  void handleSuccess(PaymentSuccessResponse response) {
    Get.snackbar("Success", "Payment ID: ${response.paymentId}");
  }

  void handleError(PaymentFailureResponse response) {
    Get.snackbar("Error", response.message ?? "Payment Failed");
  }

  void handleWallet(ExternalWalletResponse response) {
    Get.snackbar("Wallet", response.walletName ?? "");
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}