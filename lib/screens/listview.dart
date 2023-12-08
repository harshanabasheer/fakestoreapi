import 'package:fakestoreapi/screens/categoryDetail.dart';
import 'package:fakestoreapi/service/categoryService.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}
class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<dynamic>>(
            future: Categories().getAllCategory(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>>snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data=snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CategoryProductsPage(category: data)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ), //Border.all
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: const Offset(
                                    5.0,
                                    5.0,
                                  ), //Offset
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Center(child: Text(data, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red,fontStyle: FontStyle.italic),))
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator(),);
            }
        ),
      ),
    );
  }
}


