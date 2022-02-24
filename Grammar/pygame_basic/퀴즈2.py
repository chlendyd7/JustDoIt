from random import*

lst=[1,2,3,4,5]
shuffle(lst)
user= sample(lst,4)
print("치킨 당첨자: {0}\n".format(user[0]))
print("커피 당첨자: {0}".format(user[1:4]))