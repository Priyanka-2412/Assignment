def binary_search(arr, search):
    lower, upper = 0, len(arr) - 1
    
    while lower <= upper:
        mid = (lower + upper) // 2
        
        if arr[mid] == search:
            return mid  
        elif arr[mid] < search:
            lower = mid + 1  
        else:
            upper = mid - 1  
    
    return -1  

arr = [1, 3, 5, 7, 9, 11, 13]
search = int(input("Enter a element to search:"))
result = binary_search(arr, search)

if result != -1:
    print(f"Element found at index {result}")
else:
    print("Element not found")
