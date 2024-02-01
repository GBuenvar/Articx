# add the parser argument to the script to say if you want to ignore the parenthesis or not and the file to parse

import argparse

parser = argparse.ArgumentParser(description='Decode a matrix')

parser.add_argument('file', metavar='file', type=str, help='the file to parse')
parser.add_argument("-p", '--ignore-parenthesis', dest='ignore_parenthesis', action='store_true', help='ignore the parenthesis', default=False)

args = parser.parse_args()

print("Reading file: " + args.file)
print("Ignore parenthesis: " + str(args.ignore_parenthesis))






def decode(string, ignore_parenthesis=False):
    # remove the char between the first "(" and the last ")"

    string = string.replace(string[string.find("("):string.rfind(")")+1], "") if ignore_parenthesis else string

    # for each "+" in the string, add 1 to the int
    # for each "-" in the string, substrat 1 to the int
    # decode a string to a int
    result  = string.count("+") - string.count("-")

    return result

with open(args.file, 'r') as f:
    matrix = [[decode(elem.replace("\n", ""), args.ignore_parenthesis) for elem in line.split(';')] for line in f]

# save the result in a file with the same name as the input file + "decoded" and the same extension
    
with open(args.file.replace(".", "_decoded."), 'w') as f:
    for line in matrix:
        f.write(";".join([str(elem) for elem in line]) + "\n")