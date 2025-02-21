#Name: Douglas Schuurman
#Date: 2/21/2025
#Class: ISS212
#Assignment: Week 3 Tool Development
#Notes For Professor / Resources Used
#Walkthrough from brightspace

def main():
    year = int(input("Enter the year to see if it is a patch cycle: "))

    if year < 2019:
        print("Not within our patch period")
    else:
        if year % 4 != 0:
            print("Standard Year")
        elif year % 100 != 0:
            print("Patch Year")
        elif year % 400 != 0:  # Added missing colon
            print("Standard Year")
        else:
            print("Patch Year")


if __name__ == '__main__':
    main()
