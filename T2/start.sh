#!/bin/bash
#Dante Eleutério dos Santos GRR20206686

# Check if the file exists
if [ -f "Tabelas.sqlite3" ]; then
  # Delete the file
  rm Tabelas.sqlite3
fi

# Run the Ruby script
ruby interface.rb
