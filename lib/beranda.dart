import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'detail.dart';

class Beranda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyakit Pada Tumbuhan'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: listDisease.length
          , itemBuilder: (context, index) {
            final Diseases disease = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(
                  disease : disease,
                )));
              },
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      child: Image.network(disease.imgUrls,
                      height: 90,
                      width: 90,),
                    ),
                    Text(disease.name)
                  ],
                ),
              ),
            );
      })
    );
  }
  
}

