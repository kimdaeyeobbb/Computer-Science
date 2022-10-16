n,k = map(int,input().split())  # 사람 수, 찾아야 하는 수
rollbook = []
for idx in range(n):
    s,t = input().split()   # 이름, 키
    rollbook.append((s,round(float(t),3)))

print(rollbook)
rollbook.sort(key = lambda x: (x[0],-x[1]))
print(*rollbook[k-1])