import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelScreen extends StatefulWidget {
  final Hotel hotel;

  HotelScreen({this.hotel});
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.hotel.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(
                        widget.hotel.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.sortAmountDown,
                          size: 35,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.hotel.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$${widget.hotel.price}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 210, 0),
                      child: Text(
                        'Description:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.hotel.address),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
