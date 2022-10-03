num, who = input().split()
names = [input() for _ in range(int(num))]
result = 0

for name in names:
    if who in name:
        result += 1

print(result)