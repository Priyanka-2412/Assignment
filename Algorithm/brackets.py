def is_balanced(s):
    stack = []
    
    for char in s:
        if char == '(':
            stack.append(char)
        elif char == ')':
            if not stack:
                return False 
            stack.pop()
    
    return len(stack) == 0

s = input("Enter a value for s: ")
if is_balanced(s):
    print("Balanced")
else:
    print("Not Balanced")
