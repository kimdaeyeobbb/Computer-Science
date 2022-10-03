coordinates = list(map(int,input().split()))
result = abs(coordinates[0] - coordinates[1]) + abs(coordinates[2] - coordinates[3])

if abs(coordinates[0] - coordinates[2]) + abs(coordinates[1] - coordinates[3]) > result:
    result = abs(coordinates[0] - coordinates[2]) + abs(coordinates[1] - coordinates[3])

if abs(coordinates[0] - coordinates[3]) + abs(coordinates[1] - coordinates[2]) > result:
    result = abs(coordinates[0] - coordinates[3]) + abs(coordinates[1] - coordinates[2])

print(result)