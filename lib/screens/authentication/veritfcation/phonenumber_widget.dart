import 'package:appet/helpers/color_utils.dart';
import 'package:appet/text_style_widget.dart';
import 'package:appet/widgets/text_field_widget.dart';
import 'package:appet/widgets/tinder_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class PhoneWidget extends StatefulWidget {
  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  TextEditingController phoneNumberController = TextEditingController();
  String? _selectedCountryCode;
  String? phoneNumber = "";
  List<String>? _countryCodes = ['+91', '+20'];

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String? verificationId;

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    var countryDropDown = Container(
      height: 30.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedCountryCode,
            items: _countryCodes?.map((String? value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value!,
                    style: TextStyle(fontSize: 12.0),
                  ));
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedCountryCode = value;
              });
            },
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  currentState ==
                          MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? [
                          Text(
                            "My number is",
                            style: TextStyleWidget.build(false,
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorUtils.appColor, width: 0.2),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 0,
                            offset: Offset(1, 1)),
                      ],
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                              child: TextFieldWidget(
                                phoneNumberController,
                                prefixIcon: countryDropDown,
                                hint: '',
                                colorText: Colors.black,
                                textInputType: TextInputType.number,
                                //  validation: (_) {},
                                onChanged: (value) {
                                  setState(() {
                                    phoneNumber = value;
                                    phoneController.text = value;
                                  });
                                },
                              )),

                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            margin:
                                EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 0.0),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: ElevatedButton(
                              child: Text("Send",
                                  style: TextStyleWidget.build(false,
                                      color: phoneNumber == ""
                                          ? Colors.grey
                                          : Colors.white)),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(2),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.black12),
                                shadowColor:
                                    MaterialStateProperty.all(Colors.pink.shade50),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50))),
                                backgroundColor: MaterialStateProperty.all(
                                    phoneNumber == ""
                                        ? Colors.white
                                        : ColorUtils.appColor),
                                fixedSize:
                                    MaterialStateProperty.all(const Size(412, 60)),
                              ),
                              onPressed: () async {
                                setState(() {
                                  showLoading = true;
                                });

                                await _auth.verifyPhoneNumber(
                                  phoneNumber: phoneController.text,
                                  verificationCompleted:
                                      (phoneAuthCredential) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                  },
                                  verificationFailed: (verificationFailed) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    _scaffoldKey.currentState?.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                verificationFailed.message ?? "")));
                                  },
                                  codeSent: (verificationId, resendingToken) async {
                                    setState(() {
                                      showLoading = false;
                                      currentState = MobileVerificationState
                                          .SHOW_OTP_FORM_STATE;
                                      this.verificationId = verificationId;
                                    });
                                  },
                                  codeAutoRetrievalTimeout:
                                      (verificationId) async {},
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: Text(
                            'OR',
                            style: TextStyleWidget.build(false,
                                fontSize: 13, color: Colors.black),
                          )),

                          const SizedBox(
                            height: 20,
                          ),

                          Padding(
                            padding:  EdgeInsets.only(right: 28.0, top: 25.0),
                            child:  TinderButton(
                              texto: 'LOG IN WITH GOOGLE',
                              imagem: AssetImage('assets/images/google.png'),
                              cor: Colors.black87,
                            ),
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 28.0, top: 10.0),
                            child: TinderButton(
                                texto: 'LOG IN WITH FACEBOOK',
                                imagem:
                                    const AssetImage('assets/images/facebook.png'),
                                cor: Colors.blue.shade500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ]
                      :
                  [
                getOtpFormWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Container()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message ?? "")));
    }
  }

  getOtpFormWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60,
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: ColorUtils.appColor, width: 0.2),
                boxShadow: [
                  BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 0,
                      offset: Offset(1, 1)),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: TextFieldWidget(
              otpController,
              hint: "Enter OTP",
              // ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FlatButton(
            onPressed: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId ?? "",
                      smsCode: otpController.text);
              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("VERIFY"),
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
