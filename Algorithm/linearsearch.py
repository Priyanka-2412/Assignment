def linear_search(arr, search):
    for i in range(len(arr)):
        if arr[i] == search:
            return i 
    return -1  

arr = [10, 20, 30, 40, 50]
search=int(input("Enter a element to search:"))
result = linear_search(arr, searcht)

if result != -1:
    print(f"Element found at index {result}")
else:
    print("Element not found")
