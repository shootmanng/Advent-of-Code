#ATTEMPT 1 (PART 1)

#import requests

#data = requests.get('https://adventofcode.com/2023/day/1/input')

#print(data.text)

import numpy as np
import re
#use numpy to import the text as a string
dataset = np.loadtxt('/home/scotthootmanng/Advent of Code/2023/Day 1/input.txt',dtype=str)
t=10
datasetTest=[0]*t
random_numbers = np.random.randint(0, 1000, 10)
#print(random_numbers)
#print(random_numbers+1)
for j in range(10):
    datasetTest[j]=dataset[random_numbers[j]].copy()
########### Part 1 ##########
#create array to use for checking for numbers in the string
#print(data[0][1])
num = ['1','2','3','4','5','6','7','8','9']
#define the code extractor as a function for later use
def coder(data,num):
    #empty array to store values
    code = []
    #loop over all elements in the input data
    for i in range(len(data)):
        for j in range(len(data[i])):
            #check if the character is in the num array starting
            #from the left
            if data[i][j] in num:
                #if it is, add it to the collection of answers
                #and go to the next item
                code.append(data[i][j])
                break
            else:
                #if not go to next character
                continue
        for j in range(len(data[i])):
            #create an index to read from right to left
            k = len(data[i])-j-1
            if data[i][k] in num:
                #check for numbers reading from the right, if there is
                #store it
                code.append(data[i][k])
                #if not go to next character
                break
            else:
                continue
    #array to store numbers
    answer = []

    #concatenate pairs in the array and turn them into integers to be added
    for i in range(0,len(code)-1,2):
        answer.append(int(code[i]+code[i+1]))
    #print sum of all values in the answer array as final answer 
    return sum(answer)
    #Correct
print('The answer to part 1 is: ',coder(dataset,num))
################ Part 2 ##########

numw = ['one','two','three','four','five','six','seven','eight','nine']
#empty array to store values

#def replacer(data,num,numw):
#    dataNew = data.copy()
#    for i in range(len(data)):
#        for j in range(len(num)):
#            if numw[j] in dataNew[i]:
#                dataNew[i]=dataNew[i].replace(numw[j],num[j])
#    return dataNew

def replacer(data,num,numw):
    dataNew = data.copy()
    for i in range(len(data)):
        k=[1000]*9
        w=['1']*9
        n=['100']*9
        for j in range(len(num)):
            if numw[j] in dataNew[i]:
                k[j]=dataNew[i].find(numw[j])
                w[j]=numw[j]
                n[j]=num[j]
               # print('occurences',dataNew[i].count(numw[j]))
        #print('places', k)      
        # print(w)
        # print(k.index(min(k)))
        # print(w[k.index(min(k))])
        # print(n[k.index(min(k))])
        l=k.index(min(k))
       # print(n[l])
        #print(k[l])
        #print(l)
        if list(np.array(k)//1000) != [1]*9:
            dataNew[i]=data[i][:k[l]]+n[l]+data[i][k[l]:]
            for x in range(len(k)):
                if k[x]==1000:
                    k[x]=-1
            #print('new',k)
            L=k.index(max(k))
            #print('l',l)
            #print('L',L)
            if l!=L:
                dataNew[i]=dataNew[i][:k[L]+1+len(w[L])]+n[L]+dataNew[i][k[L]+1+len(w[L]):]
    return dataNew

#dataNew=replacer(dataset, num, numw)
testing=['two1nine', 'eightwothree','abcone2threexyz','xtwone3four','4nineeightseven2','zoneight234','7pqrstsixteen','1gstcjk3','eightwo','five6fnrkr4','bndmmzfiveonenttqzftp3fivemchdfr','three11vkzqjzjncgj','five1five']
#print('The answer to part 2 is: ',coder(dataNew,num))
#print(replacer(testing,num,numw))
#print('original',testing)
#print(coder(replacer(['two1nine', 'eightwothree','abcone2threexyz','xtwone3four','4nineeightseven2','zoneight234','7pqrstsixteen'],num,numw),num))
step='eightwo'
u1=step.find('eight')
u2=step.find('two')

#for i in range(len(dataset)):
 #   print(dataset[i])
  #  print(dataNew[i])
   # print('----------------------')
#print(coder(datasetTest,num))
#print(coder(replacer(datasetTest,num,numw),num))
#print(datasetTest)
#print(replacer(datasetTest,num,numw))
#print(len(dataset))
#print(len(dataNew))
def dupNum(data,num,numw):
    for i in range(len(data)):
        print(i)
        k=[]
        for j in range(len(data[i])):
            if ''.join(data[i][:len(numw)])==numw:
                #print(j)
                k.append(j)
                print(k)        
        l=min(k)
        L=max(k)
        data[i]=data[i][:l]+num+data[i][l:]
        data[i]=data[i][:L+1+len(numw)]+num+data[i][L+1+len(numw):]
    return data
print(dupNum(['five1fivefive','bndmmzfiveonenttqzftp3fivemchdfr'],'5','five'))                  
    
#print(dupNum('five1five','5','five'))
#k=[]
#for i in range(len('five1fivefive')):
#    if ''.join('five1fivefive'[i:len('five')+i])=='five':
#        print(i)
#        k.append(i)
#        print(k)
#tester=['five1fivefive']
#l=min(k)
#L=max(k)
#tester[0]=tester[0][:l]+'5'+tester[0][l:]
#tester[0]=tester[0][:L+1+len('five')]+'5'+tester[0][L+1+len('five'):]
#print(tester)
