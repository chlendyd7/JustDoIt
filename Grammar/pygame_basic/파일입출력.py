# score_file = open("score.txt", "w", encoding="utf-8")
# print("수학: 0", file=score_file)
# print("영어: 50", file=score_file)
# score_file.close()

# score_file = open("score.txt","a", encoding="utf-8")
# score_file.write("과학: 80")
# score_file.write("\n코딩: 100")
# score_file.close()

# score_file = open("score.txt","r", encoding="utf-8") #read 를 뜻함 
# print(score_file.read())
# score_file.close() 전체 불러오기


# score_file = open("score.txt","r", encoding="utf-8")

# print(score_file.readline(), end="") #줄별로 읽기, 한 줄 읽고 커서는 다음 줄로 이동
# print(score_file.readline()) #줄별로 읽기, 한 줄 읽고 커서는 다음 줄로 이동
# print(score_file.readline()) #줄별로 읽기, 한 줄 읽고 커서는 다음 줄로 이동
# print(score_file.readline()) #줄별로 읽기, 한 줄 읽고 커서는 다음 줄로 이동
# score_file.close()

# score_file = open("score.txt","r", encoding="utf-8")
# while True:
#     line = score_file.readline()
#     if not line:
#         break
#     print(line, end="")
# score_file.close()

score_file = open("score.txt","r", encoding="utf-8")
lines = score_file.readlines()
for line in lines:
    print(line, end="")
score_file.close()