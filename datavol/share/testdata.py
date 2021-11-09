from struct import pack, unpack, calcsize

#mydata = [(1, 2, 1023), (2, 3, 80), (3, 4, 4000)]
mytuple= tuple(range(10))
mydata=[mytuple]
myfile = open('data1.data', 'wb')

for item in mydata:
    result = pack('llllllllll', item[0], item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8], item[9])
    myfile.write(result)

myfile.close()

from numpy import *
 
na = array([]) 
#array([1, 10, 100,101,102,3.14,104,8192,65536,99.999])
for loop in range(100):
    na=append(na,array([loop, 10, 100,101,102,3.14,104,8192,65536,99.999]))

# 書き込み
na.tofile('data2.data')
