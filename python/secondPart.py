import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from sklearn.model_selection import train_test_split
from tkinter import *
from tkinter import ttk
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
import numpy as np
import pandas as pd
from pandas import DataFrame, Series
from IPython.display import Image 
from io import StringIO
import pydotplus
from sklearn import preprocessing
from sklearn.preprocessing import MinMaxScaler
from sklearn.neighbors import KNeighborsClassifier

root = Tk()
root.configure(background='silver')
root.geometry('1200x600+30+30')
root.title('Information of Patients[Secound Part Heart]')
root.resizable(False,False)

title = Label(root,text='[Heart Disease Prediction based on ML ALGORITHMS]',bg='darkblue', fg="white",font=('monospace',14))
title.pack(fill=X)

Details_Frame = Frame(root)
Details_Frame.place(x=45,y=30,width=1110,height=520)

scroll_x = Scrollbar(Details_Frame,orient=HORIZONTAL)
scroll_y = Scrollbar(Details_Frame,orient=VERTICAL)

heart_table = ttk.Treeview(Details_Frame,columns=('NoOfOp','age','gender','cp','trestbps','chol','fbs','restecg','thalach','exang','oldpack','slope','ca','thal','NameOfPatient','Phone','EmailAddress','DateTime','Result'),
xscrollcommand = scroll_x.set, 
yscrollcommand = scroll_y.set)

heart_table.place(x=20,y=1,width=1050,height=500)
scroll_x.config(command=heart_table.xview)
scroll_y.config(command=heart_table.yview)
scroll_x.pack(side=BOTTOM,fill=X)
scroll_y.pack(side=RIGHT,fill=Y)

heart_table['show'] = 'headings'
heart_table.heading('NoOfOp',text='No_Of_Op')
heart_table.heading('age',text='Age')
heart_table.heading('gender',text='Gender')
heart_table.heading('cp',text='chest pain type')
heart_table.heading('trestbps',text=' resting blood pressure')
heart_table.heading('chol',text='cholesterol')
heart_table.heading('fbs',text='fasting blood sugar')
heart_table.heading('restecg',text='rest ecg')
heart_table.heading('thalach',text='max heart rate achieved')
heart_table.heading('exang',text='exercise induced angina')
heart_table.heading('oldpack',text='st depression')
heart_table.heading('slope',text='st slope')
heart_table.heading('ca',text='num major vessels')
heart_table.heading('thal',text='thalassemia')
heart_table.heading('NameOfPatient',text='Name Of Patient')
heart_table.heading('Phone',text='Phone')
heart_table.heading('EmailAddress',text='Email Address')
heart_table.heading('DateTime',text='Date Time')
heart_table.heading('Result',text='Result')

heart_table.column('NoOfOp',width=57)
heart_table.column('age',width=75)
heart_table.column('gender',width=75)
heart_table.column('cp',width=75)
heart_table.column('trestbps',width=75)
heart_table.column('chol',width=75)
heart_table.column('fbs',width=75)
heart_table.column('restecg',width=75)
heart_table.column('thalach',width=75)
heart_table.column('exang',width=75)
heart_table.column('oldpack',width=75)
heart_table.column('slope',width=75)
heart_table.column('ca',width=75)
heart_table.column('thal',width=75)
heart_table.column('NameOfPatient',width=100)
heart_table.column('Phone',width=70)
heart_table.column('EmailAddress',width=100)
heart_table.column('DateTime',width=100)
heart_table.column('Result',width=60)

def refresh():
    fetch_data()

def fetch_data():
    
    db = firestore.client()
    users_ref_info = db.collection(u'users')
    users_ref_data = db.collection(u'Heart')
    
    docs_info = users_ref_info.stream()
    docs_data = users_ref_data.stream()

    i=1
    dectionary= dict()
    dectionary2 = dict()
    heart_table.delete(*heart_table.get_children())
    for doc in docs_data:
        docs_info = users_ref_info.stream()
        dectionary= dict()
        dectionary2 = dict()
        dectionary = doc.to_dict()
        for docInfo in docs_info:
            dectionary2 =docInfo.to_dict()
            if (dectionary['uId'].__eq__(dectionary2['uId'])):
                heart_table.insert("",END,values=[i,dectionary['Age'],dectionary['Gender'],dectionary['chestPainType'],dectionary['bloodPressure'],dectionary['cholesterol'],dectionary['bloodSuger'],dectionary['restEcg'],dectionary['maxHeartRate'],dectionary['angina'],dectionary['stDepression'],dectionary['stSlope'],dectionary['numMajorVessels'],dectionary['thal'],dectionary2['name'],dectionary2['phone'],dectionary2['email'],dectionary['dateTime'],dectionary['result']])
        i+=1


btn2 = Button(root,text='Refresh',command=refresh,bg='darkblue',width=10,justify=CENTER, fg="white",font=('Times',12,'bold'))
btn2.place(x=50,y=560)

intvar = IntVar(root, name ="int")
root.setvar(name ="int", value = 1)
Ent1 = Entry(root,width=10,textvariable=intvar, justify=CENTER,bg='green', fg="white",font=('Times',12,'bold'))
Ent1.place(x=320,y=565)

def predict():
    j= intvar.get()
    j-=1
    db = firestore.client()
    users_ref = db.collection(u'Heart')
    docs = users_ref.stream()
    i=0
    age=''
    sex=''
    cp=''
    trestbps=''
    chol=''
    fbs=''
    restecg=''
    thalach=''
    exang=''
    oldpack=''
    slope=''
    ca=''
    thal=''
   

    dectionary= dict()
    for doc in docs:
        if (i==j):
            dectionary = doc.to_dict()
            age= dectionary['Age']
            sex= dectionary['Gender']
            cp= dectionary['chestPainType']
            trestbps= dectionary['bloodPressure']
            chol= dectionary['cholesterol']
            fbs= dectionary['bloodSuger']
            restecg= dectionary['restEcg']
            thalach= dectionary['maxHeartRate']
            exang= dectionary['angina']
            oldpack= dectionary['stDepression']
            slope= dectionary['stSlope']
            ca= dectionary['numMajorVessels']
            thal= dectionary['thal']
        i+=1
    
    sex2 =0
    fbs2 =0
    cp2 =0
    restecg2=0 
    slope2 =0
    thal2 =0
    if (str(dectionary['Gender']) == 'Male'):
        sex2 = 0
    elif (str(dectionary['Gender']) == 'Female'):
        sex2 = 0    
    if (str(dectionary['bloodSuger']) == 'lower than 120 mg/ml'):
        fbs2 = 0
    elif (str(dectionary['bloodSuger']) == 'greater than 120 mg/ml'):
        fbs2 = 1
    if (str(dectionary['chestPainType']) == 'typical angina'):
        cp2 = 0
    elif (str(dectionary['chestPainType']) == 'atypical angina'):
        cp2 = 1
    elif (str(dectionary['chestPainType']) == 'non angina pain'):
        cp2 = 2
    elif (str(dectionary['chestPainType']) == 'asymptomatic'):
        cp2 = 3
    if (str(dectionary['restEcg']) == 'normal'):
        restecg2 = 0
    elif (str(dectionary['restEcg']) == 'ST-T wave abnormality'):
        restecg2 = 1
    elif (str(dectionary['restEcg']) == 'left ventricular hypertrophy'):
        restecg2 = 2
    if (str(dectionary['stSlope']) == 'upsloping'):
        slope2 = 0
    elif (str(dectionary['stSlope']) == 'flat'):
        slope2 = 1
    elif (str(dectionary['stSlope']) == 'down sloping'):
        slope2 = 2
    if (str(dectionary['thal']) == 'normal'):
        thal2 = 1
    elif (str(dectionary['thal']) == 'fixed defect'):
        thal2 = 2
    elif (str(dectionary['thal']) == 'reversible defect'):
        thal2 = 3
                        

    
    input_data = (int(age),sex2,cp2,int(trestbps),int(chol),fbs2,restecg2,int(thalach),int(exang),float(oldpack),slope2,int(ca),thal2)
    print(input_data)
    
    input_data_as_numpy_array= np.asarray(input_data)
    input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)
    
    data = pd.read_csv("heart.csv")
    data.columns = ['age', 'sex', 'chest_pain_type', 'resting_blood_pressure', 'cholesterol', 'fasting_blood_sugar', 'rest_ecg', 'max_heart_rate_achieved',
    'exercise_induced_angina', 'st_depression', 'st_slope', 'num_major_vessels', 'thalassemia', 'target']
    names=['age', 'sex', 'chest_pain_type', 'resting_blood_pressure', 'cholesterol', 'fasting_blood_sugar', 'rest_ecg', 'max_heart_rate_achieved',
    'exercise_induced_angina', 'st_depression', 'st_slope', 'num_major_vessels', 'thalassemia', 'target']
    predictors = data.drop("target",axis=1)
    target = data["target"]

    X_train,X_test,Y_train,Y_test = train_test_split(predictors,target,test_size=0.20,random_state=0)
    scalerMinMax = MinMaxScaler()
    scalerMinMax.fit(X_train)
    X_train_scaledMinMax = scalerMinMax.transform(X_train)
    X_test_scaledMinMax = scalerMinMax.transform(X_test)
    X_input_data_scaledMinMax = scalerMinMax.transform(input_data_reshaped)
    X_train_scaledMinMax = pd.DataFrame(X_train_scaledMinMax,columns=X_train.columns)

    from sklearn.neighbors import KNeighborsClassifier
    knn = KNeighborsClassifier( n_neighbors=7)

    knn.fit(X_train_scaledMinMax, Y_train)

    y_pred_knn = knn.predict(X_test_scaledMinMax)
    print(y_pred_knn)
    prediction = knn.predict(X_input_data_scaledMinMax)

    score_knn = round(accuracy_score(y_pred_knn,Y_test)*100,2)

    print("The accuracy score achieved using KNN is: "+str(score_knn)+" %")


    

    
    print(prediction)

    res = ''    

    if (prediction == 0):
        print('The Person does not have a Heart Disease')
        res = 'The Person does not have a Heart Disease'
    elif (prediction == 1):
        print('The Person has Heart Disease')
        res = 'The Person has Heart Disease'


    acc3 = Label(root, text="accuracy = %s"% str(score_knn),justify=CENTER,font=('Times',12,'bold'), fg="yellow", bg="black")
    acc3.place(x=770,y=564)
    
    t3 = Text(root, height=1, font=('Times',12,'bold'), width=37,bg="orange",fg="black")
    t3.place(x=430,y=565)
    # -----------------------------------------------------


    t3.delete("1.0", END)
    t3.insert(END, res)     
   

btnPredict = Button(root,text='Predict',command=predict,bg='darkblue',width=10,justify=CENTER, fg="white",font=('Times',12,'bold'))
btnPredict.place(x=190,y=560)
fetch_data()


def train_model(X_train, y_train, X_test, y_test, classifier, **kwargs):
    
    """
    Fit the chosen model and print out the score.
    
    """
    
    # instantiate model
    model = classifier(**kwargs)
    
    # train model
    model.fit(X_train,y_train)
    
    # check accuracy and print out the results
    fit_accuracy = model.score(X_train, y_train)
    test_accuracy = model.score(X_test, y_test)
    
    print(f"Train accuracy: {fit_accuracy:0.2%}")
    print(f"Test accuracy: {test_accuracy:0.2%}")
    
    return model


def predictAndAddDataInFirebase():
    #j= intvar.get()
    #j-=1
    db = firestore.client()
    users_ref = db.collection(u'Heart')
    docs = users_ref.stream()
    #i=0
    
    for doc in docs:
        age=''
        sex=''
        cp=''
        trestbps=''
        chol=''
        fbs=''
        restecg=''
        thalach=''
        exang=''
        oldpack=''
        slope=''
        ca=''
        thal=''
        dectionary= dict()
        dectionary = doc.to_dict()
        if (dectionary['isReplied'] is False):
            
            age= dectionary['Age']
            sex= dectionary['Gender']
            cp= dectionary['chestPainType']
            trestbps= dectionary['bloodPressure']
            chol= dectionary['cholesterol']
            fbs= dectionary['bloodSuger']
            restecg= dectionary['restEcg']
            thalach= dectionary['maxHeartRate']
            exang= dectionary['angina']
            oldpack= dectionary['stDepression']
            slope= dectionary['stSlope']
            ca= dectionary['numMajorVessels']
            thal= dectionary['thal']
            sex2 =0
            fbs2 =0
            cp2 =0
            restecg2=0 
            slope2 =0
            thal2 =0
            if (str(dectionary['Gender']) == 'Male'):
                sex2 = 0
            elif (str(dectionary['Gender']) == 'Female'):
                sex2 = 0    
            if (str(dectionary['bloodSuger']) == 'lower than 120 mg/ml'):
                fbs2 = 0
            elif (str(dectionary['bloodSuger']) == 'greater than 120 mg/ml'):
                fbs2 = 1
            if (str(dectionary['chestPainType']) == 'typical angina'):
                cp2 = 0
            elif (str(dectionary['chestPainType']) == 'atypical angina'):
                cp2 = 1
            elif (str(dectionary['chestPainType']) == 'non angina pain'):
                cp2 = 2
            elif (str(dectionary['chestPainType']) == 'asymptomatic'):
                cp2 = 3
            if (str(dectionary['restEcg']) == 'normal'):
                restecg2 = 0
            elif (str(dectionary['restEcg']) == 'ST-T wave abnormality'):
                restecg2 = 1
            elif (str(dectionary['restEcg']) == 'left ventricular hypertrophy'):
                restecg2 = 2
            if (str(dectionary['stSlope']) == 'upsloping'):
                slope2 = 0
            elif (str(dectionary['stSlope']) == 'flat'):
                slope2 = 1
            elif (str(dectionary['stSlope']) == 'down sloping'):
                slope2 = 2
            if (str(dectionary['thal']) == 'normal'):
                thal2 = 1
            elif (str(dectionary['thal']) == 'fixed defect'):
                thal2 = 2
            elif (str(dectionary['thal']) == 'reversible defect'):
                thal2 = 3
                                
            
            input_data = (int(age),sex2,cp2,int(trestbps),int(chol),fbs2,restecg2,int(thalach),int(exang),float(oldpack),slope2,int(ca),thal2)
            print(input_data)
            
            input_data_as_numpy_array= np.asarray(input_data)
            input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)
            
            data = pd.read_csv("heart.csv")
            data.columns = ['age', 'sex', 'chest_pain_type', 'resting_blood_pressure', 'cholesterol', 'fasting_blood_sugar', 'rest_ecg', 'max_heart_rate_achieved',
            'exercise_induced_angina', 'st_depression', 'st_slope', 'num_major_vessels', 'thalassemia', 'target']
            names=['age', 'sex', 'chest_pain_type', 'resting_blood_pressure', 'cholesterol', 'fasting_blood_sugar', 'rest_ecg', 'max_heart_rate_achieved',
            'exercise_induced_angina', 'st_depression', 'st_slope', 'num_major_vessels', 'thalassemia', 'target']
            predictors = data.drop("target",axis=1)
            target = data["target"]

            X_train,X_test,Y_train,Y_test = train_test_split(predictors,target,test_size=0.20,random_state=0)
            scalerMinMax = MinMaxScaler()
            scalerMinMax.fit(X_train)
            X_train_scaledMinMax = scalerMinMax.transform(X_train)
            X_test_scaledMinMax = scalerMinMax.transform(X_test)
            X_input_data_scaledMinMax = scalerMinMax.transform(input_data_reshaped)
            X_train_scaledMinMax = pd.DataFrame(X_train_scaledMinMax,columns=X_train.columns)

            from sklearn.neighbors import KNeighborsClassifier
            knn = KNeighborsClassifier( n_neighbors=7)

            knn.fit(X_train_scaledMinMax, Y_train)

            y_pred_knn = knn.predict(X_test_scaledMinMax)
            print(y_pred_knn)
            prediction = knn.predict(X_input_data_scaledMinMax)

            score_knn = round(accuracy_score(y_pred_knn,Y_test)*100,2)

            print("The accuracy score achieved using KNN is: "+str(score_knn)+" %")

            predres =''
            res = ''    

            if (prediction == 0):
                print('The Person does not have a Heart Disease')
                res = 'The Person does not have a Heart Disease'
                predres = 'False'
            elif (prediction == 1):
                print('The Person has Heart Disease')
                res = 'The Person has Heart Disease'
                predres = 'True'
                
            acc3 = Label(root, text="accuracy = %s"% str(score_knn),justify=CENTER,font=('Times',12,'bold'), fg="yellow", bg="black")
            acc3.place(x=770,y=564)
            
            
            dataMSG ={        
                'MSG' : 'The result of the operation that you performed on \n '
                + dectionary['dateTime']+
                '\n and that you wanted to predict if you have heart disease problems or not and the values were \n Age : ' + dectionary['Age']
                +' , \n Gender:- '+ dectionary['Gender']
                +' , \n chest pain type :- '+ dectionary['chestPainType']
                +' , \n resting blood pressure : '+ dectionary['bloodPressure']
                +' , \n cholesterol : '+ dectionary['cholesterol']
                +' , \n fasting blood sugar:- '+ dectionary['bloodSuger']
                +' , \n rest ecg:- '+ dectionary['restEcg']
                +' , \n max heart rate achieved : '+ dectionary['maxHeartRate']
                +' , \n exercise induced angina : '+ dectionary['angina']
                +' , \n st depression : '+ dectionary['stDepression']
                +' , \n st slope:- '+ dectionary['stSlope']
                +' , \n num major vessels : '+ dectionary['numMajorVessels'] 
                +' , \n thalassemia:- '+ dectionary['thal'] +' : \n The Expectation is \n" ' + res + ' " ' , 
                }   
            
            db = firestore.client()
            
            doc_set = db.collection(u'HeartResult').document(dectionary['uId'])
            doc_set.set(dataMSG)
            
            dataReplied ={        
                'dateTime' : dectionary['dateTime'],
                'isReplied' : True,
                'Age' : dectionary['Age'],
                'Gender' : dectionary['Gender'],
                'angina' : dectionary['angina'],
                'bloodPressure' : dectionary['bloodPressure'],
                'bloodSuger' : dectionary['bloodSuger'],
                'chestPainType' : dectionary['chestPainType'],
                'cholesterol' : dectionary['cholesterol'],
                'maxHeartRate' : dectionary['maxHeartRate'],
                'numMajorVessels' : dectionary['numMajorVessels'],
                'restEcg' : dectionary['restEcg'],
                'stDepression' : dectionary['stDepression'],
                'stSlope' : dectionary['stSlope'],
                'thal' : dectionary['thal'],
                'uId' : dectionary['uId'],
                'result':predres
                    }
            
            doc_set2 = db.collection(u'Heart').document(doc.id)
            doc_set2.set(dataReplied)
       
        
    
    


btnPredAddInFire = Button(root,text='Add Result',command=predictAndAddDataInFirebase,bg='darkblue',width=10,justify=CENTER, fg="white",font=('Times',12,'bold'))
btnPredAddInFire.place(x=920,y=560)


root.mainloop()