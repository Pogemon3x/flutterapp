import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/product_model.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  //Explicit

  //List<String> names = ['aa','bb','cc'];
  List<DocumentSnapshot> snapshots;
  List<ProductModel> productmodels = [];

  // Method
  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Product');
    StreamSubscription<QuerySnapshot> streamSubscription =
        await collectionReference.snapshots().listen((dataSnapShort) {
      snapshots = dataSnapShort.documents;
      for (var mySnapshort in snapshots) {
        String name = mySnapshort.data['Name'];
        String detail = mySnapshort.data['Detail'];
        String path = mySnapshort.data['Path'];
        String qrcode = mySnapshort.data['QRCode'];

        ProductModel productModel = ProductModel(name, detail, path, qrcode);
        setState(() {
          productmodels.add(productModel);
        });
      }
    });
    //await
  }

  Widget showListViewProduct() {
    return ListView.builder(
      itemCount: productmodels.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(productmodels[index].name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return //Text('This is List Product');
        showListViewProduct();
  }
}
