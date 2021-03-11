import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:productivity_app/components/hex_to_color.dart';
import '../../main.dart';
import '../../size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/Bloc.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Positioned(top: 0, child: BackgroundImage()),
      Positioned(top: 50, child: Avatar()),
      Positioned(bottom: 0, child: FormContainer())
    ]));
  }
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: getProportionateScreenWidth(414),
      height: getProportionateScreenHeight(550),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/map.png'),
        fit: BoxFit.cover,
      )),
      child: Container(
        color: hexToColor('#7625CF').withOpacity(0.35),
      ),
    );
  }
}

class FormContainer extends StatefulWidget {
  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(320),
      width: getProportionateScreenWidth(414),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Let's help you get more productive.",
            style: GoogleFonts.signika(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20)),
            child: StreamBuilder<String>(
              stream: _bloc.name,
              builder: (context, snapshot) => TextField(
                onChanged: _bloc.nameChanged,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorText: snapshot.error,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                        left: getProportionateScreenWidth(14),
                        top: getProportionateScreenHeight(13),
                        bottom: getProportionateScreenHeight(13)),
                    hintText: 'Enter Name',
                    isDense: true,
                    hintStyle: GoogleFonts.signika(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                    labelText: 'Name'),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          StreamBuilder<bool>(
              stream: _bloc.submitCheck,
              builder: (context, snapshot) {
                return Container(
                  height: getProportionateScreenHeight(58),
                  width: getProportionateScreenWidth(354),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    onPressed: snapshot.hasData ? () => changeThePage() : null,
                    color: hexToColor('#7625CF').withOpacity(0.35),
                    child: Container(
                      height: getProportionateScreenHeight(58),
                      width: getProportionateScreenWidth(354),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: GoogleFonts.signika(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  changeThePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TimerHomePage()));
  }
}

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: (_image == null)
                            ? AssetImage('assets/avatar.gif')
                            : FileImage(
                                _image, 
                              ),
                      )),
                ),
              ),
            ),
            Positioned(
                right: 5,
                bottom: 4,
                child: InkWell(
                  onTap: () => getImage(),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        onPressed: null,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
