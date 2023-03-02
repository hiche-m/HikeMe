import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hikeme/Data/lang.dart';
import 'package:hikeme/Objects/event_obj.dart';

class EventPage extends StatefulWidget {
  final EventObj event;
  // ignore: use_key_in_widget_constructors
  const EventPage({required this.event});

  @override
  // ignore: no_logic_in_create_state
  State<EventPage> createState() => _EventPageState(event: event);
}

class _EventPageState extends State<EventPage> {
  final EventObj event;
  _EventPageState({required this.event});

  double defaultPad = 16.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: defaultPad, left: defaultPad),
          child: Text(
            "${event.destination}, ${event.state}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Container(
          margin: EdgeInsets.only(top: defaultPad, left: defaultPad),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.9),
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashRadius: 0.1,
            icon: const FittedBox(
                fit: BoxFit.contain, child: Icon(Icons.chevron_left_rounded)),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      //                                                                        //Body
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(event.img), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 700),
              builder: (BuildContext context, double val, Widget? child) {
                return Opacity(
                  opacity: val,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50 - (val * 50)),
                    child: child!,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(defaultPad),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                    child: Container(
                      height: height / 3,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.3),
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(defaultPad),
                        child: Column(
                          children: [
                            //                                                  //Location Header
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    child: Row(children: [
                                      const Expanded(
                                        flex: 1,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Icon(
                                            Icons.location_on_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        eventContentLang[langs[
                                                            selectedLang]]![0],
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ))),
                                            const Expanded(
                                              flex: 1,
                                              child: FractionallySizedBox(
                                                heightFactor: 0.8,
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    "Rue Mostaghanem 42', Oran",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                )),
                            const Divider(),
                            //                                                  //Content
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    //Picture
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              event.groupImg,
                                            ),
                                          ),
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Date
                                            Expanded(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  "${weekdayLang[langs[selectedLang]]![event.startDate.weekday]!} ${event.startDate.day} ${monthLang[langs[selectedLang]]![event.startDate.month]!} ${event.startDate.year}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: FractionallySizedBox(
                                              heightFactor: 0.8,
                                              child: FittedBox(
                                                alignment: Alignment.centerLeft,
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  event.groupName,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        FittedBox(
                                                          fit: BoxFit.contain,
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: ratingBar(
                                                              event.rating),
                                                        ),
                                                        FittedBox(
                                                            fit: BoxFit.contain,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5.0,
                                                                      bottom:
                                                                          1.0),
                                                              child: Text(
                                                                "(${event.rateCount})",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                ),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      "${eventContentLang[langs[selectedLang]]![1]}: ${event.price} $currency",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            //                                  //Sub-Info Section
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  //Item 1
                                                  event.difficulty != 0 &&
                                                          event.distance != 0
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Tooltip(
                                                            message:
                                                                eventContentLang[
                                                                    langs[
                                                                        selectedLang]]![2],
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                const FittedBox(
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    child: Icon(
                                                                      Icons
                                                                          .terrain_rounded,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                                FittedBox(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              4.0),
                                                                      child:
                                                                          Text(
                                                                        " ${event.difficulty}/10",
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              const FittedBox(
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  child: Icon(
                                                                    Icons
                                                                        .terrain_rounded,
                                                                    color: Colors
                                                                        .transparent,
                                                                  )),
                                                              FittedBox(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0),
                                                                    child: Text(
                                                                      " ${event.difficulty}/10",
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                  //Item 2
                                                  event.distance != 0
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Tooltip(
                                                            message:
                                                                eventContentLang[
                                                                    langs[
                                                                        selectedLang]]![3],
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                const FittedBox(
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    child: Icon(
                                                                      Icons
                                                                          .hiking_rounded,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                                FittedBox(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              4.0),
                                                                      child:
                                                                          Text(
                                                                        " ${event.distance} km",
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : event.distance == 0 &&
                                                              event.difficulty !=
                                                                  0
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          8.0),
                                                              child: Tooltip(
                                                                message:
                                                                    eventContentLang[
                                                                        langs[
                                                                            selectedLang]]![2],
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    const FittedBox(
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .terrain_rounded,
                                                                          color:
                                                                              Colors.white,
                                                                        )),
                                                                    FittedBox(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 4.0),
                                                                          child:
                                                                              Text(
                                                                            " ${event.difficulty}/10",
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  const FittedBox(
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .terrain_rounded,
                                                                        color: Colors
                                                                            .transparent,
                                                                      )),
                                                                  FittedBox(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 4.0),
                                                                        child:
                                                                            Text(
                                                                          " ${event.difficulty}/10",
                                                                          style:
                                                                              const TextStyle(
                                                                            color:
                                                                                Colors.transparent,
                                                                          ),
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                  //Item 3
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Tooltip(
                                                      message: eventContentLang[
                                                          langs[
                                                              selectedLang]]![4],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: const [
                                                          FittedBox(
                                                            fit: BoxFit.contain,
                                                            child: Icon(
                                                              Icons
                                                                  .wb_sunny_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          FittedBox(
                                                            fit: BoxFit.cover,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 4.0),
                                                              child: Text(
                                                                " 28°",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  //Item 4
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Tooltip(
                                                      message: eventContentLang[
                                                          langs[
                                                              selectedLang]]![5],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          const FittedBox(
                                                            fit: BoxFit.contain,
                                                            child: Icon(
                                                              Icons
                                                                  .people_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          FittedBox(
                                                              fit: BoxFit.cover,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0),
                                                                child: Text(
                                                                  " ${event.reservedSeats}/${event.maxSeats}",
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //                                                  //Action Buttons
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: FractionallySizedBox(
                                      heightFactor: 0.8,
                                      widthFactor: 0.3,
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15.0)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              eventContentLang[
                                                  langs[selectedLang]]![6],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FractionallySizedBox(
                                      heightFactor: 0.8,
                                      widthFactor: 0.6,
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.greenAccent[700],
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15.0)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              "Hike Me!",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ratingBar(double rating) {
    return RatingBar.builder(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.grey.shade500,
      itemBuilder: (context, _) {
        return const Icon(Icons.star_rate_rounded, color: Colors.blue);
      },
      itemPadding: const EdgeInsets.all(0.1),
      maxRating: 5,
      glow: false,
      ignoreGestures: true,
      onRatingUpdate: (rating) {},
    );
  }
}
