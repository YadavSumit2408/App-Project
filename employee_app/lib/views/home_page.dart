import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/employee.dart';
import '../services/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<Employee>employees =[];
  TextEditingController editingController = TextEditingController();

  // Fetching the Api Data
  Future<List<Employee>>getEmployees() async{
    final response = await http.get(Uri.parse('https://620dfdda20ac3a4eedcf5a52.mockapi.io/api/employee'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode ==200){
      for(Map i in data){
        employees.add(Employee.fromJson(i.cast()));
      }
      return employees ;
    } else{
      return employees;
    }
  }

// Dialog to pop up the Employee details
  DialogFunction(index){
    double width = MediaQuery.of(context).size.width*0.8;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FutureBuilder(
              future:getEmployees(),
              builder: (context,snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(),);
                } else {
                  return  Center(
                    child:  Material(
                      type: MaterialType.canvas,
                      child:Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        ),
                        padding:const EdgeInsets.all(15),
                         width:width,
                          height:320,
                          child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:Image.network(employees[index].avatar,
                            width:120,
                            height:120,
                          ),
                        ),

                        Text(
                         "Name -" + employees[index].name,
                          style:const TextStyle(
                            fontSize:15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          )
                        ),

                        Text(
                          "Country-"+
                            employees[index].country,
                            style:const TextStyle(
                              fontSize:15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Text(
                         "Phone No.-"  + employees[index].phone,
                            style:const TextStyle(
                              fontSize:15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Text(
                           "Email -" +employees[index].email,
                            style:const TextStyle(
                              fontSize:15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),),
                        Text(
                            "Birthday - "+   employees[index].birthday.toIso8601String(),
                            style:const TextStyle(
                              fontSize:15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                          Text(
                           "Created at - "+   employees[index].createdAt.toIso8601String(),
                              style:const TextStyle(
                                fontSize:15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                               )
                             ),]
                          )))
                       );}
                   });}
                 );
               }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child:  Text('Employee Directory',style:TextStyle(color: Colors.black54)),),
        backgroundColor: Colors.tealAccent,
      ),
       body:Container(child:
      Column(
        children:[
          // creating a ListView
          Expanded(
         child: FutureBuilder(
          future:getEmployees(),
          builder: (context,snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(),);
            } else {
              return ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          DialogFunction(index);
                          },
                          child: Card(
                            elevation: 2,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text("Employee details" , textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17, color: Colors.black54
                                    ),
                                  ),
                                ),
                                DataTable(
                                  dataTextStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                  columns: const <DataColumn>[
                                    DataColumn(label: Text("Employee Name",)),
                                    DataColumn(label: Text("Employee Id",)),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(employees[index].name,overflow: TextOverflow.ellipsis)),
                                        DataCell(Text(employees[index].id,overflow: TextOverflow.ellipsis)),
                                       ],
                                     ),],
                                 ),],),),);
                    },);}
              }),),
          // Adding BottomBar
          Positioned(
            child: BottomBar(),
            bottom: 5,
            left: 5,
            right: 5,
          ),
          ],),)
    );
  }
}
