import re
from collections import Counter

def count_frequent_mandarin_chars(file_path, min_occurrences=3):
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()

    # Match all Mandarin Chinese characters (CJK Unified Ideographs)
    mandarin_chars = re.findall(r'[\u4e00-\u9fff]', text)

    # Count occurrences of each character
    char_counts = Counter(mandarin_chars)

    # Filter characters with at least `min_occurrences` appearances
    frequent_chars = {char: count for char, count in char_counts.items() if count >= min_occurrences}
    in_frequent_chars = {char: count for char, count in char_counts.items() if count < min_occurrences}

    return frequent_chars, in_frequent_chars

if __name__ == "__main__":
    file_path = "/Users/jasonoclaf//Desktop/Paragraph.txt"  # Replace with your actual file path
    result_3_plus, result_2_1 = count_frequent_mandarin_chars(file_path)
    
    print(f"Mandarin characters with at least 3 occurrences:\n")
    for char, count in sorted(result_2_1.items(), key=lambda x: -x[1]):
        print(f"{char}: {count}")

    print(f"Frequent: {len(result_3_plus)}")
    print(f"In_Frequent: {len(result_2_1)}")

    print(f"Percentage_Frequent: {len(result_3_plus)/(len(result_2_1)+len(result_3_plus))}")
