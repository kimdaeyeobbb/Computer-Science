coordinates = list(map(int,input().split()))
result1 = abs(coordinates[2] - coordinates[0]) + abs(coordinates[3] - coordinates[1])
result2 = 0
for i in range(len(coordinates)):
    for j in range(i+1,len(coordinates)):
        result2 += abs(coordinates[i] - coordinates[j])
        result2 += abs(coordinates[i+1] - coordinates[j+1])
        if result2 > result1:
            result1 = result2

print(result1)
print(result2)