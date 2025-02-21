###Class: ISS212
###Name: Douglas
###Assignment: Week 3 - IP Log Analyzer
"""References Explanations and Notes for Professor

"""
from tkinter import Tk
from tkinter.filedialog import askopenfilename

def main():
    root = Tk()
    root.withdraw()
    file_path = askopenfilename(title="Select Log File", filetypes=[("All Files", "*.*")])

    if not file_path:
        print("No file selected. Exiting.")
        return

    ip_lookup = input("Enter the IP(s) to search for (comma-separated): ").split(",")

    count = 0
    with open(file_path, 'r') as file:
        for line in file:
            for ip in ip_lookup:
                if ip.strip() in line:  # Strip whitespace and match
                    print(line.strip())
                    count += 1

    print(f"\nFound {count} instances of the flagged IP(s).")

if __name__ == '__main__':
    main()
