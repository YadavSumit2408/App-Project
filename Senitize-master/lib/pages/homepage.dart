import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';


class DashboardPage extends StatefulWidget {
  final String price;

  DashboardPage({Key key, @required this.price}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState(price);
}

class _DashboardPageState extends State<DashboardPage> {
  String price;
  _DashboardPageState(this.price);


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
      "amount": num.parse(price)*100,
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




