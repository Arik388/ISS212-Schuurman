def main():
    # Douglas Schuurman
    # SP25 Week 4 Tool Dev Exercise
    #Notes / Reference

    #Have User Enter Their Role
    role = input("Enter your role case (admin, user, guest): ").strip().lower()

    if role == "admin":
        print("Admin Access Granted")
        print("Access Level is Full, Full Privileges Granted")
    elif role == "user":
        print("User Access Granted")
        print("Access Level is limited, Limited Privileges Granted")
    elif role == "guest":
        print("Guest Access Granted")
        print("Access Level is Read Only, Read Only Privileges Granted")
    else:
        print("Invalid Role Entry, guest, admin, and user are only acceptable")





if __name__ == '__main__':
    main()