#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

# games variables
TO_GUESS=$(( RANDOM % 1000 + 1))
TRIES=0

# username prompt
echo "Enter your username:"
read USERNAME

# get username from database
GET_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
# if not found
if [[ $GET_USER == $USERNAME ]]
then
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE user_id = $USER_ID")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

else
  # add new user
  ADD_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

  echo "Welcome, $USERNAME! It looks like this is your first time here."  
fi

# user first input prompt
echo "Guess the secret number between 1 and 1000:"

GAME() {
  # condition to prompt function with argument
  if [[ $1 ]]
  then
    echo "$1"
  fi
  read INPUT
  TRIES=$(( $TRIES + 1 ))

  # echo -e "\n SECRET NUMBER: $TO_GUESS\n GUESS: $INPUT\n Tries: $TRIES"

  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then  
    GAME "That is not an integer, guess again:"
  fi

  if [[ $INPUT -gt $TO_GUESS ]]
  then
    GAME "It's lower than that, guess again:"
  elif [[ $INPUT -lt $TO_GUESS ]]
  then
    GAME "It's higher than that, guess again:"
  elif [[ $INPUT -eq $TO_GUESS ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  fi
}

GAME

ADD_NEW_GAME=$($PSQL "INSERT INTO games(user_id, tries) VALUES($USER_ID, $TRIES)")

echo "You guessed it in $TRIES tries. The secret number was $TO_GUESS. Nice job!"
