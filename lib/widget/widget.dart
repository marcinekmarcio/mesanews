import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesa_news_projeto/exp_arq.dart';
import 'package:mesa_news_projeto/store/feed_controller_store.dart';

const Color firstColor = Color(0xff010a53);
const Color secondColor = Colors.white;

Widget logoMesa(double height, double width) {
  Widget logoMesa;
  logoMesa = Container(
    height: height,
    width: width,
    child: Image.asset("image/mesa_logo.png"),
  );
  return new Container(child: logoMesa);
}

Widget standardButton(BuildContext context, Color buttonColor, Color textColor,
    String text, double elevation, double height, VoidCallback callback) {
  Widget content;
  content = Text(
    text,
    style: TextStyle(color: textColor),
  );

  Widget standardButton;
  standardButton = ButtonTheme(
    height: height,
    child: RaisedButton(
      elevation: elevation,
      color: buttonColor,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: content,
      onPressed: callback,
    ),
  );
  return new Container(child: standardButton);
}

Widget standardTextField(BuildContext context, String textFieldName,
    TextEditingController text, TextInputType keyboardType, bool obscureText) {
  InputDecoration inputDecoration;
  inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.symmetric(vertical: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  );

  Widget standardTextField;
  standardTextField = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(2),
        child: textLabel(context, textFieldName, 12, FontWeight.bold,
            firstColor, TextAlign.left, 1),
      ),
      TextField(
        controller: text,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.none,
        decoration: inputDecoration,
        obscureText: obscureText,
      ),
    ],
  );
  return new Container(child: standardTextField);
}

Widget textLabel(BuildContext context, String text, double fontSize,
    FontWeight fontWeight, Color textColor, TextAlign textAlign, int maxLines) {
  Widget textLabel;

  textLabel = Text(
    text,
    textAlign: textAlign,
    style:
        TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    maxLines: maxLines,
    overflow: TextOverflow.fade,
    //softWrap: false,
  );

  return new Container(child: textLabel);
}

Widget feedBox(BuildContext context, String token, String imageUrl,
    String publishedAt, String title, String description) {
  FeedStore feedStore = FeedStore();
  feedStore.fetchFav(imageUrl);
  Widget feedBox = Container(
    height: 420,
    child: Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
          child: null,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Container(
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(builder: (BuildContext context) {
                    bool fav = feedStore.getFav;
                    return Icon(
                      Icons.bookmark,
                      color: fav == true ? Colors.yellow : Colors.black,
                      size: 30,
                    );
                  }),
                  textLabel(
                      context,
                      'Published At: ' + publishedAt.substring(0, 10),
                      12,
                      FontWeight.normal,
                      Colors.black,
                      TextAlign.left,
                      2),
                ],
              ),
              onTap: () {
                feedStore.fetchFavSwitch(imageUrl);
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: textLabel(context, title, 15, FontWeight.bold, Colors.black,
              TextAlign.left, 2),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: textLabel(context, description, 12, FontWeight.normal,
              Colors.black, TextAlign.left, 5),
        ),
        Divider()
      ],
    ),
  );
  return new Container(child: feedBox);
}
