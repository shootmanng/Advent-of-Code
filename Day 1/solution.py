#ATTEMPT 1 (PART 1)

#import requests

#data = requests.get('https://adventofcode.com/2023/day/1/input')

#print(data.text)

import numpy as np
#use numpy to import the text as a string
data = np.loadtxt('/path/to/file.txt',dtype=str)
#create array to use for checking for numbers in the string
#print(data[0][1])
num = ['0','1','2','3','4','5','6','7','8','9']
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
print(sum(answer))
#Correct
