# Python Data Structures and Algorithms Practice
*:PYTHON_DS_ALGO
B:Python Data Structures and Algorithms
M: "This series of lessons focuses on common data structures and algorithms in Python."
 :STACK "Lesson 1: Stack Implementation"
 :QUEUE "Lesson 2: Queue Implementation"
 :LINKED_LIST "Lesson 3: Linked List Basics"
 :SORTING "Lesson 4: Sorting Algorithms"
 :SEARCH "Lesson 5: Search Algorithms"
 :RECURSION "Lesson 6: Recursive Functions"
 :SAMPLE_PROGRAM "Lesson 7: Sample Python Program"
 :LEETCODE_PROBLEMS "Lesson 8: Sample leetcode problems"

# Lesson 1: Stack Implementation
*:STACK
B:Lesson 1
T:In this lesson, we'll practice implementing a stack in Python using lists.
 :
I:(1) Warm up
D:The quick brown fox jumps over the lazy dog.
 :Python is a versatile programming language used for various applications, including data science, web development, and more.

I:(2) Implement a stack
S:# Stack implementation using a list
 :stack = []
 :stack.append(1)
 :stack.append(2)
 :stack.pop()

I:(3) Practice with the stack
D:Stack operations include push, pop, and peek.
 :Perform these operations on the stack: push 3, pop, push 4, pop.

I:(4) Use the stack in a real-world scenario
S:# Function to check balanced parentheses using a stack
 :def is_balanced(expression):
 :    stack = []
 :    for char in expression:
 :        if char in '({[':
 :            stack.append(char)
 :        elif char in ')}]':
 :            if not stack or not is_matching(stack.pop(), char):
 :                return False
 :    return not stack

I:(5) Try a practical example
D:Implement a function to reverse a string using a stack.

I:(6) Test your knowledge
S:Explain the key operations of a stack and provide a real-world scenario where a stack is useful.

Q:Do you want to continue to lesson 2 [Y/N] ?
N:MENU

# Additional lessons can be added following a similar structure for different data structures and algorithms.

# Python LeetCode Problem Solving
*:LEETCODE_PROBLEMS
B:Python LeetCode Problem Solving
M: "This series of lessons covers common LeetCode problems and their solutions in Python."
 :MAX_SUBSTRING_NO_REPEAT "Lesson 1: Maximum Substring Without Repeating Characters"
 :MAX_PALINDROME "Lesson 2: Longest Palindromic Substring"
 :TWO_SUM "Lesson 3: Two Sum"
 :MERGE_SORT "Lesson 4: Merge Sort Implementation"
 :BINARY_TREE_TRAVERSAL "Lesson 5: Binary Tree Traversal"
 :REVERSE_LINKED_LIST "Lesson 6: Reverse Linked List"
 :FIND_MINIMUM_ROTATED "Lesson 7: Find Minimum in Rotated Sorted Array"
 :VALID_PARENTHESES "Lesson 8: Valid Parentheses"
 :TRAPPING_RAIN_WATER "Lesson 9: Trapping Rain Water"
 :PRACTICE_PROBLEM_SET "Lesson 10: Practice Problem Set"

# Lesson 1: Maximum Substring Without Repeating Characters
*:MAX_SUBSTRING_NO_REPEAT
B:Lesson 1
T:In this lesson, we'll practice solving the problem of finding the maximum substring without repeating characters on LeetCode.
 :
I:(1) Warm up
D:The quick brown fox jumps over the lazy dog.
 :Python is a versatile programming language used for various applications, including solving algorithmic problems like those on LeetCode.

I:(2) Understand the problem
D:Given a string, find the length of the longest substring without repeating characters.
 :For example, the input "abcabcbb" has the answer "abc," with a length of 3.

I:(3) Write the solution
S:# Function to find the maximum substring without repeating characters
 :def length_of_longest_substring(s: str) -> int:
 :    char_index = {}  # Dictionary to store the last index of each character
 :    start = 0  # Starting index of the substring
 :    max_length = 0  # Maximum length of substring without repeating characters
 :
 :    for i, char in enumerate(s):
 :        if char in char_index and char_index[char] >= start:
 :            start = char_index[char] + 1
 :
 :        char_index[char] = i
 :        max_length = max(max_length, i - start + 1)
 :
 :    return max_length

I:(4) Test the solution
D:Test the function with various input strings, including edge cases.

I:(5) Analyze time and space complexity
D:Discuss the time and space complexity of the solution.

Q:Do you want to continue to lesson 2 [Y/N] ?
N:MENU

# Additional lessons can be added following a similar structure for different LeetCode problems.

# Lesson 2: Longest Palindromic Substring
*:MAX_PALINDROME
B:Lesson 2
T:In this lesson, we'll practice solving the problem of finding the longest palindromic substring on LeetCode.
 :
I:(1) Warm up
D:The quick brown fox jumps over the lazy dog.
 :Python is a versatile programming language used for various applications, including solving algorithmic problems like those on LeetCode.

I:(2) Understand the problem
D:Given a string, find the longest palindromic substring.
 :For example, the input "babad" has the answer "bab" or "aba."

I:(3) Write the solution
S:# Function to find the longest palindromic substring
 :def longest_palindrome(s: str) -> str:
 :    if not s:
 :        return ""
 :
 :    start, end = 0, 0
 :
 :    for i in range(len(s)):
 :        len1 = expand_around_center(s, i, i)
 :        len2 = expand_around_center(s, i, i + 1)
 :        max_len = max(len1, len2)
 :
 :        if max_len > end - start:
 :            start = i - (max_len - 1) // 2
 :            end = i + max_len // 2
 :
 :    return s[start:end+1]
 :
 :def expand_around_center(s: str, left: int, right: int) -> int:
 :    while left >= 0 and right < len(s) and s[left] == s[right]:
 :        left -= 1
 :        right += 1
 :    return right - left - 1

I:(4) Test the solution
D:Test the function with various input strings, including edge cases.

I:(5) Analyze time and space complexity
D:Discuss the time and space complexity of the solution.

Q:Do you want to continue to lesson 3 [Y/N] ?
N:MENU

# Similar templates can be created for the remaining lessons:

# Lesson 3: Two Sum
*:TWO_SUM
B:Lesson 3
T:In this lesson, we'll practice solving the Two Sum problem on LeetCode.
 :
I:(1) Warm up
D:The quick brown fox jumps over the lazy dog.
 :Python is a versatile programming language used for various applications, including solving algorithmic problems like those on LeetCode.

I:(2) Understand the problem
D:Given an array of integers, return indices of the two numbers such that they add up to a specific target.

I:(3) Write the solution
S:# Function to find the indices of two numbers that add up to the target
 :def two_sum(nums: List[int], target: int) -> List[int]:
 :    num_index = {}
 :    for i, num in enumerate(nums):
 :        complement = target - num
 :        if complement in num_index:
 :            return [num_index[complement], i]
 :        num_index[num] = i
 :    return []

I:(4) Test the solution
D:Test the function with various input arrays and targets, including edge cases.

I:(5) Analyze time and space complexity
D:Discuss the time and space complexity of the solution.

Q:Do you want to continue to lesson 4 [Y/N] ?
N:MENU

# Continue the pattern for the remaining lessons with appropriate solution code.


