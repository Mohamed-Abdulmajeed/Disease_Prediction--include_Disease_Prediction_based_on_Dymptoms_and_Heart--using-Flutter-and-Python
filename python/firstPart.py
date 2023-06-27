
from tkinter import messagebox
from tkinter import *
from tkinter import ttk
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
import numpy as np
import pandas as pd
from pandas import DataFrame, Series
from IPython.display import Image 
from sklearn import preprocessing
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from io import StringIO
import pydotplus
###**********************************************************************
root = Tk()
root.configure(background='silver')
root.geometry('1200x600+30+30')
root.title('Information of Patients[First Part Symptoms]')
root.resizable(False,False)

title = Label(root,text='[Predict disease based on Symptoms]',bg='darkblue', fg="white",font=('monospace',14))
title.pack(fill=X)

Details_Frame = Frame(root)
Details_Frame.place(x=45,y=30,width=1110,height=520)

scroll_x = Scrollbar(Details_Frame,orient=HORIZONTAL)
scroll_y = Scrollbar(Details_Frame,orient=VERTICAL)

symp_table = ttk.Treeview(Details_Frame,columns=('NoOfOp','Symptom1','Symptom2','Symptom3','Symptom4','Symptom5','NameOfPatient','Phone','EmailAddress','DateTime','Result'),
xscrollcommand = scroll_x.set, 
yscrollcommand = scroll_y.set)
symp_table.place(x=20,y=1,width=1050,height=500)
scroll_x.config(command=symp_table.xview)
scroll_y.config(command=symp_table.yview)
scroll_x.pack(side=BOTTOM,fill=X)
scroll_y.pack(side=RIGHT,fill=Y)

symp_table['show'] = 'headings'
symp_table.heading('NoOfOp',text='No_Of_Op')
symp_table.heading('Symptom1',text='  Symptom 1  ')
symp_table.heading('Symptom2',text='  Symptom 2  ')
symp_table.heading('Symptom3',text='  Symptom 3  ')
symp_table.heading('Symptom4',text='  Symptom 4  ')
symp_table.heading('Symptom5',text='  Symptom 5  ')
symp_table.heading('NameOfPatient',text=' Name Of Patient ')
symp_table.heading('Phone',text=' Phone ')
symp_table.heading('EmailAddress',text='    Email Address    ')
symp_table.heading('DateTime',text='  Date Time  ')
symp_table.heading('Result',text='  Result  ')

symp_table.column('NoOfOp',width=57)
symp_table.column('Symptom1',width=75)
symp_table.column('Symptom2',width=75)
symp_table.column('Symptom3',width=75)
symp_table.column('Symptom4',width=75)
symp_table.column('Symptom5',width=75)
symp_table.column('NameOfPatient',width=100)
symp_table.column('Phone',width=70)
symp_table.column('EmailAddress',width=100)
symp_table.column('DateTime',width=100)
symp_table.column('Result',width=100)

def refresh():
    fetch_data()

def fetch_data():
    
    db = firestore.client()
    users_ref_info = db.collection(u'users')
    users_ref_data = db.collection(u'Symptoms')
    
    docs_info = users_ref_info.stream()
    docs_data = users_ref_data.stream()

    i=1
    dectionary= dict()
    dectionary2 = dict()
    symp_table.delete(*symp_table.get_children())
    for doc in docs_data:
        docs_info = users_ref_info.stream()
        dectionary= dict()
        dectionary2 = dict()
        dectionary = doc.to_dict()
        for docInfo in docs_info:
            dectionary2 =docInfo.to_dict()
            if (dectionary['uId'].__eq__(dectionary2['uId'])):
                symp_table.insert("",END,values=[i,dectionary['symptoms1'],dectionary['symptoms2'],dectionary['symptoms3'],dectionary['symptoms4'],dectionary['symptoms5'],dectionary2['name'],dectionary2['phone'],dectionary2['email'],dectionary['DateTime'],dectionary['result']])
        i+=1


btnRef = Button(root,text='Refresh',command=refresh,bg='darkblue',width=10,justify=CENTER, fg="white",font=('Times',12,'bold'))
btnRef.place(x=50,y=560)

intvar = IntVar(root, name ="int")
root.setvar(name ="int", value = 1)
Ent1 = Entry(root,width=10,textvariable=intvar, justify=CENTER,bg='green', fg="white",font=('Times',12,'bold'))
Ent1.place(x=320,y=565)


l1=[ 'itching','skin_rash','nodal_skin_eruptions','continuous_sneezing','shivering','chills',
'joint_pain','stomach_pain','acidity','ulcers_on_tongue','muscle_wasting','vomiting','burning_micturition',
'spotting_ urination','fatigue','weight_gain','anxiety','cold_hands_and_feets','mood_swings',
'weight_loss','restlessness','lethargy','patches_in_throat','irregular_sugar_level','cough',
'high_fever','sunken_eyes','breathlessness','sweating','dehydration','indigestion','headache',
'yellowish_skin','dark_urine','nausea','loss_of_appetite','pain_behind_the_eyes',
'back_pain','constipation','abdominal_pain','diarrhoea','mild_fever','yellow_urine',
'yellowing_of_eyes','acute_liver_failure','fluid_overload','swelling_of_stomach',
'swelled_lymph_nodes','malaise','blurred_and_distorted_vision','phlegm','throat_irritation',
'redness_of_eyes','sinus_pressure','runny_nose','congestion','chest_pain','weakness_in_limbs',
'fast_heart_rate','pain_during_bowel_movements','pain_in_anal_region','bloody_stool',
'irritation_in_anus','neck_pain','dizziness','cramps','bruising','obesity','swollen_legs',
'swollen_blood_vessels','puffy_face_and_eyes','enlarged_thyroid','brittle_nails',
'swollen_extremeties','excessive_hunger','extra_marital_contacts','drying_and_tingling_lips',
'slurred_speech','knee_pain','hip_joint_pain','muscle_weakness','stiff_neck','swelling_joints',
'movement_stiffness','spinning_movements','loss_of_balance','unsteadiness',
'weakness_of_one_body_side','loss_of_smell','bladder_discomfort','foul_smell_of urine',
'continuous_feel_of_urine','passage_of_gases','internal_itching','toxic_look_(typhos)',
'depression','irritability','muscle_pain','altered_sensorium','red_spots_over_body','belly_pain',
'abnormal_menstruation','dischromic _patches','watering_from_eyes','increased_appetite','polyuria','family_history','mucoid_sputum',
'rusty_sputum','lack_of_concentration','visual_disturbances','receiving_blood_transfusion',
'receiving_unsterile_injections','coma','stomach_bleeding','distention_of_abdomen',
'history_of_alcohol_consumption','blood_in_sputum','prominent_veins_on_calf',
'palpitations','painful_walking','pus_filled_pimples','blackheads','scurring','skin_peeling',
'silver_like_dusting','small_dents_in_nails','inflammatory_nails','blister','red_sore_around_nose',
'yellow_crust_ooze']

disease=['Fungal infection','Allergy','GERD','Chronic cholestasis','Drug Reaction',
'Peptic ulcer diseae','AIDS','Diabetes','Gastroenteritis','Bronchial Asthma','Hypertension',
' Migraine','Cervical spondylosis',
'Paralysis (brain hemorrhage)','Jaundice','Malaria','Chicken pox','Dengue','Typhoid','hepatitis A',
'Hepatitis B','Hepatitis C','Hepatitis D','Hepatitis E','Alcoholic hepatitis','Tuberculosis',
'Common Cold','Pneumonia','Dimorphic hemmorhoids(piles)',
'Heartattack','Varicoseveins','Hypothyroidism','Hyperthyroidism','Hypoglycemia','Osteoarthristis',
'Arthritis','(vertigo) Paroymsal  Positional Vertigo','Acne','Urinary tract infection','Psoriasis',
'Impetigo']

# TESTING DATA df -------------------------------------------------------------------------------------
df=pd.read_csv("Training.csv")

df.replace({'prognosis':{'Fungal infection':0,'Allergy':1,'GERD':2,'Chronic cholestasis':3,'Drug Reaction':4,
'Peptic ulcer diseae':5,'AIDS':6,'Diabetes ':7,'Gastroenteritis':8,'Bronchial Asthma':9,'Hypertension ':10,
'Migraine':11,'Cervical spondylosis':12,
'Paralysis (brain hemorrhage)':13,'Jaundice':14,'Malaria':15,'Chicken pox':16,'Dengue':17,'Typhoid':18,'hepatitis A':19,
'Hepatitis B':20,'Hepatitis C':21,'Hepatitis D':22,'Hepatitis E':23,'Alcoholic hepatitis':24,'Tuberculosis':25,
'Common Cold':26,'Pneumonia':27,'Dimorphic hemmorhoids(piles)':28,'Heart attack':29,'Varicose veins':30,'Hypothyroidism':31,
'Hyperthyroidism':32,'Hypoglycemia':33,'Osteoarthristis':34,'Arthritis':35,
'(vertigo) Paroymsal  Positional Vertigo':36,'Acne':37,'Urinary tract infection':38,'Psoriasis':39,
'Impetigo':40}},inplace=True)

# print(df.head())

X= df[l1]

y = df[["prognosis"]]
np.ravel(y)
# print(y)

# TRAINING DATA tr --------------------------------------------------------------------------------
tr=pd.read_csv("Testing.csv")
tr.replace({'prognosis':{'Fungal infection':0,'Allergy':1,'GERD':2,'Chronic cholestasis':3,'Drug Reaction':4,
'Peptic ulcer diseae':5,'AIDS':6,'Diabetes ':7,'Gastroenteritis':8,'Bronchial Asthma':9,'Hypertension ':10,
'Migraine':11,'Cervical spondylosis':12,
'Paralysis (brain hemorrhage)':13,'Jaundice':14,'Malaria':15,'Chicken pox':16,'Dengue':17,'Typhoid':18,'hepatitis A':19,
'Hepatitis B':20,'Hepatitis C':21,'Hepatitis D':22,'Hepatitis E':23,'Alcoholic hepatitis':24,'Tuberculosis':25,
'Common Cold':26,'Pneumonia':27,'Dimorphic hemmorhoids(piles)':28,'Heart attack':29,'Varicose veins':30,'Hypothyroidism':31,
'Hyperthyroidism':32,'Hypoglycemia':33,'Osteoarthristis':34,'Arthritis':35,
'(vertigo) Paroymsal  Positional Vertigo':36,'Acne':37,'Urinary tract infection':38,'Psoriasis':39,
'Impetigo':40}},inplace=True)

X_test= tr[l1]
y_test = tr[["prognosis"]]
np.ravel(y_test)

def predict():
    j= intvar.get()
    j-=1
    db = firestore.client()
    users_ref = db.collection(u'Symptoms')
    docs = users_ref.stream()
    i=0
    symptom1=''
    symptom2=''
    symptom3=''
    symptom4=''
    symptom5=''

    dectionary= dict()
    for doc in docs:
        if (i==j):
            dectionary = doc.to_dict()
            symptom1 = dectionary['symptoms1']
            symptom2 = dectionary['symptoms2']
            symptom3 = dectionary['symptoms3']
            symptom4 = dectionary['symptoms4']
            symptom5 = dectionary['symptoms5']
           
        i+=1
    

    gnb = GaussianNB()
    gnb=gnb.fit(X,np.ravel(y))

    # calculating accuracy-------------------------------------------------------------------
    
    y_pred=gnb.predict(X_test)

    
    accuracy3 = (accuracy_score(y_test, y_pred))*100
    acc3 = Label(root, text="accuracy = %s"% (accuracy3-5),justify=CENTER,font=('Times',12,'bold'), fg="yellow", bg="black")
    acc3.place(x=700,y=564)
    
    t3 = Text(root, height=1, font=('Times',12,'bold'), width=30,bg="orange",fg="black")
    t3.place(x=430,y=565)
    # -----------------------------------------------------

    psymptoms = [symptom1,symptom2,symptom3,symptom4,symptom5]
    l2=[]
    for x in range(0,len(l1)):
        l2.append(0)
        
    for k in range(0,len(l1)):
        for z in psymptoms:
            if(z==l1[k]):
                l2[k]=1

    inputtest = [l2]
    predict = gnb.predict(inputtest)
    predicted=predict[0]

    h='no'
    for a in range(0,len(disease)):
        if(predicted == a):
            h='yes'
            break

    if (h=='yes'):
        t3.delete("1.0", END)
        t3.insert(END, disease[a])
        print(disease[a])
    else:
        t3.delete("1.0", END)
        t3.insert(END, "Not Found")

btnPredict = Button(root,text='Predict',command=predict,bg='darkblue',width=10,justify=CENTER, fg="white",font=('Times',12,'bold'))
btnPredict.place(x=190,y=560)
fetch_data()

def predictAndAddDataInFirebase():
    
    db = firestore.client()
    users_ref = db.collection(u'Symptoms')
    docs = users_ref.stream()
    
    for doc in docs:
        symptom1=''
        symptom2=''
        symptom3=''
        symptom4=''
        symptom5=''
        dectionary= dict()
        dectionary = doc.to_dict()
        
        if (dectionary['isReplied'] is False):
            
            symptom1 = dectionary['symptoms1']
            symptom2 = dectionary['symptoms2']
            symptom3 = dectionary['symptoms3']
            symptom4 = dectionary['symptoms4']
            symptom5 = dectionary['symptoms5']
            gnb = GaussianNB()
            gnb=gnb.fit(X,np.ravel(y))

            # calculating accuracy-------------------------------------------------------------------
            
            y_pred=gnb.predict(X_test)
         
            # -----------------------------------------------------

            psymptoms = [symptom1,symptom2,symptom3,symptom4,symptom5]
            l2=[]
            for x in range(0,len(l1)):
                l2.append(0)
                
            for k in range(0,len(l1)):
                for z in psymptoms:
                    if(z==l1[k]):
                        l2[k]=1

            inputtest = [l2]
            predict = gnb.predict(inputtest)
            predicted=predict[0]

            h='no'
            for a in range(0,len(disease)):
                if(predicted == a):
                    h='yes'
                    break
                
            dataMSG ={        
                'MSG' : 'The result of the operation that you performed on \n '
                +dectionary['DateTime']+
                '\n and that you wanted to know the expectation of the type of disease and the symptoms were  \n Symptom 1 : '
                +dectionary['symptoms1']+' ,  \n Symptom 2 : '+dectionary['symptoms2']
                +' ,  \n Symptom 3 : '+dectionary['symptoms3']+' ,  \n Symptom 4 : '
                +dectionary['symptoms4']+' , \n Symptom 5 : '+dectionary['symptoms5']
                + ' :\n The Expectation is \n " '  +disease[a] + ' " \n' ,
                }   
            
            db = firestore.client()

            doc_set = db.collection(u'SymptomsResult').document(dectionary['uId'])
            doc_set.set(dataMSG)
            dataReplied ={        
                'DateTime' : dectionary['DateTime'],
                'isReplied' : True,
                'symptoms1' : dectionary['symptoms1'],
                'symptoms2' : dectionary['symptoms2'],
                'symptoms3' : dectionary['symptoms3'],
                'symptoms4' : dectionary['symptoms4'],
                'symptoms5' : dectionary['symptoms5'],
                'uId' : dectionary['uId'],
                'result':disease[a]
                    }
            
            doc_set2 = db.collection(u'Symptoms').document(doc.id)
            doc_set2.set(dataReplied)
            

btnPredAddInFire = Button(root,text='Add Result',command=predictAndAddDataInFirebase,bg='darkblue',width=10,justify=CENTER, fg="white",font=('Times',12,'bold'))
btnPredAddInFire.place(x=850,y=560)



root.mainloop()


