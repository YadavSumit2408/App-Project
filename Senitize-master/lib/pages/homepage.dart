import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String uid = '';
  getUid() {}



  Razorpay razorpay;
  TextEditingController textEditingController=new TextEditingController();
  @override

  void initState(){
    this.uid = '';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
    razorpay=new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }
  void dispose(){
    super.dispose();
    razorpay.clear();
  }
  void openCheckout(){
    var options={
      "key":"rzp_test_8YqQnVMY2URk4R",
      "amount": num.parse(textEditingController.text)*100,
      "name":"Sample App",
      "description" : "Pay for your safety",
      "prefill":{
        "contact":"8565939142",
        "email":"thewebers2408@gmail.com"
      },
      "externals":{
        "wallets":["paytm"]

      }

    };
    try{
      razorpay.open(options);
    }catch(e)
    {
      print(e.toString());
    }
  }


  void handlerPaymentSuccess(){
    print("Payment Success");
    Toast.show("Payment Success", context);
  }
  void handlerErrorFailure() {
    print("Payment Error");
    Toast.show("Payment Errror", context);
  }
  void handlerExternalWallet(){
    print("External Wallet");
    Toast.show("External Wallet", context);
  }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment mode")

        ,),
      body: Center(
          child:Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('You are now logged in as ${uid}'),
                SizedBox(
                  height: 15.0,
                ),
                new OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
                  child: Text('Logout'),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((action) {
                      Navigator
                          .of(context)
                          .pushReplacementNamed('/intro');
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(hintText: "Amount To Pay"),

                ),
                SizedBox(height:12,),
                RaisedButton(
                  color:Colors.blue,
                  child: Text("Pay Now",style:TextStyle(color:Colors.white)),
                  onPressed: (){
                    openCheckout();

                  },


                )
              ],
            ),
          )
      ),
    );
  }
}



