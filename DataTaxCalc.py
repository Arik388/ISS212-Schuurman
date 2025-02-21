#Name: Douglas Schuurman
#Date: 2/21/2025
#Class: ISS212
#Assignment: Week 3 Tool Development
#Notes For Professor / Resources Used
#Walkthrough from brightspace
def main():

    data = float(input("Enter the annual data usage in MB: "))

    if data <= 85528:
        tax =(0.18 * data) - 556.02
    else:
        tax = 14839.02 + 0.32 * (data - 85528)
    tax = max(tax, 0)
    print(f"Data Security Tax comes to: {round(tax)} MB")
if __name__ == '__main__':
    main()