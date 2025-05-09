def divide(a, b):
    return a / b

def main():
    x = 10
    y = 0
    result = divide(x, y)  # ZeroDivisionError 발생
    print("Result:", result)

if __name__ == "__main__":
    import pdb; pdb.set_trace()
    main()
