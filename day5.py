import re

def nice_string(str):
    three_vows = re.search(r'[aeiou].*[aeiou].*[aeiou]', str) != None
    doubles    = re.search(r'(\w)\1', str) != None
    bad_combos = re.search(r'ab|cd|pq|xy', str) != None
    return three_vows and doubles and not bad_combos

def count_nice(filename):
    lines = open(filename).readlines()
    return len(list(filter(nice_string, lines)))

if __name__ == "__main__":
    print(count_nice('input5.txt'))
