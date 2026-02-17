#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -A -F , -c"   #-F field separator defalut is | we change it to comma ,
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo $($PSQL "TRUNCATE TABLE customers. RESTART IDENTITY;")
MAIN_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1"
    fi
    echo -e "\nWelcome to My Salon, how can I help you?"
    echo -e "\n\n1) cut \n2) color\n3) perm\n4) style\n5) trim "
    read MAIN_MENY_SELECTION
    }

CUSTOMER_INFO() {
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if not found
    if [[ -z $CUSTOMER_NAME ]] 
        then
          #get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          #insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi
    else
        
      }


      
MAIN_MENU
case $MAIN_MENU_SELECTION in
1) CUT_MENU;;
2) COLOR_MENU;;
3) PERM_MENU;;
4) STYLE_MENU;;
5) TRIM_MENU;;
*) MAIN_MENU "I could not find that service. What would you like today?";;
esac
