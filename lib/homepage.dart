import 'package:flutter/material.dart';
import 'package:universe/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:universe/data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: gradientEndColor,
      body: SingleChildScrollView(
        child: Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(colors: [gradientStartColor,gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: ([0.3,0.7])
            )
          ) ,
        
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.left,
                      ),
                      
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Solar System',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 24,
                                color: const Color(0x7cdbf1ff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                        onChanged: (value) {},
                        icon: Image.asset('assets/drop_down_icon.png'),
                        underline: SizedBox(),
                      ),
                    ],
                  ),
                  Container(
                      height: 500,
                      padding: const EdgeInsets.only(left: 32),
                      child: Swiper(
                        itemCount: planets.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(builder: DotSwiperPaginationBuilder() ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Column(
                                
                              children: [
                                  SizedBox(height:100),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)
                                    ),
                                    color: Colors.white,
                                    
                                    child:Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column
                                      (  crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                        SizedBox(height:100),
                                        Text(planets[index].name,
                                        style:TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color:const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                    
                                        ),
                                        textAlign: TextAlign.left,),
                                          Text(
                                            'Solar System',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                            fontSize: 23,
                                          color:primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                    
                                        ),
                                        textAlign: TextAlign.left,
                                            ),
                                          SizedBox(height: 32,),
      
                                            Row(
                                              children: [
                                                Text(
                                                  'Know more',
                                        style: TextStyle(
                                              fontFamily: 'Avenir',
                                            fontSize: 18,
                                          color:secondaryTextColor,
                                          fontWeight: FontWeight.w500,
                                    
                                        ),
                                        textAlign: TextAlign.left,
                                                ),
                                                Icon(Icons.arrow_forward,color:secondaryTextColor)
                                              ],
                                            )
                                          
                                      ],),
                                    )
                                  )
                                ],
                              ),
                              Image.asset(planets[index].iconImage),
      
                            ],
                          );
                        },
                        
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
    
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.0),
            topRight: Radius.circular(36.0)
          ),
color: navigationColor,
        ),
        
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed:() {}, icon:Image.asset('assets/menu_icon.png'),),
            IconButton(onPressed:() {}, icon:Image.asset('assets/search_icon.png'),),
            IconButton(onPressed:() {}, icon:Image.asset('assets/profile_icon.png'),),
          ],
        ),
      ),
    );
  }
}
