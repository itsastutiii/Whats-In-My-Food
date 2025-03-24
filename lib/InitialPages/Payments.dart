import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _initializeRazorpay();
  }

  void _initializeRazorpay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Payment Success
    _showMessage("Payment Success!", "Payment ID: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Payment Error
    _showMessage("Payment Failed!",
        "Code: ${response.code}\nMessage: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // External Wallet Selected
    _showMessage("External Wallet", "Wallet: ${response.walletName}");
  }

  void _showMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void openCheckout() {
    var options = {
      'key': 'YOUR_API_KEY_HERE', // Replace with your API key
      'amount': 100 * 199, // Amount in paisa (100 INR = 10000 paisa)
      'name': 'Whats In My Food?',
      'description': 'Payment for your order',
      'timeout': 300, // in seconds
      'prefill': {'contact': '9876543210', 'email': 'test@example.com'},
      'external': {
        'wallets': ['paytm', 'gpay', 'phonepe']
      },
      'theme': {'color': '#4287f5'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
      _showMessage('Error', 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.white, // White AppBar
        titleTextStyle: const TextStyle(
          color: Colors.black, // Black text for contrast
          //fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black), // Black icons
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.7, // Background image opacity
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/bg2.png'), // Assuming bg2.png is in assets folder
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Price Display
                const Text(
                  '₹199',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Payment Button
                ElevatedButton(
                  onPressed: openCheckout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    backgroundColor:
                        Colors.white.withOpacity(0.9), // Transparent background
                    shadowColor: Colors.transparent, // Remove shadow
                    side: const BorderSide(
                        color: Colors.black, width: 1.5), // Black outline
                  ),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 18,

                      color: Colors.black, // White text
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Supported Payment Methods
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Supports: UPI, Card, NetBanking, Wallet',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
