import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resturant_details_controller.dart';

class ResturantDetailsView extends GetView<ResturantDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Pappu Dhaba",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ) //TextStyle
                  ), //Text

              background: CachedNetworkImage(
                imageUrl: 'https://i.ibb.co/QpWGK5j/Geeksfor-Geeks.png',
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 230,
          )
        ],
      )),
    );
  }
}
