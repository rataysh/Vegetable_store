import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'container_goods_model.dart';
export 'container_goods_model.dart';

class ContainerGoodsWidget extends StatefulWidget {
  const ContainerGoodsWidget({
    Key? key,
    String? name,
    String? category,
    this.image,
  })  : this.name = name ?? 'Title',
        this.category = category ?? 'Category',
        super(key: key);

  final String name;
  final String category;
  final String? image;

  @override
  _ContainerGoodsWidgetState createState() => _ContainerGoodsWidgetState();
}

class _ContainerGoodsWidgetState extends State<ContainerGoodsWidget> {
  late ContainerGoodsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerGoodsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 15.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 248.0,
        constraints: BoxConstraints(
          maxWidth: 160.0,
          maxHeight: 248.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0xFFD3F3E1),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(18.6047),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(13.0, 16.0, 13.0, 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.30233),
                child: Image.network(
                  widget.image!,
                  width: 132.7,
                  height: 116.8,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    functions.uppercaseText(widget.name),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Manarope',
                          fontSize: 12.0,
                          letterSpacing: 0.8,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.96, 0.0),
                      child: Image.network(
                        functions.capitalizeText(widget.category) == 'Растения'
                            ? 'https://firebasestorage.googleapis.com/v0/b/test-65e7f.appspot.com/o/categoryImages%2FGroup.png?alt=media&token=8136b820-fa6a-448e-b9ac-f4dd298d828c'
                            : 'https://firebasestorage.googleapis.com/v0/b/test-65e7f.appspot.com/o/categoryImages%2FVector%20(2).png?alt=media&token=a44b9ff4-fba8-436f-8eaf-ec8aa83e070e',
                        width: 14.9,
                        height: 14.9,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      functions.uppercaseText(widget.category),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manarope',
                            letterSpacing: 0.8,
                            useGoogleFonts: false,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 78.4,
                height: 21.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(9.30233),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'More details',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manarope',
                        fontSize: 11.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
