def std_weight(height, gender):
    if gender == 1:
        return round(height * height*22/10000, 2)
    else:
        return height * height *21

man = std_weight(181, 1)
woman = std_weight(168, 2)

print("키: {0}cm 남자의 표준 체중은 {1} 입니다.".format(175, std_weight(175,1)))



