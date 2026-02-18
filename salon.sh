#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -A -c"   #-F, field separator defalut is | we change it to comma ,
echo -e "\n~~~~~ MY SALON ~~~~~\n"
#echo $($PSQL "TRUNCATE TABLE customers,appointments RESTART IDENTITY;")
MAIN_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1"
    fi
    echo -e "\nWelcome to My Salon, how can I help you?"
    echo -e "\n\n1) cut \n2) color\n3) perm\n4) style\n5) trim "
    read SERVICE_ID_SELECTED
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
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    }      
SERVICE_MENU() {
    CUSTOMER_INFO
    #echo customer id $CUSTOMER_ID
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    
    }

MAIN_MENU
case $SERVICE_ID_SELECTED in
1) SERVICE_MENU;;
2) SERVICE_MENU;;
3) SERVICE_MENU;;
4) SERVICE_MENU;;
5) SERVICE_MENU;;
*) MAIN_MENU "I could not find that service. What would you like today?";;
esac
