###Class: ISS212
###Name: Douglas
###Assignment: Week 3 - Password Check
"""References Explanations and Notes for Professor
* W3Schools Reference for re module https://www.w3schools.com/python/python_regex.asp
* Utilized ChatGPT for debugging specifically the password check variable.
"""
import re
def main():
### Criteria for a proper password
    passwordCheck = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}[\]:;'<>,.?/~]).{8,}$"
### At the start had this as a one in done pass or fail. Changed it to a while loop to allow repeated
### Attempts at a password until a proper one is inputted.
    while True:
        password = input("Please Enter a Password: ")
        if re.match(passwordCheck,password):
            print("Password meets the standard\n")
            break
        else:
            print("Password does not meet the standard\n")



if __name__ == '__main__':
    main()