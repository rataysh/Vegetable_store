import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goods_detail_model.dart';
export 'goods_detail_model.dart';

class GoodsDetailWidget extends StatefulWidget {
  const GoodsDetailWidget({
    Key? key,
    this.item,
  }) : super(key: key);

  final GoodsRecord? item;

  @override
  _GoodsDetailWidgetState createState() => _GoodsDetailWidgetState();
}

class _GoodsDetailWidgetState extends State<GoodsDetailWidget> {
  late GoodsDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoodsDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().currentImage = widget.item!.images!.toList().first;
        FFAppState().choiceVolume = 0;
        FFAppState().currentVolume = 0;
        FFAppState().currentPrice = widget.item!.price.litr1!;
        FFAppState().currentQuntity = 1;
        FFAppState().showTogleQuant = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  FlutterFlowTheme.of(context).part2GrabBack
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 27.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pop();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/Group_9.png',
                                width: 42.0,
                                height: 42.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 7.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('cartPage');
                              },
                              child: Icon(
                                FFIcons.kvector1,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 40.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 305.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 28.0, 21.0, 28.0),
                                child: Builder(
                                  builder: (context) {
                                    final images =
                                        widget.item!.images!.toList();
                                    return SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(images.length,
                                            (imagesIndex) {
                                          final imagesItem =
                                              images[imagesIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFFD6D3D3),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState().currentImage =
                                                        imagesItem;
                                                  });
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    imagesItem,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(0.0),
                              ),
                              border: Border.all(
                                color: Color(0xFFD6D3D3),
                                width: 1.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(0.0),
                              ),
                              child: Image.network(
                                FFAppState().currentImage,
                                width: 284.0,
                                height: 305.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(),
                        child: Text(
                          functions.uppercaseText(widget.item!.name),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Manarope',
                                letterSpacing: 0.8,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: Image.network(
                              functions.capitalizeText(
                                          widget.item!.category!) ==
                                      'Растения'
                                  ? 'https://firebasestorage.googleapis.com/v0/b/test-65e7f.appspot.com/o/categoryImages%2FGroup.png?alt=media&token=8136b820-fa6a-448e-b9ac-f4dd298d828c'
                                  : 'https://firebasestorage.googleapis.com/v0/b/test-65e7f.appspot.com/o/categoryImages%2FVector%20(2).png?alt=media&token=a44b9ff4-fba8-436f-8eaf-ec8aa83e070e',
                              width: 15.9,
                              height: 19.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              functions.capitalizeText(widget.item!.category!),
                              'Plants',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manarope',
                                  fontSize: 14.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 4.0, 60.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            MediaQuery.of(context).size.width < 375.0
                                ? 'Choose\\npackaging:'
                                : 'Choose packaging: ',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Manarope',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  11.0, 0.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final volume =
                                      FFAppState().volumeList.toList();
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(volume.length,
                                          (volumeIndex) {
                                        final volumeItem = volume[volumeIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 9.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().choiceVolume =
                                                    volumeIndex;
                                                FFAppState().currentPrice =
                                                    valueOrDefault<double>(
                                                  () {
                                                    if (FFAppState()
                                                            .choiceVolume ==
                                                        0) {
                                                      return widget
                                                          .item!.price.litr1;
                                                    } else if (FFAppState()
                                                            .choiceVolume ==
                                                        1) {
                                                      return widget
                                                          .item!.price.litr5;
                                                    } else if (FFAppState()
                                                            .choiceVolume ==
                                                        2) {
                                                      return widget
                                                          .item!.price.litr10;
                                                    } else if (FFAppState()
                                                            .choiceVolume ==
                                                        3) {
                                                      return widget
                                                          .item!.price.litr20;
                                                    } else {
                                                      return 0.0;
                                                    }
                                                  }(),
                                                  0.0,
                                                );
                                                FFAppState().currentVolume =
                                                    valueOrDefault<int>(
                                                  () {
                                                    if (FFAppState()
                                                            .choiceVolume ==
                                                        0) {
                                                      return 1;
                                                    } else if (FFAppState()
                                                            .choiceVolume ==
                                                        1) {
                                                      return 5;
                                                    } else if (FFAppState()
                                                            .choiceVolume ==
                                                        2) {
                                                      return 10;
                                                    } else if (FFAppState()
                                                            .choiceVolume ==
                                                        3) {
                                                      return 20;
                                                    } else {
                                                      return 0;
                                                    }
                                                  }(),
                                                  0,
                                                );
                                              });
                                            },
                                            child: Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FFAppState().choiceVolume ==
                                                            volumeIndex
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .mainBlack
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: FFAppState()
                                                              .choiceVolume ==
                                                          volumeIndex
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .mainBlack
                                                      : Color(0xFFD9D9D9),
                                                  width: 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                '${volumeItem.toString()}pcs',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: () {
                                                            if (FFAppState()
                                                                    .choiceVolume ==
                                                                100) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray;
                                                            } else if (FFAppState()
                                                                    .choiceVolume ==
                                                                volumeIndex) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .mainWhite;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray;
                                                            }
                                                          }(),
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 21.0, 40.0),
                      child: Container(
                        height: 130.0,
                        decoration: BoxDecoration(),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor: Color(0xFF427A5B),
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context).gray,
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  indicatorColor: Color(0xFF427A5B),
                                  tabs: [
                                    Tab(
                                      text: 'Description',
                                    ),
                                    Tab(
                                      text: 'Composition',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 0.0),
                                            child: Text(
                                              widget.item!.description!,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final camposition = widget
                                              .item!.composition!
                                              .toList();
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                  camposition.length,
                                                  (campositionIndex) {
                                                final campositionItem =
                                                    camposition[
                                                        campositionIndex];
                                                return Text(
                                                  '• ${campositionItem}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                );
                                              }),
                                            ),
                                          );
                                        },
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 24.0, 16.0),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  '\$${functions.currentCost(FFAppState().currentPrice, FFAppState().currentQuntity).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Manarope',
                                        fontSize: 24.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Stack(
                                children: [
                                  if (!FFAppState().showTogleQuant)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().showTogleQuant = true;
                                        });
                                      },
                                      child: Container(
                                        width: 200.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF427A5B),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Add to cart',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Manarope',
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().showTogleQuant)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().currentQuntity =
                                                    functions
                                                        .decrementCurrentQuantity(
                                                            FFAppState()
                                                                .currentQuntity);
                                              });
                                            },
                                            child: Container(
                                              width: 43.9,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F5F3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        180.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.minus,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .mainBlack,
                                                size: 16.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            '${FFAppState().currentQuntity.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Manarope',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.16,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().currentQuntity =
                                                  FFAppState().currentQuntity +
                                                      1;
                                            });
                                          },
                                          child: Container(
                                            width: 46.1,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF343235),
                                              borderRadius:
                                                  BorderRadius.circular(180.0),
                                            ),
                                            child: Icon(
                                              FFIcons.kvector3,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .mainWhite,
                                              size: 17.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 46.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            FFAppState().cartList = functions
                                .severalCartItems(
                                    FFAppState().cartList.toList(),
                                    FFAppState().currentQuntity,
                                    widget.item!.name,
                                    widget.item!.category,
                                    FFAppState().currentVolume,
                                    FFAppState().currentPrice,
                                    widget.item!.images!.toList().first)
                                .toList();
                          });

                          context.pushNamed('cartPage');
                        },
                        child: Container(
                          width: 335.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FFAppState().showTogleQuant
                                ? FlutterFlowTheme.of(context).primary
                                : Color(0xFFD6D3D3),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Order',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
