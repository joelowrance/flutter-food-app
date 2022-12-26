import 'package:flutter/material.dart';

import '../models/sellers.dart';

class InfoDesignWidget extends StatefulWidget {
  Sellers? model;
  BuildContext? context;

  InfoDesignWidget({this.model, this.context});

  @override
  State<InfoDesignWidget> createState() => _InfoDesignWidgetState();
}

class _InfoDesignWidgetState extends State<InfoDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 285,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.sellerAvatarUrl!,
                height: 210,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1.0,
              ),
              Text(
                widget.model!.sellerName!,
                style: const TextStyle(color: Colors.cyan, fontSize: 20, fontFamily: "TrainOne"),
              ),
              Text(
                widget.model!.sellerEmail!,
                style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: "TrainOne"),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
