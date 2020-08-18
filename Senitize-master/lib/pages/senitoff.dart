import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';


class Senitoff extends StatefulWidget {
  final String office;

  Senitoff({Key key, @required this.office}) : super(key: key);
  @override
  _SenitoffState createState() => _SenitoffState(office);
}

class _SenitoffState extends State<Senitoff> {
  String office;
  _SenitoffState(this.office);
  Razorpay razorpay;


  String _date = "Not set";
  String _time = "Not set";
  Geolocator geolocator = Geolocator();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
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
      "amount": num.parse(office)*100,
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




  final snackBar1 = SnackBar(content: Text('Date is not set!'));
  final snackBar2 = SnackBar(content: Text('Time is not set!'));
  final snackBar3 = SnackBar(content: Text('Please give full address'));




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place order'),
      ),
      body:Builder(
      builder: (context) =>  Center(
        child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Text(
                      'OFFICE SENITIZATION \n ₹500',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            elevation: 4.0,
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  theme: DatePickerTheme(
                                    containerHeight: 210.0,
                                  ),
                                  showTitleActions: true,
                                  minTime: DateTime(2000, 1, 1),
                                  maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                                    print('confirm $date');
                                    _date = '${date.year} - ${date.month} - ${date.day}';
                                    setState(() {});
                                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.date_range,
                                              size: 18.0,
                                              color: Colors.teal,
                                            ),
                                            Text(
                                              " $_date",
                                              style: TextStyle(
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "  Set",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            elevation: 4.0,
                            onPressed: () {
                              DatePicker.showTimePicker(context,
                                  theme: DatePickerTheme(
                                    containerHeight: 210.0,
                                  ),
                                  showTitleActions: true, onConfirm: (time) {
                                    print('confirm $time');
                                    _time =
                                    '${time.hour} : ${time.minute} : ${time.second}';
                                    setState(() {});
                                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              size: 18.0,
                                              color: Colors.teal,
                                            ),
                                            Text(
                                              " $_time",
                                              style: TextStyle(
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "  Set",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.orange, size: 35.0,),
                    title: Container(
                      width: 250.0,
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          hintText: "Address/Location",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                      label: Text("Use Current Location",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.blue,
                      onPressed: ()=> {print(office),
                          getUserLocation(),
                            },
                      icon: Icon(Icons.my_location, color: Colors.white,),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 100.0,
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                      label: Text('Pay now ' + office,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.blue,
                      onPressed: ()=>{
                        if(_date == "Not set") {
                          Scaffold.of(context).showSnackBar(snackBar1)
                        }else if(_time == "Not set" ){
                          Scaffold.of(context).showSnackBar(snackBar2)
                        }else if( locationController.text.isEmpty ) {
                          Scaffold.of(context).showSnackBar(snackBar3)
                        }
                        else{
                            openCheckout()
                          }

//                        openCheckout(),
//                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DashboardPage(price: office)))
                      },
                      icon: Icon(Icons.payment, color: Colors.white,),
                    ),
                  ),
                ])),
      ),
      ),);
  }
  getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await Geolocator().placemarkFromCoordinates(
        position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String completeAddress = '${placemark.subThoroughfare} ,${placemark
        .thoroughfare}, ${placemark.subLocality} ${placemark.locality} ${placemark.subAdministrativeArea}${placemark
        .administrativeArea} ${placemark.postalCode},${placemark.country}';print(completeAddress);
    String formattedAddress = "${placemark.thoroughfare}, ${placemark.locality},${placemark.postalCode}, ${placemark.country}";
    locationController.text = formattedAddress;
  }
}

