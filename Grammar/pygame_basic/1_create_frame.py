import pygame

pygame.init()#초기화


screen_width = 480
screnn_height = 640
screen = pygame.display.set_mode((screen_width, screnn_height))

#화면 타이틀 설정
pygame.display.set_caption("Nado Game")# 게임 이름

# 이벤트 루프
running = True #게임이 진행 중인가?
while running:
    for event in pygame.event.get():
# pygame 종료
pygame.quit() 