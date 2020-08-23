import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/home2/home_screen.dart';

import '../../utils/library/helpers/global.dart';
import '../../utils/styles/colors_style.dart';

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> with TickerProviderStateMixin {
  GlobalKey _keyPinContainer = GlobalKey();

  List<String> pin = [];

  String keyPress = '';

  AnimationController _animationControllerError;
  Animation<double> _animationError;

  AnimationController _animationControllerSuccess;
  Animation<double> _animatedPin1;
  Animation<double> _animatedPin2;
  Animation<double> _animatedPin3;
  Animation<double> _animatedPin4;

  @override
  void initState() {
    super.initState();
    this._createAnimations();
  }

  _createAnimations() {
    // ERROR
    _animationControllerError =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animationControllerError.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerError.reverse();
        this.pin = [];
        this._animationControllerSuccess.reset();
      }
    });

    _animationError = Tween<double>(begin: 0.0, end: 16.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(this._animationControllerError);

    // SUCCESS
    _animationControllerSuccess =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animationControllerSuccess.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        frwkNavigator.navigate(HomeScreen2(), modal: true);
        // _baseBloc.navigate(
        //     to: PontoScreen(
        //       funcionario: this._pinBloc.funcionarioSelecionado,
        //     ),
        //     fullscreenDialog: true);
        Future.delayed(const Duration(seconds: 1), () {
          this.pin = [];
          this._animationControllerSuccess.reset();
        });
      }
    });

    // _animationControllerSuccess.addListener(() {
    //   print(_animatedSuccess.value);
    // });

    _animatedPin1 = Tween<double>(begin: 0.0, end: 80.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(this._animationControllerSuccess);

    _animatedPin2 = Tween<double>(begin: 50.0, end: 80.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(this._animationControllerSuccess);

    _animatedPin3 = Tween<double>(begin: 100.0, end: 80.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(this._animationControllerSuccess);

    _animatedPin4 = Tween<double>(begin: 150.0, end: 80.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(this._animationControllerSuccess);
  }

  @override
  void dispose() {
    _animationControllerSuccess.dispose();
    _animationControllerError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: this._buildAppBar(),
      body: this._buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              frwkLanguage.text('pin_screen.company'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: ColorsStyle.grayLight2),
            ),
            SizedBox(height: 4),
            Text(
              frwkEmployer.employer.getData.companyName.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorsStyle.grayLight2),
            )
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: ColorsStyle.gray,
          ),
        )
      ],
    );
  }

  _buildBody() {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                // color: Colors.yellow,
                // padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        frwkLanguage.text('pin_screen.pin'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ColorsStyle.grayDark),
                      ),
                    ),
                    _includeRow(context),
                  ],
                ),
              ),
            ),
          ),
          _createPinKeyboard()
        ],
      ),
    );
  }

  Widget _createPinKeyboard1() {
    return Expanded(
      // flex: 2,
      child: Container(
        key: _keyPinContainer,
        padding: EdgeInsets.all(16),
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _includeButton("1"),
                _includeButton("2"),
                _includeButton("3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _includeButton("4"),
                _includeButton("5"),
                _includeButton("6"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _includeButton("7"),
                _includeButton("8"),
                _includeButton("9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _includeButtonQrCode('camera'),
                _includeButton("0"),
                _includeButtonApagar('apagar')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createPinKeyboard() {
    return Expanded(
      flex: 3,
      child: Container(
        // color: Colors.green,
        child: GridView.count(
          shrinkWrap: true,
          primary: false,
          childAspectRatio: 1.4,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 3,
          children: <Widget>[
            _includeButton("1"),
            _includeButton("2"),
            _includeButton("3"),
            _includeButton("4"),
            _includeButton("5"),
            _includeButton("6"),
            _includeButton("7"),
            _includeButton("8"),
            _includeButton("9"),
            _includeButtonQrCode('camera'),
            _includeButton("0"),
            // _includeButton("<"),
            _includeButtonApagar('apagar')
          ],
        ),
      ),
    );
  }

  Widget _includeButton(String text) {
    return RawMaterialButton(
      highlightColor: ColorsStyle.orange,
      splashColor: ColorsStyle.orange,
      onPressed: () async {
        setState(() {
          if (this.pin.length < 4) {
            this.pin.add(text);
          }
        });

        if (this.pin.length == 4) {
          var pinStr = this.pin.join('');
          frwkPin.getEmployee(pinStr).then((success) {
            if (success)
              this._animationControllerSuccess.forward();
            else
              this._animationControllerError.forward();
          });
        }
      },
      shape: CircleBorder(side: BorderSide(color: ColorsStyle.orange)),
      onHighlightChanged: (value) {
        setState(() {
          if (value) {
            this.keyPress = text;
          } else {
            this.keyPress = '';
          }
        });
      },
      child: Text(
        text,
        style: TextStyle(
            fontWeight:
                this.keyPress == text ? FontWeight.bold : FontWeight.normal,
            fontSize: 32.0,
            color: this.keyPress == text ? Colors.white : ColorsStyle.gray),
      ),
      elevation: 0,
      // fillColor: this.keyPress == text ? ColorsStyle.laranja : Colors.white,
      fillColor: Colors.white,
    );
  }

  Widget _includeButtonQrCode(String text) {
    return RawMaterialButton(
      highlightColor: ColorsStyle.orange,
      splashColor: ColorsStyle.orange,
      onPressed: () {},
      shape: CircleBorder(),
      onHighlightChanged: (value) {
        setState(() {
          if (value) {
            this.keyPress = text;
          } else {
            this.keyPress = '';
          }
        });
      },
      child: Icon(
        Icons.camera_alt,
        color: this.keyPress == text ? Colors.white : ColorsStyle.grayDark,
        size: 24,
      ),
      elevation: 0.5,
      fillColor: Colors.white,
    );
  }

  Widget _includeButtonApagar(String text) {
    return RawMaterialButton(
      highlightColor: ColorsStyle.orange,
      splashColor: ColorsStyle.orange,
      onPressed: () {
        setState(() {
          if (this.pin.isNotEmpty) {
            this.pin.removeLast();
          }
        });
      },
      shape: CircleBorder(),
      onHighlightChanged: (value) {
        setState(() {
          if (value) {
            this.keyPress = text;
          } else {
            this.keyPress = '';
          }
        });
      },
      child: Icon(
        Icons.backspace,
        color: this.keyPress == text ? Colors.white : ColorsStyle.grayDark,
        size: 24,
      ),
      elevation: 0.5,
      fillColor: Colors.white,
    );
  }

  Widget _includeRow(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        builder: _buildAnimation,
        animation: this._animationControllerError,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      width: 200,
      height: 30,
      margin: EdgeInsets.only(
          top: 32,
          left: _animationError.value + 16.0,
          right: 16.0 - _animationError.value),
      child: AnimatedBuilder(
        animation: this._animationControllerSuccess,
        builder: _buildAnimationStack,
      ),
    );
  }

  Widget _buildAnimationStack(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        _includBox(this.pin.length > 0, 0, this._animatedPin1),
        _includBox(this.pin.length > 1, 1, this._animatedPin2),
        _includBox(this.pin.length > 2, 2, this._animatedPin3),
        _includBox(this.pin.length > 3, 3, this._animatedPin4)
      ],
    );
  }

  Widget _includBox(bool showPin, double index, Animation<double> animation) {
    return Container(
      width: 50,
      margin: EdgeInsets.only(left: animation.value),
      child: Center(
        child: Text(
          '●',
          style: TextStyle(
              fontSize: showPin ? 24 : 14,
              color: showPin
                  ? ColorsStyle.orange
                  : ColorsStyle.orange.withOpacity(0.5)),
        ),
      ),
    );
  }
}
