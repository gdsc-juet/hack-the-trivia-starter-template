import pygame
import random
import sys
from gui import *

import pygame.font

pygame.font.init()
pygame.init()

width, height = 1200, 950
size = width, height
screen = pygame.display.set_mode(size)
symbols = {0: 'data/symbol0.png', 1: 'data/symbol1.png', 2: 'data/symbol2.png', 3: 'data/symbol3.png',
           4: 'data/symbol4.png', 5: 'data/symbol5.png', 6: 'data/symbol6.png', 7: 'data/symbol7.png',
           8: 'data/symbol8.png', 9: 'data/symbol9.png', 10: 'data/symbol10.png', 11: 'data/symbol11.png',
           12: 'data/symbol12.png', 13: 'data/symbol13.png', 14: 'data/symbol14.png', 15: 'data/symbol15.png',
           16: 'data/symbol16.png', 17: 'data/symbol17.png'}  # convert board values to images
           

numbers_to_letters = {-1: 'X', 0: '*', 1: '/', 2: 'F', 3: 'm', 4: 'g', 5: 'I', 6: 'U', 7: 'S', 8: 't', 9: 'v', 10: 'a',
                      11: 'V', 12: 'p', 13: 'h', 14: 'N', 15: 'R', 16: 'q', 17: 'A'}  # convert board values to letters

formulae = {'m*g': 'F', 'U/I': 'R', 'U/R': 'I', 'I*R': 'U', 'q/t':'I', 'I*t':'q', 'q/I':'t', 'A/q':'U', 'U*q':'A',
            'A/U': 'q', 'A/t': 'N', 'S/v': 't', 'S/t': 'v', 'v*t': 'S', 'v/t': 'a', 'a*t': 'v(x)', 'g*t': 'v(y)',
            'p*V': 'm', 'm/V': 'p', 'm/p': 'V', 'm*a': 'F', 'm*v': 'p', 'q*m': 'Q', 'F/S': 'P', 'F/m': 'a', 'F/a': 'm',
            'F*t': 'p', 'F*S': 'A', 'A/F': 'S', 'A/S': 'F', 'N*t': 'A', 'A/N': 't', 'p*g*h': 'P', 'p*g*V': 'Fa',
            'm*g*h': 'Eп', 'I*U*t': 'Q'}  # formulae to be in the game, can be updated


game_sounds = {'swap': pygame.mixer.Sound('data/swap.wav'), 'match': [pygame.mixer.Sound('data/match1.wav'),
              pygame.mixer.Sound('data/match2.wav'), pygame.mixer.Sound('data/match3.wav'),
              pygame.mixer.Sound('data/match4.wav'), pygame.mixer.Sound('data/match5.wav')]}
# sounds to be played after an action

class LangButton(pygame.sprite.Sprite):  #for changing language
    def __init__(self, group, x, y):
        super().__init__(group)
        self.image = pygame.image.load('data/eng.png')  
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.pressed = False

    def update(self):
        if self.pressed:
            self.image = pygame.image.load('data/india.png')
        else:
            self.image = pygame.image.load('data/eng.png')

    def get_event(self, event):
        if self.rect.collidepoint(event.pos):
            self.pressed = not self.pressed
        if self.pressed:
            eng_to_hindi()
        else:
            hindi_to_eng()


class Arrow(pygame.sprite.Sprite): # customizing the cursor for a fun experience
    def __init__(self, group):
        super().__init__(group)
        self.image = pygame.image.load('data/cursor.png')
        self.rect = self.image.get_rect()

    def update(self):
        if pygame.mouse.get_focused():
            self.rect.x, self.rect.y = pygame.mouse.get_pos()


class Board:
    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.board = [[-1 for _ in range(width)] for _ in range(height)]  # -1 is an empty cell
        self.left = 100
        self.top = 40
        self.cell_size = 64


class MainBoard(Board):
    def __init__(self, width, height):
        super().__init__(width, height)
        self.pressed = ()
        self.score = 0
        self.swaps = -1  # the first swap doesn't take off points
        self.collected = []  # list of collected formulae
        self.frequencies = {}  # dict of frequencies
        self.font = pygame.font.Font(None, 40)
        self.score_text = None
        self.timer_text = None
        self.timer = 0 
        self.dt = 0 
        self.clock = None  

        for i in range(25):  # 25 multiplications
            x, y = self.random_coords()
            while self.board[y][x] != -1:  # to avoid repetition
                x, y = self.random_coords()
            self.board[y][x] = 0

        for i in range(15):  # 15 divisions
            x, y = self.random_coords()
            while self.board[y][x] != -1:  # to avoid repetition
                x, y = self.random_coords()
            self.board[y][x] = 1

        for y in range(self.height):
            for x in range(self.width):
                if self.board[y][x] == -1:
                    self.board[y][x] = random.randint(2, len(symbols) - 1)  # random value from the list

        self.board = self.pre_check_matches()  # check for matches

    def random_coords(self):
        return random.randint(0, self.width - 1), random.randint(0, self.height - 1)

    def get_cell(self, mouse_pos):
        cell_x = (mouse_pos[0] - self.left) // self.cell_size
        if cell_x < 0 or cell_x > self.width - 1:
            return None
        cell_y = (mouse_pos[1] - self.top) // self.cell_size
        if cell_y < 0 or cell_y > self.height - 1:
            return None
        return cell_x, cell_y

    def get_click(self, mouse_pos):
        cell = self.get_cell(mouse_pos)
        if cell:
            self.on_click(cell)

    def pre_check_matches(self):  # eliminating all matches before starting
        rotated_board = list(map(list, zip(*self.board)))
        for y in range(len(self.board)):
            sy = ''.join([numbers_to_letters[x] for x in self.board[y]])  # rows
            sx = ''.join([numbers_to_letters[x] for x in rotated_board[y]])  # columns
            for formula in formulae.keys():
                if formula in sx:
                    #  if match found, replace the first item with multiplication or division sign
                    self.board[sx.find(formula)][y] = random.randint(0, 1)

                elif formula in sy:
                    # the same, but horizontally
                    self.board[y][sy.find(formula)] = random.randint(0, 1)

        return self.board

    def shift_tiles_down(self):
        board = list(map(list, zip(*self.board)))  # zipping the board to iterate its columns
        for y in range(len(board)):
            if -1 in board[y]:
                # shifting
                board[y] = [-1] * board[y].count(-1) + board[y][:board[y].index(-1)] + \
                           board[y][board[y].index(-1) + board[y].count(-1):]
                for i in range(board[y].count(-1)):
                    board[y][i] = random.randint(0, len(symbols) - 1)  # refilling
        board = list(map(list, zip(*board)))  # zip the board back
        return board

    def mainloop(self):
        rotated_board = list(map(list, zip(*self.board)))  # zipping the board to iterate its columns
        for y in range(self.height):
            sy = ''.join([numbers_to_letters[x] for x in self.board[y]])  # rows
            sx = ''.join([numbers_to_letters[x] for x in rotated_board[y]])  # columns
            for formula in formulae.keys():  # finding vertical matches
                if formula in sx:
                    sound_index = random.randint(0, 4)
                    game_sounds['match'][sound_index].play()
                    self.collected.append(formula)
                    self.frequencies[formula] = self.frequencies.get(formula, 0) + 1
                    self.score += 10 * len(formula)
                    self.timer += 5
                    self.swaps = -1
                    for i in range(len(formula)):
                        self.board[sx.find(formula) + i][y] = -1

                elif formula in sy:
                    sound_index = random.randint(0, 4)
                    game_sounds['match'][sound_index].play()
                    self.collected.append(formula)
                    self.frequencies[formula] = self.frequencies.get(formula, 0) + 1
                    self.score += 10 * len(formula)
                    self.timer += 5
                    self.swaps = -1 
                    for i in range(len(formula)):
                        self.board[y][sy.find(formula) + i] = -1

            for x in range(self.width):
                if self.board[y][x] != -1:  # blitting the picture
                    img = pygame.image.load(symbols[self.board[y][x]])
                    screen.blit(img, (x * self.cell_size + self.left, y * self.cell_size + self.top))

                pygame.draw.rect(screen, pygame.Color('white'),  # drawing cells
                                 (x * self.cell_size + self.left, y * self.cell_size + self.top, self.cell_size,
                                  self.cell_size), 1)

        if self.pressed:  # framing of the pressed cell
            pygame.draw.rect(screen, pygame.Color(252, 103, 54),
                             (self.pressed[0] * self.cell_size + self.left, self.pressed[1] * self.cell_size + self.top,
                              self.cell_size, self.cell_size), 3)

        #  rectangle with collected formulae displayed
        pygame.draw.rect(screen, pygame.Color(252, 103, 54), (900, 168, 250, 640), 3)
        for i in range(len(list(reversed(self.collected[-10:])))):
            screen.blit(pygame.font.Font(None, 80).render('%s = %s' % (list(reversed(self.collected[-10:]))[i],
                       formulae[list(reversed(self.collected[-10:]))[i]]), 1, pygame.Color(12, 45, 87)), (920, 170 + 64*i))

        # changing language during the game
        if lang.pressed:
            self.score_text = self.font.render('अंक: %d' % self.score, 1, pygame.Color(12, 45, 87))
            self.timer_text = self.font.render('समय: %d' % self.timer, 1, pygame.Color(12, 45, 87))
        else:
            self.score_text = self.font.render('Score: %d' % self.score, 1, pygame.Color(12, 45, 87))
            self.timer_text = self.font.render('Time: %d' % self.timer, 1, pygame.Color(12, 45, 87))
        screen.blit(self.score_text, (900, 55))
        screen.blit(self.timer_text, (900, 119))

        self.board = self.shift_tiles_down()  # shifting the tiles

        # time management
        if self.timer - self.dt > 0:
            self.timer -= self.dt
        else:
            self.pressed = ()  # when time's left, everything's unpressed
            game_over()

        self.dt = self.clock.tick(1000) / 1000

    def on_click(self, cell):
        if cell == self.pressed:
            self.pressed = ()  # second pressing makes the cell inactive
        else:
            if self.pressed:
                # swapping
                self.swaps += 1
                if self.score - self.swaps > 0:
                    self.score -= self.swaps
                else:
                    self.score = 0
                if abs(cell[0] - self.pressed[0]) <= 1 and abs(cell[1] - self.pressed[1]) <= 1 \
                        and (abs(cell[0] - self.pressed[0]) == 0 or abs(cell[1] - self.pressed[1]) == 0):
                    game_sounds['swap'].play()
                    self.board[self.pressed[1]][self.pressed[0]], self.board[cell[1]][cell[0]] = self.board[cell[1]][cell[0]], self.board[self.pressed[1]][self.pressed[0]]
                    self.pressed = ()  # cell is inactive
                else:
                    self.pressed = ()  # cell is inactive after swapping
            else:
                self.pressed = cell  # cell is active


def eng_to_hindi():  # transferring all gui items from english to hindi
    global logo, play, rules, exit, back, fail, try_again, info  # global is unwanted, but compelled here
    logo = Label((100, 100, 1000, 750), 'Physimatch के साथ आसानी से भौतिकी फ़ॉर्म्यूले याद करें!', background_color=pygame.Color('white'),
                 font_size=50, x=260, y=200)
    play = Button((530, 450, 140, 50), 'खेलें', background_color=pygame.Color('lightpink'))
    rules = Button((530, 520, 140, 50), 'नियम', background_color=pygame.Color('lightpink'))
    exit = Button((530, 590, 140, 50), 'बाहर निकलें ', background_color=pygame.Color('lightpink'))
    back = Button((20, 875, 110, 50), 'पीछे जाएं', background_color=pygame.Color('lightpink'))
    fail = Label((100, 100, 1000, 750), ' गेम खत्म', background_color=pygame.Color('white'), font_size=100,
                 x=345, y=150)
    try_again = Button((440, 450, 315, 50), 'पुनः प्रयास करें', background_color=pygame.Color('lightpink'))
    info = Label((100, 100, 1000, 750),
                 '\nPhysimatch भौतिकी सूत्रों को याद करने में मदद करने के लिए डिज़ाइन किया गया है। \nअपने भौतिकी कोर्स से किसी विशिष्ट सूत्र को याद करने में समस्या का सामना कर रहे हैं? लैटिन और ग्रीक अक्षरों के साथ, साथ ही गणितीय प्रतीकों का उपयोग करके सूत्र बनाएं और अपने स्कोर को बढ़ाएं! प्रत्येक सूत्र आपको (उसकी लंबाई * 10) अंक प्राप्त कराता है और अतिरिक्त 5 सेकंड का खेल समय प्रदान करता है। \nहालांकि, हर आगामी स्वाइप के साथ, अंक धीरे-धीरे कम होते जाते हैं। \nमजा करें!',
                 background_color=pygame.Color('white'), font_size=40)


def hindi_to_eng():  # transferring all gui items from hindi to english
    global logo, play, rules, exit, back, fail, try_again, info  # global is unwanted, but compelled here
    logo = Label((100, 100, 1000, 750), 'Memorize physics formulae easily, with Physimatch!', background_color=pygame.Color('white'),
                 font_size=50, x=250, y=200)
    play = Button((550, 450, 100, 50), 'Play', background_color=pygame.Color('lightpink'))
    rules = Button((550, 520, 100, 50), 'Rule', background_color=pygame.Color('lightpink'))
    exit = Button((550, 590, 100, 50), 'Exit', background_color=pygame.Color('lightpink'))
    back = Button((20, 875, 100, 50), 'Back', background_color=pygame.Color('lightpink'))
    fail = Label((100, 100, 1000, 750), 'Game Over', background_color=pygame.Color('white'), font_size=100,
                 x=410,
                 y=150)
    try_again = Button((525, 450, 150, 50), 'Retry', background_color=pygame.Color('lightpink'))
    info = Label((100, 100, 1000, 750), '\nPhysimatch is designed to aid in memorizing physics formulae. \nStruggling to recall specific formulae from your physics course? \nConstruct formulae using Latin and Greek letters, along with mathematical symbols, to enhance your score! \nEach formula earns you (10 * its length) points and provides an extra 5 seconds of playtime. \nHowever, with each subsequent swipe, points are deducted incrementally. \nHave fun!',
                 background_color=pygame.Color('white'), font_size=40)


def get_best_score():  # acquiring the best score from the file
    with open('best_score.txt', 'r') as score_list:
        return int(score_list.read().strip())


def rewrite_best_score(score):  # rewriting the best score
    with open('best_score.txt', 'w') as score_list:
        score_list.write(str(score))


def terminate():
    pygame.quit()
    sys.exit()
    

def description():  # 'rules' menu
    gui.clear()
    gui.add_element(info)
    gui.add_element(back)

    while True:
        screen.fill(pygame.Color('lightpink'))
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                terminate()
            if event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
                lang.get_event(event)
                gui.clear()
                gui.add_element(info)
                gui.add_element(back)

            gui.get_event(event)

        if back.pressed:
            back.pressed = False
            main()

        gui.render(screen)
        all_sprites.draw(screen)
        all_sprites.update()
        pygame.display.flip()


def game():  # game process
    gui.clear()
    gui.add_element(back)
    board.timer = 40
    board.clock = pygame.time.Clock()  

    while True:
        screen.fill(pygame.Color('lightpink'))
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                terminate()
            if event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
                board.get_click(event.pos)
                lang.get_event(event)
                gui.clear()
                gui.add_element(back)

            gui.get_event(event)

        if back.pressed:
            back.pressed = False
            board.__init__(12, 12)  # new board construction
            main()

        gui.render(screen)
        board.mainloop()
        all_sprites.draw(screen)
        all_sprites.update()
        pygame.display.flip()


def game_over():  # 'game over' screen
    gui.clear()
    gui.add_element(fail)
    gui.add_element(try_again)
    gui.add_element(exit)
    best_score = get_best_score()
    if board.score > best_score:
        rewrite_best_score(board.score)
        best_score = board.score
    if lang.pressed:
        gui.add_element(Label((100, 200, 200, 50), 'आपका स्कोर: %d' % board.score, background_color=-1, x=500, y=250))
        gui.add_element(Label((100, 200, 200, 50), 'सर्वश्रेष्ठ स्कोर: %d' % best_score, background_color=-1,
                              x=480 - len(str(best_score)), y=315))
    else:
        gui.add_element(Label((100, 200, 200, 50), 'Your Score: %d' % board.score, background_color=-1, x=500, y=250))
        gui.add_element(Label((100, 200, 200, 50), 'Best Score: %d' % best_score, background_color=-1,
                              x=500 - len(str(best_score)), y=315))

    while True:
        screen.fill(pygame.Color('lightpink'))
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                terminate()
            if event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
                lang.get_event(event)
                gui.clear()
                gui.add_element(fail)
                gui.add_element(try_again)
                gui.add_element(exit)
                if lang.pressed:
                    gui.add_element(
                        Label((100, 200, 200, 50), 'आपका स्कोर: %d' % board.score, background_color=-1, x=500, y=250))
                    gui.add_element(Label((100, 200, 200, 50), 'सर्वश्रेष्ठ स्कोर: %d' % best_score, background_color=-1,
                                          x=480 - len(str(best_score)), y=315))
                else:
                    gui.add_element(
                        Label((100, 200, 200, 50), 'Your Score: %d' % board.score, background_color=-1, x=500, y=250))
                    gui.add_element(Label((100, 200, 200, 50), 'Best Score: %d' % best_score, background_color=-1,
                                          x=500 - len(str(best_score)), y=315))

            gui.get_event(event)

        if try_again.pressed:
            try_again.pressed = False
            board.__init__(12, 12)  # new board construction
            game()
        elif back.pressed:
            back.pressed = False
            board.__init__(12, 12)
            main()
        elif exit.pressed:
            terminate()

        gui.render(screen)
        all_sprites.draw(screen)
        all_sprites.update()
        pygame.display.flip()


def main():  # main menu
    if lang.pressed:
        eng_to_hindi()
    else:
        hindi_to_eng()

    gui.clear()
    gui.add_element(logo)
    gui.add_element(play)
    gui.add_element(rules)
    gui.add_element(exit)

    while True:
        screen.fill(pygame.Color('lightpink'))
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                terminate()
            if event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
                lang.get_event(event)
                gui.clear()
                gui.add_element(logo)
                gui.add_element(play)
                gui.add_element(rules)
                gui.add_element(exit)

            gui.get_event(event)

        if play.pressed:
            play.pressed = False
            game()
        elif rules.pressed:
            rules.pressed = False
            description()
        elif exit.pressed:
            terminate()

        gui.render(screen)
        all_sprites.draw(screen)
        all_sprites.update()
        all_sprites.move_to_front(arrow)
        pygame.display.flip()


board = MainBoard(12, 12)

all_sprites = pygame.sprite.LayeredUpdates()
lang = LangButton(all_sprites, 1050, 10)
arrow = Arrow(all_sprites)
gui = GUI()
pygame.mouse.set_visible(False)

if __name__ == "__main__":
    main()
