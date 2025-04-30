mysum      = 0
mytar      = 10000000000

# fast way : just using formula
#mysum = mytar * (1+mytar) / 2

# slow way : using loop
for i in range(mytar+1):
    mysum += i

print(mysum)

