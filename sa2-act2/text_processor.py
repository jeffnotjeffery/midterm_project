#!/usr/bin/env python3
import argparse
import os

def line_count(file_path):
    with open(file_path, 'r') as file:
        return sum(1 for line in file)
    

def word_count(file_path):
    with open (file_path, 'r') as file:
        words = file.read().split()
        return len(words)
    

def uppercase(file_path):
    with open(file_path, 'r') as file:
        return file.read().upper()
    
def contains_word(file_path, word):
    with open(file_path, 'r') as file:
        return word in file.read()
    
def main(): 
    parser = argparse.ArgumentParser(description="Process a text file based on user input")
    parser.add_argument("file_path", help="Path to the text file to be processed")
    parser.add_argument("operation", choices=["line-count", "word-count", "uppercase", "contains"],
                        help="Type of operation to perform on the file")
    parser.add_argument("--word", help="Word to find in the file (required for 'contains' operation)")

    args = parser.parse_args()

    if not os.path.exists(args.file_path):
        print("Error: File not found.")
        return

    if args.operation == "line-count":
        result = line_count(args.file_path)
    elif args.operation == "word-count":
        result = word_count(args.file_path)
    elif args.operation == "uppercase":
        result = uppercase(args.file_path)
    elif args.operation == "contains":
        if args.word is None:
            print("Error: '--word' argument is required for 'contains' operation.")
            return
        result = contains_word(args.file_path, args.word)

    print(result)

if __name__ == "__main__":
    main()
    