#Name: Douglas Schuurman
#Date: 2/21/2025
#Class: ISS212
#Assignment: Week 3 Tool Development
#Notes For Professor / Resources Used
#Walkthrough from brightspace
def main():
#python script to read packet size
#Let the user input the packet
    pack_size = int(input("Enter the Packet Size Here: "))

    #Print out the results to the T/F to console
    print(pack_size >= 1337 or pack_size >= 2600)

if __name__ == '__main__':
    main()