# [0-9a-zA-ZāáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜüÜńňǹ?。🇬🇧:#/.：？,，《!”“》]

import re

def count_unique_mandarin_chars(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()

    # Use a regex to match only Chinese characters (Mandarin)
    mandarin_chars = re.findall(r'[\u4e00-\u9fff]', text)

    # Get unique characters
    unique_chars = set(mandarin_chars)

    return len(unique_chars)

if __name__ == "__main__":
    file_path = "/Users/jasonoclaf/Desktop/Paragraph.txt"  # Replace with your file path
    unique_count = count_unique_mandarin_chars(file_path)
    print(f"Number of unique Mandarin characters: {unique_count}")

