import math
import random

pt_count = 0
total_count = 10000

for i in range(total_count):
     px = random.random()
     py = random.random()
     r_val = math.sqrt(px**2 + py**2)
     if (r_val < 1):
         pt_count += 1

print(pt_count/total_count*4)
