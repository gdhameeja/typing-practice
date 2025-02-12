import os
import random
import curses
import time
import re
from typing import List, Set, Tuple

class GoWordExtractor:
    def __init__(self, project_path: str):
        self.project_path = project_path
        self.words: Set[str] = set()

    def extract_identifiers(self, content: str) -> None:
        """Extract identifiers from Go code using regex patterns."""
        # Match function declarations
        func_pattern = r'func\s+([A-Za-z0-9]+)'
        # Match type declarations (struct, interface)
        type_pattern = r'type\s+([A-Za-z0-9]+)'
        # Match variable declarations
        var_pattern = r'var\s+([A-Za-z0-9]+)'
        # Match constant declarations
        const_pattern = r'const\s+([A-Za-z0-9]+)'
        # Match method receivers
        method_pattern = r'func\s+\([a-zA-Z]+\s+\*?([A-Za-z0-9]+)\)'
        # Match struct field names
        field_pattern = r'^\s*([A-Za-z0-9]+)\s+[A-Za-z0-9\[\]\*]+'

        patterns = [func_pattern, type_pattern, var_pattern,
                   const_pattern, method_pattern, field_pattern]

        for pattern in patterns:
            matches = re.finditer(pattern, content, re.MULTILINE)
            for match in matches:
                identifier = match.group(1)
                if len(identifier) > 2:  # Skip very short identifiers
                    self.words.add(identifier)

    def process_file(self, file_path: str) -> None:
        """Process a single Go file to extract identifiers."""
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
                self.extract_identifiers(content)
        except Exception as e:
            print(f"Error processing {file_path}: {e}")

    def collect_words(self) -> Set[str]:
        """Walk through the project directory and process Go files."""
        for root, _, files in os.walk(self.project_path):
            for file in files:
                if file.endswith('.go'):
                    file_path = os.path.join(root, file)
                    self.process_file(file_path)
        return self.words

class Word:
    def __init__(self, text: str, x: int, y: int):
        self.text = text
        self.x = x
        self.y = y
        self.speed = random.uniform(0.01, 0.03)

    def move(self) -> None:
        self.y += self.speed

class TypingGame:
    def __init__(self, words: Set[str]):
        self.words = list(words)
        self.active_words: List[Word] = []
        self.score = 0
        self.lives = 3
        self.current_input = ""
        self.game_over = False

    def run(self, stdscr) -> None:
        curses.curs_set(0)
        stdscr.nodelay(1)
        max_y, max_x = stdscr.getmaxyx()

        last_spawn = time.time()
        spawn_interval = 2.0

        while not self.game_over and self.lives > 0:
            current_time = time.time()

            # Spawn new word
            if current_time - last_spawn > spawn_interval:
                if self.words:
                    word_text = random.choice(self.words)
                    x_pos = random.randint(0, max_x - len(word_text))
                    self.active_words.append(Word(word_text, x_pos, 0))
                    last_spawn = current_time

            # Handle input
            try:
                key = stdscr.getch()
                if key == ord('\n'):
                    self._check_word()
                elif key == 27:  # ESC
                    self.game_over = True
                elif key in (curses.KEY_BACKSPACE, ord('\b'), ord('\x7f')):
                    self.current_input = self.current_input[:-1]
                elif key != -1 and key < 256:
                    self.current_input += chr(key)
            except:
                pass

            # Update word positions and check for words that reached bottom
            self._update_words(max_y)

            # Draw everything
            self._draw(stdscr, max_y, max_x)

            time.sleep(0.05)

    def _check_word(self) -> None:
        """Check if typed word matches any active word."""
        for word in self.active_words:
            if self.current_input == word.text:
                self.score += len(word.text)
                self.active_words.remove(word)
                break
        self.current_input = ""

    def _update_words(self, max_y: int) -> None:
        """Update positions of active words and remove those that reached bottom."""
        words_to_remove = []
        for word in self.active_words:
            word.move()
            if word.y >= max_y - 1:
                words_to_remove.append(word)
                self.lives -= 1

        for word in words_to_remove:
            self.active_words.remove(word)

    def _draw(self, stdscr, max_y: int, max_x: int) -> None:
        """Draw the game state to the screen."""
        stdscr.clear()

        # Draw active words
        for word in self.active_words:
            y_pos = int(word.y)
            if 0 <= y_pos < max_y and 0 <= word.x < max_x:
                try:
                    stdscr.addstr(y_pos, word.x, word.text)
                except curses.error:
                    pass

        # Draw status line
        status = f"Score: {self.score} | Lives: {self.lives} | Current: {self.current_input}"
        try:
            stdscr.addstr(max_y - 1, 0, status[:max_x])
        except curses.error:
            pass

        stdscr.refresh()

def main(project_path: str):
    # Extract words from the project
    extractor = GoWordExtractor(project_path)
    words = extractor.collect_words()

    if not words:
        print("No words found in the project!")
        return

    # Initialize and run the game
    game = TypingGame(words)
    curses.wrapper(game.run)

    print(f"\nGame Over! Final score: {game.score}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python game.py <path_to_go_project>")
    else:
        main(sys.argv[1])
