#!/bin/bash

# Array containing 100 random words
words=(
  "apple" "banana" "orange" "grape" "kiwi" "strawberry" "melon" "pineapple" "pear" "mango"
  "cherry" "blueberry" "peach" "lemon" "watermelon" "apricot" "plum" "pomegranate" "coconut" "raspberry"
  # Add more words here...
)

# Function to display a random word
get_random_word() {
  local word_index=$((RANDOM % ${#words[@]}))
  echo "${words[$word_index]}"
}

# Function to calculate score
calculate_score() {
  local correct_words=$1
  local total_words=${#words[@]}
  local percentage=$((correct_words * 100 / total_words))
  echo "Your Score: $correct_words / $total_words ($percentage%)"
}

echo "Welcome to the Word Typing Game!"
echo "Type each word and press Enter. You have 5 seconds per word."
echo "Type 'end' to finish the game."

correct_count=0
while true; do
  word_to_type=$(get_random_word)
  echo "Word: $word_to_type"

  # Start measuring time
  start_time=$(date +%s)

  # Read user input
  read -t 5 user_input

  # End the game if the user types 'end'
  if [ "$user_input" = "end" ]; then
    break
  fi

  # End measuring time
  end_time=$(date +%s)
  time_taken=$((end_time - start_time))

  if [ "$user_input" = "$word_to_type" ] && [ "$time_taken" -le 5 ]; then
    echo "Correct!"
    ((correct_count++))
  else
    echo "Wrong or Time's up!"
  fi

done

calculate_score $correct_count
