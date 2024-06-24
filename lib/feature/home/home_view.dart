import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../product/model/coffees_model.dart';
 
class HomeView extends StatelessWidget {
  HomeView({super.key});
  

  final CollectionReference coffees =
      FirebaseFirestore.instance.collection('coffees');

  @override
  Widget build(BuildContext context) {
    final response = coffees.withConverter(
      fromFirestore: (snapshot, options) {
        
        return Coffees().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Coffees?>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Placeholder();
            case ConnectionState.waiting:
              return const LinearProgressIndicator();
            case ConnectionState.active:
              return const LinearProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<Coffees?> values = snapshot.data?.docs
                        .map(
                          (e) => e.data(),
                        )
                        .toList() ??
                    [];
                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index) {
                    
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            values[index]!.backgroundImage!,
                            height: 100,
                            width: 100,
                          ),
                          Text(values[index]?.title ?? '')
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Container(height: 100, width: 100, color: Colors.red);
              }
          }
        },
      ),
    );
  }
}
