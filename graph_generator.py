import pandas as pd
from pymongo import MongoClient
import matplotlib.pyplot as plt

def backend():
    client = MongoClient("mongodb+srv://vikrant:vikrant@cluster0.ac8y3b6.mongodb.net/") 
    # "mongodb+srv://vikrant:vikrant@cluster0.ac8y3b6.mongodb.net/"
    db = client["SIS"]  
    collection = db["SDP"]  
    cursor = collection.find({})
    return cursor

def sdp_graphs():
    cursor=backend()
    '''Attendance Graph'''
    df = pd.DataFrame(list(cursor))
    df1=df.groupby('branch_div')['attendace'].sum()
    df1.plot(kind='bar', figsize=(10, 5), title='Branch-wise Attendance', color='pink')
    plt.savefig(r'static\sdp_attendance.png')

    '''Category Graph'''
    df1=df['category'].value_counts()
    df1.plot(kind='bar', figsize=(10, 5), title='Category Distribution',color='pink')
    plt.savefig(r'static\sdp_category.png')
    print('Done')

def act_graphs():
    cursor=backend()
    '''Attendance Graph'''
    df = pd.DataFrame(list(cursor))
    df1=df.groupby('branch_div')['attendace'].sum()
    df1.plot(kind='bar', figsize=(10, 5), title='Branch-wise Attendance', color='blue')
    plt.savefig(r'static\act_attendance.png')

    '''Category Graph'''
    df1=df['category'].value_counts()
    df1.plot(kind='bar', figsize=(10, 5), title='Category Distribution',color='blue')
    plt.savefig(r'static\act_category.png')
    print('Done')

backend()
if __name__ == '__main__':
    sdp_graphs()
    act_graphs()