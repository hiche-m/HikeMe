import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hikeme/Data/lang.dart';
import 'package:hikeme/Functions/getFavList.dart';
import 'package:hikeme/Functions/location_service.dart';
import 'package:hikeme/Objects/location.dart' as location_obj;
import 'package:hikeme/Objects/user_obj.dart';
import 'package:hikeme/Pages/event.dart';

import '../Objects/event_obj.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//Global varbiales section

class _HomeState extends State<Home> {
  //Local varbiales section
  String location = "Oran, Algeria";
  String profilePic =
      "https://th.bing.com/th/id/OIP.M_0H2uPkl7VdGNUMFd4gSQHaHa";
  String name = "Hichem";
  double defaultPad = 12.0;
  List<EventObj> eventList = [
    EventObj(
      eventId: 1000,
      destination: "Thniet Lhad",
      state: "Tissemsilt",
      groupId: 1,
      groupName: "O'rando Aventure Club",
      groupImg:
          "https://scontent.forn3-2.fna.fbcdn.net/v/t39.30808-6/326552127_951982789120273_4021761146471985276_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGdYxwxhAVsG2EuJ-TykFndR4PzEsEoujRHg_MSwSi6NMtpD8_eZavuweWnkMsO9BFHSKBJFkoQxFHnyEnSFcep&_nc_ohc=x9Bp2tVfU04AX-T3kbp&_nc_ht=scontent.forn3-2.fna&oh=00_AfApuuVsXyS4pQM7hZQo8406x-mxGtakLrlxvt7GcK_Vpg&oe=64064137",
      type: 0,
      price: 2500.0,
      startDate: DateTime(2023, 02, 02, 23, 00),
      endDate: DateTime(2023, 02, 03, 20, 00),
      img:
          "https://scontent.forn3-1.fna.fbcdn.net/v/t39.30808-6/332159487_717809503187927_2971665552631617245_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeGMm4Cvv3Blo-BQgQ2wWVT134WNYvfGmJTfhY1i98aYlH9jisf8I41dnuzWqS3aFLjKvDTkGT9zQpcjhJr2KxBQ&_nc_ohc=bxSI6LOIS38AX8PH2ch&_nc_ht=scontent.forn3-1.fna&oh=00_AfBVTYR4s4Uik2YgsEXWeTrJA_AiZtYS7cx5f2e8W40HIQ&oe=64053C85",
      rateCount: 513,
      rating: 4.6,
      difficulty: 1,
      distance: 0.5,
      maxSeats: 45,
      reservedSeats: 12,
    ),
    EventObj(
      eventId: 1500,
      groupId: 3,
      groupName: "Orand Wild",
      groupImg:
          "https://scontent.forn3-2.fna.fbcdn.net/v/t39.30808-6/305627084_413482464221900_7849181280491038195_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEf-d_eX2S4zKVE5wyhbTHOkyYZGqD7-E-TJhkaoPv4T31XbdxwklvUhcrgFN1xGAztfiPbhqd0jSGLpnxLeAjC&_nc_ohc=eAAdvnw33j0AX8xXUNQ&_nc_ht=scontent.forn3-2.fna&oh=00_AfDpWZ0twJNnOKCrZj6hqTtowcyVk8X6EdOE1Se2rJOXug&oe=64050012",
      destination: "La Vraie Guitare",
      state: "Ain Temouchent",
      price: 900.00,
      startDate: DateTime(2022, 09, 16, 8, 00),
      endDate: DateTime(2022, 09, 16, 20, 00),
      type: 0,
      img:
          "https://scontent.forn3-1.fna.fbcdn.net/v/t39.30808-6/281482115_362328902665965_8312450346446713440_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeH4_ov5qIhglMkXqpNM8iYSZNwMAVpr-CBk3AwBWmv4IGz32cEhOunkFAi3yK7G_7wvbrmAMcyCIobeZhTnKlCi&_nc_ohc=Mi8B5mu3m30AX-ErLC5&_nc_ht=scontent.forn3-1.fna&oh=00_AfC_5d7OdbDPqIwWvlE-UUsAKovyd5LTfX9wT2FjZNR6Aw&oe=640541D0",
      rateCount: 12,
      rating: 3.9,
      difficulty: 4,
      distance: 2.5,
      maxSeats: 25,
      reservedSeats: 25,
    ),
    EventObj(
      eventId: 2000,
      groupId: 2,
      groupName: "Oran Travellers",
      groupImg:
          "https://scontent.forn3-1.fna.fbcdn.net/v/t39.30808-6/291877394_417235607092003_3223303435170634507_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF8W9wl2RuJ2ncPRe2duCxosqejuWMcmO2yp6O5YxyY7eiDgwSkttY8KNXWQPbOEeOjMbKCt9kg1MIo6k-gotdn&_nc_ohc=rs0xmkea61gAX9-dnnn&_nc_ht=scontent.forn3-1.fna&oh=00_AfBjeLNUKSScx03h977VooSqDgmDZH400bi2zhUgYZV3tQ&oe=64067FAB",
      destination: "Brizina",
      state: "El Bayadh",
      price: 2000.00,
      startDate: DateTime(2022, 10, 06, 22, 00),
      endDate: DateTime(2022, 10, 08, 20, 00),
      type: 1,
      img:
          "https://scontent.forn3-1.fna.fbcdn.net/v/t39.30808-6/311456970_527441616071401_4342847089734366742_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGdgXkvvkgwdgQeEn4FCagsS-lMyo17U1VL6UzKjXtTVYC92pv29OBkJWmrzGosYGheV8aDyVI2PzIPa5iaj2S9&_nc_ohc=PCF7SLffHcMAX_fx5L4&_nc_ht=scontent.forn3-1.fna&oh=00_AfAszTAwQd3pXqatcQssjocP3Uzby1RhkVK_-BcXJSF2vQ&oe=6404F07B",
      rateCount: 325,
      rating: 4.3,
      difficulty: 2,
      distance: 0,
      maxSeats: 45,
      reservedSeats: 39,
    ),
    EventObj(
      eventId: 3000,
      groupId: 4,
      groupName: "Oran We Out!",
      groupImg:
          "https://scontent.forn3-1.fna.fbcdn.net/v/t39.30808-6/301861889_103255225853317_9171901467334813649_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEYqsLOynEmb9UU9uA5Q3NxEiimxypXc2USKKbHKldzZd9Ly8Gmt62shNcWAb23q3KS-6QMetGXW4-tIQYoQin3&_nc_ohc=2jdUSqJwIxEAX_VS_F1&_nc_ht=scontent.forn3-1.fna&oh=00_AfATxbskhlVAvI_Lf-C2JfIFjPNz-4Atv9XzziRbDww3mA&oe=6405D8D5",
      destination: "L'île de paloma",
      state: "Oran",
      price: 1200.00,
      startDate: DateTime(2022, 09, 7, 7, 30),
      endDate: DateTime(2022, 09, 7, 20, 00),
      type: 0,
      img:
          "https://scontent.forn3-2.fna.fbcdn.net/v/t39.30808-6/305277776_112431611602345_370167927922617839_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a26aad&_nc_eui2=AeFumlRIfxgMbzz4iNjH3hTvu0uq6NvKy0y7S6ro28rLTLDh7QPItwiuEQ_zmPSzrRT1Rkf8V08HGv-yi7dSz-T0&_nc_ohc=Qy_AEDQWq5AAX9zrgtX&_nc_ht=scontent.forn3-2.fna&oh=00_AfCgKdMRiaiST5xCYCmb8li4pSBscyYyb6ScT727_ydK1A&oe=64066306",
      rateCount: 6,
      rating: 4.9,
      difficulty: 2,
      distance: 0.9,
      maxSeats: 25,
      reservedSeats: 2,
    ),
    EventObj(
      eventId: 2500,
      groupId: 5,
      groupName: "Aventures Randonées Oran",
      groupImg:
          "https://scontent.forn3-2.fna.fbcdn.net/v/t39.30808-6/311417652_479119224245459_5011141129481605766_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFxyAAXT0_82gwUyUxbzyQiPhM8nolWa3w-EzyeiVZrfDly8diEPzRxjyMZAIqDdFnGk6ZCCMvm2bgGHbqAhsed&_nc_ohc=pd0ci21JOxYAX_jyqDx&_nc_ht=scontent.forn3-2.fna&oh=00_AfDJmyyyR5JvqiO9_fJURc0s5cFDy1pwelfYZ3szkAapUA&oe=6405DF8E",
      destination: "Barbadjani",
      state: "Tlemcen",
      price: 4000.0,
      startDate: DateTime(2022, 09, 23, 7, 00),
      endDate: DateTime(2022, 09, 24, 13, 30),
      type: 1,
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Algerie_-_Barbajani.jpg/1280px-Algerie_-_Barbajani.jpg",
      rateCount: 910,
      rating: 4.1,
      difficulty: 0,
      distance: 0,
      maxSeats: 35,
      reservedSeats: 17,
    ),
  ];
  List<int> favIdList = [1, 2, 3];
  late List<EventObj> favList;
  UserObject user = UserObject(
      email: "hichem1029@live.fr",
      firstName: "Hichem",
      lastName: "Rahmani",
      uid: 12345);

  @override
  void initState() {
    super.initState();
    favList = getFavs(eventsList: eventList, favsId: favIdList);
    user.location ?? getLocation();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //Not Done
        tooltip: "HikeMe!",
        backgroundColor: Colors.cyan[300],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: const Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: favList.isNotEmpty ? height * 0.8 : height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          //Top Bar
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                //Location
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.cyan.shade300
                                              .withOpacity(0.1),
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15.0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              if (kDebugMode) {
                                                print("Location");
                                              }
                                            },
                                            icon: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Icon(
                                                    Icons.location_on_rounded,
                                                    color: Colors.cyan
                                                        .withOpacity(0.75))),
                                            label: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                location,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Profile button
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          children: [
                                            const Expanded(
                                                flex: 1, child: SizedBox()),
                                            Expanded(
                                              flex: 4,
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                //Profile
                                                child: InkWell(
                                                  onTap: () {
                                                    if (kDebugMode) {
                                                      print("Profile");
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  22.5)),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            profilePic),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.55),
                                                          spreadRadius: -5,
                                                          blurRadius: 10,
                                                          offset: const Offset(
                                                              0, 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                                flex: 1, child: SizedBox()),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Welcome Text
                          Expanded(
                            flex: 5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${homeContentLang[langs[selectedLang]]![0]},\n$name!",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(flex: 2, child: SizedBox()),
                              ],
                            ),
                          ),
                          //Search Bar
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 15.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print("Search");
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.cyan.shade300.withOpacity(0.1),
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                            horizontal: 15.0,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, left: 8.0),
                                            child: Text(
                                              "${homeContentLang[langs[selectedLang]]![1]}...",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(defaultPad),
                                        child: const FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.cyan,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Favorites section
                    favList.isNotEmpty
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: (height / 7) / 2.5,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 6.0),
                                      child: Text(
                                        homeContentLang[langs[selectedLang]]![
                                            2],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: favList.length,
                                    padding: EdgeInsets.all(defaultPad),
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: favoriteCard(
                                            index, favList[index], width),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              //Bottom section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: (height / 7) / 2.5,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                        child: Text(
                          homeContentLang[langs[selectedLang]]![3],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: eventList.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: width,
                        child:
                            bottomTile(index, eventList[index], width, height),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Favorite Card
  favoriteCard(int index, EventObj object, double width) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventPage(event: object)));
      },
      child: Container(
        width: width / 2.5,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.brown,
          image: object.img != "NULL"
              ? DecorationImage(
                  image: NetworkImage(object.img),
                  fit: BoxFit.cover,
                )
              : null,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.55),
              spreadRadius: -10,
              blurRadius: 13.5,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(defaultPad),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: TextButton.icon(
                          label: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                homeContentLang[langs[selectedLang]]![
                                    5 + object.type],
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                )),
                          ),
                          icon: Container(
                            margin: const EdgeInsets.symmetric(vertical: 3.0),
                            child: Icon(
                                object.type == 0
                                    ? Icons.hiking_rounded
                                    : Icons.night_shelter_rounded,
                                color: Colors.white.withOpacity(0.75)),
                          ),
                          onPressed: () {}),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.cyan,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white.withOpacity(0.4)]),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(defaultPad),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Center(
                                    child: Text(
                                      object.groupName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ))),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                FittedBox(
                                    fit: BoxFit.contain,
                                    child: Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.grey[400],
                                    )),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "${object.destination}, ${object.state}",
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(flex: 2, child: SizedBox()),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        object.price != 0
                                            ? "${object.price} $currency"
                                            : "Unset",
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    color: Colors.white,
                                  ),
                                  child: TextButton(
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: Text("Details",
                                          style: TextStyle(color: Colors.cyan)),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Bottom Tile
  bottomTile(int index, EventObj object, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          if (kDebugMode) {
            print("Tile ${index + 1}");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(bottom: defaultPad),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.orange,
                        image: object.img != "NULL"
                            ? DecorationImage(
                                image: NetworkImage(object.img),
                                fit: BoxFit.cover)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.55),
                            spreadRadius: -5,
                            blurRadius: 10,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: width / 5,
                        child: Padding(
                          padding: EdgeInsets.all(defaultPad),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Icon(
                                              object.type == 0
                                                  ? Icons.hiking_rounded
                                                  : Icons.night_shelter_rounded,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${object.destination}, ${object.state}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  object.groupName,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const Expanded(flex: 2, child: SizedBox()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width / 5,
                      child: Padding(
                        padding: EdgeInsets.all(defaultPad),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              object.price != 0
                                  ? "${object.price.toString()} $currency"
                                  : "Unset",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: defaultPad),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EventPage(event: object)));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.cyan[50],
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: Colors.cyan[300]),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      setState(() {
        user.location = location_obj.Location(
            lat: locationData.latitude,
            long: locationData.longitude,
            city: "",
            country: "");
      });
    }
  }
}
