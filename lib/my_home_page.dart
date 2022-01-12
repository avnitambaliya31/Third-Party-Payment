import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyHomePage extends StatefulWidget {
  String? name, email, phone;
  MyHomePage({this.email, this.name, this.phone});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Razorpay razorpay = Razorpay();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    try {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorHandler);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, walletHandler);
    } catch (e) {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  successHandler() {
    Fluttertoast.showToast(
        msg: "Paymenent Successfull", backgroundColor: Colors.green);
  }

  errorHandler() {
    Fluttertoast.showToast(
        msg: "Paymenent failed", backgroundColor: Colors.red);
  }

  walletHandler() {
    Fluttertoast.showToast(
        msg: "Wallet Paymenent Successfull", backgroundColor: Colors.green);
  }

  void openPaymentOption() {
    try {
      var option = {
        "key": "rzp_test_............", // enter your payment id here
        "amount": (num.parse(amountController.text) * 100).toString(),
        "name": widget.name,
        "description": descriptionController.text,
        "prefill": {"contact": widget.phone, "email": widget.email},
        "external": {
          "wallets": ["paytm"]
        }
      };
      razorpay.open(option);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        centerTitle: true,
        title: const Text(
          "Payment Method",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidate: true,
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  height: 400,
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Amount To Pay",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: amountController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field is required * ";
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Text(
                                    "\₹",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Enter the amount",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: descriptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field is required * ";
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Icon(Icons.description)),
                                hintText: "Enter some description",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      openPaymentOption();
                    }
                  },
                  child: Container(
                    color: Colors.indigo[400],
                    height: 50,
                    width: 250,
                    child: const Center(
                      child: Text(
                        "Pay Now",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
