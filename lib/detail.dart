import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final Diseases disease;
  const Detail({Key? key, required this.disease}) : super(key: key);
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  bool fav = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Penyakit'),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            icon:
            fav ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
            onPressed: () {
              setState(() {
                fav = !fav;
              });
            },
          ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width/3,
            height: 150,
            child: ListView.builder(
                itemCount: widget.disease.imgUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(widget.disease.imgUrls,
                  );
                }
            ),
          ),
          Text(widget.disease.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40,),
          Text('Nama Penyakit',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(widget.disease.name),
          SizedBox(height: 15,),
          Text('Nama Tumbuhan',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(widget.disease.plantName),
          SizedBox(height: 15,),
          Text('Ciri-Ciri',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: MediaQuery.of(context).size.width/3,
            height: 95,
            child: ListView.builder(
                itemCount: widget.disease.nutshell.length,
                itemBuilder: (context, index) {
                  return Text(widget.disease.nutshell[index]);
                }
            ),
          ),
          SizedBox(height: 15,),
          Text('ID Penyakit',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(widget.disease.id),
          SizedBox(height: 15,),
          Text('Symptom',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),),
          Text(widget.disease.symptom),
          SizedBox(height: 15,),


        ],

      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launch(widget.disease.imgUrls);
          },
          tooltip: 'imgUrl',
          child: const Icon(Icons.search),
        ),
    );

  }

}
