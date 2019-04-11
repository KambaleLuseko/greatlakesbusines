import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';


class welcome extends StatefulWidget {
  static String tag='welcome-page';
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  String msgResponse="";
  TextEditingController fullname=new TextEditingController();
  TextEditingController mailUser=new TextEditingController();
  TextEditingController phoneNumber=new TextEditingController();
  TextEditingController pwd=new TextEditingController();
  TextEditingController retypePwd=new TextEditingController();

  // Login request
  Future<List> _registerReq() async{
    var url="http://192.168.43.246/greatlakesbusinness/register.php";
    if(fullname.text.toString().trim()=="" || mailUser.text.toString().trim()=="" || phoneNumber.text.toString().trim()=="" || pwd.text.toString().trim()=="")
    {
        setState(() {
            msgResponse="Veuillez remplir tous les champs";
        });
    }
    else if(pwd.text.toString().trim()!=retypePwd.text.toString().trim())
    {
        setState(() {
            msgResponse="Les mots de passe ne correspondent pas";
        });
    }
    else
    {
        final response=await http.post(url, body: {
            "fullname": fullname.text.toString().trim(),
            "email":mailUser.text.toString().trim(),
            "phone":phoneNumber.text.toString().trim(),
            "pwd":pwd.text.toString().trim()
        }).then((response){
          var responseData=json.decode(response.body);
          if(responseData.toString().trim().length==0)
          {
              setState(() {
                     msgResponse="Server error";
                });
          }
          else if(responseData.toString().trim()=="Account created")
          {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new loginPage()));
          }
          else
          {
              setState(() {
                     msgResponse=responseData;
                });
          }
        // print(responseData);
      });
    }    
  }

  @override
  Widget build(BuildContext context) {



    final pageTitle=Text('Register', style: TextStyle(color: Colors.lightBlue, fontSize: 30.0), textAlign: TextAlign.center);
    final appName=Text('Greats Lakes Business', style: TextStyle(color: Colors.lightBlue, fontSize: 25.0));


    final logo=Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30.0,
        child: Image.asset('assets/greatlakes.png'),
      ),
    );

    final fullnameTxt=TextFormField(
      controller: fullname,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Jean Dupont',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final mailUserTxt=TextFormField(
      controller: mailUser,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'example@domaine.com',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final phoneNumberTxt=TextFormField(
      controller: phoneNumber,
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '+243 000000000',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final pwdTxt=TextFormField(
      controller: pwd,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '1234',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );


    final retypePwdTxt=TextFormField(
      controller: retypePwd,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '1234',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final signupBtn=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(70.0),
        color: Colors.lightBlue,
        elevation: 7.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          child: Text('Sign up', style: TextStyle(color: Colors.white54, fontSize: 18.0)),
          onPressed: (){
              _registerReq();
          }
        ),
      ),
    );

    final infoLbl=Text('Vous avez un compte?', style: TextStyle(color: Colors.grey, fontSize: 14.0), textAlign: TextAlign.center,);
    final go_loginBtn=FlatButton(
      child: Text('Login', style: TextStyle(color: Colors.lightBlue, fontSize: 15.0),),
      onPressed:(){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new loginPage()));
      } 
    );

    final msgRes=Text(msgResponse, style: TextStyle(color: Colors.red, fontSize: 14.0), textAlign: TextAlign.center,);


    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Greats Lakes Business', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            // appName,
            SizedBox(height: 10.0,),
            logo,
            pageTitle,
            SizedBox(height: 5.0,),
            fullnameTxt,
            SizedBox(height: 5.0,),
            mailUserTxt,
            SizedBox(height: 5.0,),
            phoneNumberTxt,
            SizedBox(height: 5.0,),
            pwdTxt,
            SizedBox(height: 5.0,),
            retypePwdTxt,
            SizedBox(height: 5.0,),
            msgRes,
            signupBtn,
            // SizedBox(height: 0.0,),
            infoLbl,
            // SizedBox(height: 0.0,),
            go_loginBtn,
            // SizedBox(height: 5.0,),
          ],
        ),
      ),
    );
  }
}

