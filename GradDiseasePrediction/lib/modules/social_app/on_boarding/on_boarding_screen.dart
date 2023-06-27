import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared/components/components.dart';
import '../../social_app/social_login/social_login_screen.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body
  });

}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController =  PageController();

  List<BoardingModel> boarding =[
    BoardingModel(
        image: 'assets/images/onboarding1.jfif',
        title: 'Predicting diseases using ML',
        body: 'This application is for the user. The user who wants to predict a specific disease. In this application, we will help the patient to do so, as the application is divided into two branches...',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.jpg',
      title: 'Predict the type of disease based on symptoms',
      body: 'The patient wants to predict the type of disease based on 5 symptoms, which he will send to a diagnostic specialist, and then this consultant will send him the result as soon as possible. This consultant will use Algorithms ML to predict the result and then send the output to the patient...',
    ),
    BoardingModel(
      image: 'assets/images/onboarding3.jpg',
      title: 'Predicting heart disease',
      body: 'The user wants to predict whether the patient has heart disease or not. Values ​​such as age, gender, pressure measurement, and so on are sent to a diagnostic specialist, and then this consultant sends the result as soon as possible.  This consultant will use Algorithms ML to predict the result and then send the output to the patient...',
    ),
  ];
 bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function: ()
                    {
                    navigateAndFinish(context, SocialLoginScreen());
                    },
              text:'SKIP',
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index)
                {
                  if(index== boarding.length -1)
                    {
                      setState(() {
                        isLast=true;
                      });
                     // print('last');
                    }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.deepOrange,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                ),
                Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isLast)
                    {
                      navigateAndFinish(context, SocialLoginScreen());
                    }else
                      {
                        boardController.nextPage(
                          duration: Duration(
                              milliseconds: 750
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,);
                      }
                },
                  backgroundColor: Colors.deepOrange,
                child: Icon (Icons.arrow_forward_ios,),),
              ],
            ),
          ],
        ),
      )
    );
  }
  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Center(
          child: Image(
            image: AssetImage('${model.image}'),
          ),

        ),
      ),
      SizedBox(
        height: 25,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      SizedBox(
        height: 15,
      ),

    ],
  );
}
