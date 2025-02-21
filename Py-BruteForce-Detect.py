"""Resources Used for Assistance / Explanations####
* File Explorer Refresher - I wanted to be able to select the file so to not hardcode anything into the script.
    It was specifically to open then read the file. I did a variant of it found at https://www.geeksforgeeks.org/file-explorer-in-python-using-tkinter/

* File Read Refresher - I had to find a reference as it has been over a year since I wrote anything to read a file

* Utilized another geeks for geeks lesson to assist with this https://www.geeksforgeeks.org/how-to-read-from-a-file-in-python/

* Utilized ChatGPT to assist with debugging I had issues with 401 and suspicious.php printing for the output
    The issue was that I was looking for 401 as a equal statement I had
    Tkinter help to select file so access files / log files are not hardcoded "If line == 401": print(line) after changing to
    if "401" in line: print(f"Found 401: {line}") this solved my problem.

* Error Handling - I stated this in our initial "where are you at" write up and I stated that I didn't mess with error
    Handling all that much. This seemed to work and seemed like a general way to handle this. Was I correct in doing it this way?
    Also for generalized error handling my understanding is I can use exception or IOError with specific statements, please correct
    me if I'm misunderstanding this
"""
"""
Brute-Force Detection Script 
Created by Douglas Schuurman  
Created for ISS212 Spring Semester 
"""
from tkinter import *
from tkinter.filedialog import askopenfilename

def main():

    root = Tk()
    root.withdraw()
    fileSelect = askopenfilename(initialdir = "/", title = "Select the File", filetypes = [("All Files","*.*")])

    try:
        ##Openfile / Read
        with open(fileSelect,"r") as file:
            for line in file:
                line = line.strip()
                ##Debug Statement to check line read
                #print(f"Checking Line: '{line}'")
                ##Checking for any 401 Strings
                if "401" in line:
                    print(f"Found 401: {line}")
                ##Check for specific file
                elif "suspicious.php" in line:
                    print(f"Found Suspicious.php:{line}")
                ##Continuing the Script
                else:
                    continue
    ###General Error Handling
    except (IOError,FileNotFoundError) as e:
        print(f"Error Reading File: {e}")
    except Exception as e:
        print(f"Unexpected Error Occured: {e}")


if __name__ == '__main__':
    main()