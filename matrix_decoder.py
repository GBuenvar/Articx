import argparse

parser = argparse.ArgumentParser(description='Decode a matrix')

parser.add_argument('file',
                    metavar='file',
                    type=str,
                    help='file containing the matrix to decode, \
                        which is composed by elements separated \
                        by ";" and lines separated by "\\n". \
                        The matrix elements are composed by "+" \
                        and "-" and may contain some of them in parenthesis.')
parser.add_argument("-p",
                    '--ignore-parenthesis',
                    dest='ignore_parenthesis',
                    action='store_true',
                    help='ignore the parenthesis',
                    default=True)

args = parser.parse_args()

print("Reading file: " + args.file)
print("Ignore parenthesis: " + str(args.ignore_parenthesis))


def decode(string, ignore_parenthesis=True):
    """decode string to a number

    counts the number of "+" and "-" in the string and returns the result.
    If ignore_parenthesis is True, the function will ignore the parenthesis
    and only count the "+" and "-" outside the parenthesis.
    If ignore_parenthesis is False, the function will count the "+" and "-"
    inside the parenthesis as well.

    If the string is empty,

    Args:
        string (_type_): _description_
        ignore_parenthesis (bool, optional): _description_. Defaults to True.

    Returns:
        _type_: _description_
    """
    between_parenthesis = string[string.find("(")+1:
                                 string.find(")")
                                 ] if "(" in string else ""
    outside_parenthesis = string[:string.find("(")] +\
        string[string.find(")")+1:] \
        if "(" in string else string

    result = outside_parenthesis.count("+") - outside_parenthesis.count("-")

    if not ignore_parenthesis:
        result += between_parenthesis.count("+") -\
              between_parenthesis.count("-")

    if outside_parenthesis == "":
        if between_parenthesis == "" or between_parenthesis == "0":
            # return 0 if the string is empty or if the string is 0
            return 0
        else: 
            sum_par = between_parenthesis.count("+") -\
              between_parenthesis.count("-")
            if sum_par > 0:
                return 0.9
            elif sum_par < 0:
                return 0.1
            elif sum_par == 0:
                return 0.5
    return result


with open(args.file, 'r') as f:
    matrix = [[
        decode(elem.replace("\n", ""), args.ignore_parenthesis)
        for elem in line.split(';')
        ] for line in f]

# save the result in a file with the same name as
# the input file + "decoded" and the same extension

with open(args.file.replace(".", "_decoded."), 'w') as f:
    for line in matrix:
        f.write(";".join([str(elem) for elem in line]) + "\n")

print("File decoded and saved as: " + args.file.replace(".", "_decoded."))
