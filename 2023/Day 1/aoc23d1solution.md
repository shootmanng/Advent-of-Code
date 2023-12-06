+++
title = "Advent of Code 2023: Day 1"
author = "Scott Hootman-Ng"
date = "2023-12-04"
description = "Solution to day 1 of the Advent of Code challenge."
tags = [
    "Python",
    "AdventOfCode2023",
]
categories = [
    "coding",
    "problem solving",
]
series = ["Advent of Code 2023"]
+++

# Background
This post will be the beginning of a series aimed at solving the puzzles from [Advent of Code 2023](https://adventofcode.com/). I have been hearing murmurs of this challenge for a couple of years, and it has been appearing more and more on my feeds, so I decided to give it a try as I'm on the job market and need more experience solving programming puzzles. Any programming language can be used for these puzzles, I will be using python going forward in these posts. For more information on the challenge check out the webpage or for brevity I'll include the following "about" prompt from the webpage:

>Advent of Code is an Advent calendar of small programming puzzles for a variety of skill sets and skill levels that can be solved in any programming language you like. People use them as interview prep, company training, university coursework, practice problems, a speed contest, or to challenge each other.
>
>You don't need a computer science background to participate - just a little programming knowledge and some problem solving skills will get you pretty far. Nor do you need a fancy computer; every problem has a solution that completes in at most 15 seconds on ten-year-old hardware.

In particular, we will be focusing on the [Day 1](https://adventofcode.com/2023/day/1) puzzle in this post.

# Coding (Python)

*Disclaimer: I'm a relative newbie with programming, and these posts will be documenting essentially everything I'm learning, including Python itself, while solving these problems. Therefore, a lot, or all, of the following will seem very rudimentary/unnecessary to more experienced readers. Further, my goal is to learn something new and solve puzzles, so my solutions will be far from optimal in terms of efficiency. If you have suggestions regarding efficiency or best practices, please feel free to email (preferable with sources) with suggestions. If you do so, please be **cordial** and **professionl**, otherwise your message will be ignored.*

## Part 1

Our first goal will be to import the test data from the given website into our program. Since the data is just a long string of plain text, let's try to naively import it.

``` python {linenos=false}
import requests
data = requests.get('https://adventofcode.com/2023/day/1/input')
print(data.text)
```

Unfortunately, like most things, it is not this easy.

```
>>> Puzzle inputs differ by user.  Please log in to get your puzzle 
```

Because the website links accounts with Github, I'm going to abandon this method and just download the html locally to my computer and import the file as a string array using [numpy](https://numpy.org/). (Note: I did find [this](https://github.com/wimglenn/advent-of-code-data) which seems to do what I originally imagined doing, but I'm not a speedhacker and I don't think it's necessary for my use case).

``` python {linenos=false}
import numpy as np
#use numpy to import the text as a string
data = np.loadtxt('/path/to/file.txt',dtype=str)
```
Now, to get to the heart of the matter. We create an array called `num` to serve as a reference to check for numbers in the given strings. Notice here that we enter the elements in `num` as string characters instead of numeric values. This is because when we eventually investigate the strings from the data, if we compare the characters to numeric values we'll never get a match, as `2=='2'` is always `False`. We also create an array `code` to store our numbers of interest in the string.


``` python {linenos=false}
num = ['0','1','2','3','4','5','6','7','8','9']
#empty array to store values
code = []
```

To extract the digits of interest, we iterate through each string in the provided data. We examine the leftmost character of each string, comparing it to our `num` array to identify the first numeric symbol. If a number is found, we store it in the `code` array for future use and move on to the next string using the break statement. If no number is found, we proceed to the next character on the right in the current string.

``` python {linenos=false}
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
```

We also need to check starting from the right going leftwards for digits. We create an index `k` to do this reverse iteration and store our digit in the same way as the previous left hand loop.

``` python {linenos=false}
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
```

At the end we create our final `answer` array to store our discovered codes by concatenating the left and right-hand numbers saved in the `code` array. Notice we do this by using the optional argument 2 in the range statement `range(-,-,2)` of the loop. This lets us iterate things by two, as our final numbers are two digits, so we want to concatenate by groups of two. Lastly, we add together all the entries of `answer`  and get our solution.

``` python {linenos=false}
#array to store numbers
answer = []
#concatenate pairs in the array and turn them into integers to be added
for i in range(0,len(code)-1,2):
    answer.append(int(code[i]+code[i+1]))
#print sum of all values in the answer array as final answer 
print(sum(answer))
```

## Part 2
