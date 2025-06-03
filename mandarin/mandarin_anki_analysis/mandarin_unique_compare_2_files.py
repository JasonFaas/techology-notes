import re

FILE_PATH_PARAGRAPH = "/Users/jafaas/Desktop/Paragraph.txt"

FILE_PATH_VOCAB = "/Users/jafaas/Desktop/Vocab.txt"


def extract_mandarin_chars(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()
    # Match all CJK Unified Ideographs (Simplified/Traditional overlap)
    chars = re.findall(r'[\u4e00-\u9fff]', text)
    return set(chars)

def compare_mandarin_chars(file1_path, file2_path):
    chars1 = extract_mandarin_chars(FILE_PATH_VOCAB)
    chars2 = extract_mandarin_chars(FILE_PATH_PARAGRAPH)

    only_in_file1 = chars1 - chars2
    only_in_file2 = chars2 - chars1

    return only_in_file1, only_in_file2

if __name__ == "__main__":
    file1 = "simplified_text.txt"  # Replace with your actual file
    file2 = "traditional_text.txt"  # Replace with your actual file

    only_in_file1, only_in_file2 = compare_mandarin_chars(file1, file2)

    print(f"{len(only_in_file1)} Characters only in \"{FILE_PATH_VOCAB}\":")
    print("".join(sorted(only_in_file1)))

    print(f"\n{len(only_in_file2)} Characters only in \"{FILE_PATH_PARAGRAPH}\":")
    print("".join(sorted(only_in_file2)))


