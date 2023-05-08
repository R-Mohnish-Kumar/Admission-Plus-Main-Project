import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../services/auth_services.dart';
import 'package:admission_plus/models/collegeUser.dart';
import 'package:admission_plus/models/user.dart';
class PreferenceAndApplyScreen extends StatefulWidget {
  List departments;
  String applicationFee;
  String selectedValue1 = '';
  String preferenceValue2 = '';
  String preferencevalue3 = '';
  String studentName;
  String studentEmail;
  String studentContact;
  CollegeUser collegeUser;
  User user;
  PreferenceAndApplyScreen(this.departments, this.applicationFee, this.studentName,this.studentEmail,this.studentContact,this.collegeUser,this.user) {
    selectedValue1 = departments[0];
    preferenceValue2 = departments[0];
    preferencevalue3 = departments[0];
  }

  @override
  _PreferenceAndApplyScreenState createState() =>
      _PreferenceAndApplyScreenState();
}

class _PreferenceAndApplyScreenState extends State<PreferenceAndApplyScreen> {
  final razorPay = Razorpay();

  @override
  void initState() {
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFailure);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleWallet);
    super.initState();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Successfull : ${response.paymentId} ${response.orderId} ${response.signature}');
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Payment Successful..!'),
              content: Text(
                  'Payment Details :- Payment Id: ${response.paymentId}'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Okay')),
              ],
            ));
      authServices.updateApplicationCollegeUser(context,widget.collegeUser.id , widget.user);
      authServices.updateApplicationStudentUser(context,widget.user.id, widget.collegeUser);
  }

  void handlePaymentFailure(PaymentFailureResponse response) {
    print(
        'Payment Failed : ${response.code} ${response.error} ${response.message}');
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Payment Failed..:('),
              content: Text(
                  'Error: ${response.error}'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Okay')),
              ],
            ));
  }
  void handleWallet(ExternalWalletResponse response) {
    print(
        'External Wallet : ${response.walletName} ');
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('External Wallet'),
              content: Text(
                  'Wallet: ${response.walletName}'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Okay')),
              ],
            ));
  }
  final authServices = AuthService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 30,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              FittedBox(
                child: Text(
                  'Select Department Preference',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'First Preference',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
              DropdownButtonFormField(
                  value: widget.selectedValue1,
                  items: widget.departments
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      widget.selectedValue1 = val as String;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Second Preference',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
              DropdownButtonFormField(
                  value: widget.preferenceValue2,
                  items: widget.departments
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      widget.preferenceValue2 = val as String;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Third Preference',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
              DropdownButtonFormField(
                  value: widget.preferencevalue3,
                  items: widget.departments
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      widget.preferencevalue3 = val as String;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Application Fee:- Rs.' + widget.applicationFee,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final total = int.parse(widget.applicationFee);
                  final name = widget.studentName;
                  final description = 'Payment for Application';
                  var options={
                    'key':'rzp_test_HnLggoCBC27Maf',
                    'amount':total * 100,
                    'name' : name,
                    'description' : description,
                    'prefill':{
                      'contact':widget.studentContact,
                      'email':widget.studentEmail
                    },
                  };
                  try{
                    razorPay.open(options);
                  }catch(e){
                    debugPrint(e.toString());
                  }
                },
                child: Text(
                  '       Pay and Apply       ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
