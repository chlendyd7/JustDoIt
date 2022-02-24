#
# import pickle
# with open("profile.pickle","rb") as profile_file:
#     print(pickle.load(profile_file))

# with open("study.text", "w", encoding="utf-8")as study_file:
#     study_file.write("파이썬을 열심히 공부하는 중입니다.")

with open("study.text","r", encoding="utf-8") as study_file:
    print(study_file.read())