t = int(input())   # 시험의 개수
for i in range(t):
    n = int(input())   # 응시 인원 수
    score_list = list(map(int,input().split()))   # 시험 성적
    result = []
    for j in range(len(score_list)):
        if(score_list[j] >= sum(score_list)/len(score_list)):
            result.append(score_list)
    print("%d/%d" %(len(result),len(score_list))) # 합격자수/응시자수
