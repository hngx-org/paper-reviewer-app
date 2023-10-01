import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/routes/routes.dart';
import '../../constants/colors.dart';
class PaymentMehodScreen extends StatefulWidget {
  const PaymentMehodScreen({super.key});

  @override
  State<PaymentMehodScreen> createState() => _PaymentMehodScreenState();
}

class _PaymentMehodScreenState extends State<PaymentMehodScreen> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Payment Method",
        style: TextStyle(
          color: ProjectColors.black,
        ),
        ),
        leading: const BackButton(),
        backgroundColor: ProjectColors.white,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: size.width,
                height: 55,
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  border: _type == 1
                      ? Border.all(width: 1, color: ProjectColors.maxLightPurple)
                      : Border.all(
                          width: 0.3,
                          color: Colors.grey,
                        ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: ProjectColors.maxLightPurple,
                          ),
                          Text("Amazon Pay",
                              style: _type == 1
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: ProjectColors.black
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    )),
                        ],
                      ),
                      const SizedBox(width: 230,),
                     const Icon(
                      FontAwesomeIcons.amazon
                     )
        
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  border: _type == 2
                      ? Border.all(width: 1, color: ProjectColors.maxLightPurple,)
                      : Border.all(
                          width: 0.3,
                          color: Colors.grey,
                        ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: ProjectColors.maxLightPurple,
                          ),
                          Text("Credit Card",
                              style: _type == 2
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: ProjectColors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    )),
                        ],
                      ),
                       const SizedBox(width: 200,),
                     const Icon(FontAwesomeIcons.ccVisa),
                      const SizedBox(
                        width: 8,
                      ),
                     const Icon(FontAwesomeIcons.ccMastercard)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  border: _type == 3
                      ? Border.all(width: 1, color:ProjectColors.maxLightPurple)
                      : Border.all(
                          width: 0.3,
                          color:Colors.grey,
                        ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor:  ProjectColors.maxLightPurple,
                          ),
                          Text("PayPal",
                              style: _type == 3
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color:ProjectColors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    )),
                        ],
                      ),
                       const SizedBox(width: 260,),
                      const Icon(FontAwesomeIcons.ccPaypal)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  border: _type == 4
                      ? Border.all(width: 1, color: ProjectColors.maxLightPurple)
                      : Border.all(
                          width: 0.3,
                          color: Colors.grey,
                        ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: ProjectColors.maxLightPurple,
                          ),
                          Text("Google Pay",
                              style: _type == 4
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: ProjectColors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    )),
                        ],
                      ),
                       const SizedBox(width: 230,),
                      const Icon(FontAwesomeIcons.googlePay)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
               MaterialButton(onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    color: ProjectColors.deepPurple,
                  minWidth: double.infinity,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 60,
                  child: const Text("Confirm Payment",
                  style: TextStyle(
                    color: ProjectColors.white,
                    fontWeight: FontWeight.w200
                  ),
                  ),
                  ),
                  
            ],
          ),
        ),
      )),
    );
  }
}