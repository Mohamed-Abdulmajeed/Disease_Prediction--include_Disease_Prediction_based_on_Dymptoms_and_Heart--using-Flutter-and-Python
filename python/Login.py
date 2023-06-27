from tkinter import messagebox
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import sys
import os
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

#####--------------------- Connect to Firebase--------------------------------

cred = credentials.Certificate('socialapp-f38d8-firebase-adminsdk-4bs5b-d013750818.json')
app = firebase_admin.initialize_app(cred)

######--------------- JUI Login ------------------------------
root = Tk()
root.configure(background='#fff')
root.geometry('825x450+200+100')
root.title('Login')
root.resizable(False,False)

img = PhotoImage(file = 'login.png')
Label(root,image=img,bg = 'white').place(x=30,y=40)

frame =Frame(root,width=350,height=350,bg='white')
frame.place(x=450,y=40)
heading = Label(frame,text='Sign in',fg='#57a1f8',bg='white',font=('Microsoft YaHei UI Light',23,'bold'))
heading.place(x=110,y=5)
#####----------------------------------------------
def on_enter(e):
    user.delete(0,'end')
def on_leave(e):
    name = user.get()
    if name =='':
        user.insert(0,'Username')
        
user = Entry(frame,width=25,fg='black',border=0,bg='white',font=('Microsoft YaHei UI Light',12,'bold'))
user.place(x=30,y=100)
user.insert(0, 'Username')
user.bind('<FocusIn>',on_enter)
user.bind('<FocusOut>',on_leave)

Frame(frame,width=300,height=2,bg='black').place(x=25,y=130)
#####---------------------------------------------
def on_enter(e):
    code.delete(0,'end')
def on_leave(e):
    name = code.get()
    if name =='':
        code.insert(0,'Password')
        
code = Entry(frame,width=25,fg='black',border=0,bg='white',font=('Microsoft YaHei UI Light',12,'bold'))
code.place(x=30,y=160)
code.insert(0, 'Password')
code.bind('<FocusIn>',on_enter)
code.bind('<FocusOut>',on_leave)

Frame(frame,width=300,height=2,bg='black').place(x=25,y=190)

#####--------------------------------------------

def signin():
    username = user.get()
    password = code.get()
    if username == 'admin' and password == '12345' :
        print('login success')
        
        import firstPart
        root.lower()
         
    elif username == 'admin' and password == '56789' :
        print('login success')
        import secondPart
        root.lower()
            
    elif username != 'admin' :
        messagebox.showerror('Invalid','invalid Username and Password')
        
    elif password != '12345' or password != '56789' :
        messagebox.showerror('Invalid','invalid Password')

Button(frame,width=40,pady=7,text='Sign in',border=0,bg='#57a1f8',fg='white',command=signin).place(x=35,y=215)

root.mainloop()

