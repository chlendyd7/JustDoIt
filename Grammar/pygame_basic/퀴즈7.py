
from re import I


for(int i=1; i<51; i++)
    with open(i"주차.text",  "w", encoding="utf-8")


for i in range(1, 51):
    with open(str(i)+"주차.text", "w", encoding="utf-8") as report_file:
        report_file.write(" -{0} 주차 주간 보고 -".format(i))
        report_file.write("부서 :")
        report_file.write("이름 :")
        report_file.write("업무 요약 :")