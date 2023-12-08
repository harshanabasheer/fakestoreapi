import 'package:fakestoreapi/service/cartService.dart';
import 'package:fakestoreapi/service/product_Service.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  ProductDetailPage({required this.productId});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

bool _isAddedToCart = false;

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.category),
          ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ProductService().getSingleProduct(widget.productId),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.network(
                            snapshot.data?['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data?['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow[600]),
                                  Text(
                                    '${snapshot.data?['rating']['rate']} (${snapshot.data?['rating']['count']} reviews)',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\$${snapshot.data?['price'].toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                snapshot.data?['description'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (_isAddedToCart) {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) => CartListPage()));
                              } else {
                                int userId = 1;
                                int quantity = 1;
                                try {
                                  await CartService().addToCart(
                                      userId, widget.productId, quantity);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Added to cart')),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Failed to add to cart')),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 20.0),
                              shape: StadiumBorder(),
                            ),
                            child: Text(
                              _isAddedToCart ? "Go to Cart" : "Add to Cart",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),


                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Buy Now" button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 20.0),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            'Buy Now',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
