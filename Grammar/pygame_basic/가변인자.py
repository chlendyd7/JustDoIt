def profile(name, age, *language):
    print("이름: {0}\t 나이: {1}\t".format(name,age), end=" ")
    for lang in language:
        print(lang)
    print()


profile("유재석", 20, "Python", "Java", "C", "C++", "C#")
profile("김태호", 25, "kotlin", "Swift")