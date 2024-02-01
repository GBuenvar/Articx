# R version of matrix_decoder.py

args <- commandArgs(trailingOnly = TRUE)

# Check if -p flag is present
ignore_parenthesis <- any(args == "-p")

# Get the filename (last argument)
filename <- args[length(args)]

cat("Reading file: ", filename, "\n")
cat("Ignore parenthesis: ", ignore_parenthesis, "\n")

# Define the decode function
decode <- function(string, ignore_parenthesis=FALSE) {
  if (ignore_parenthesis) {
    string <- gsub("\\(.*\\)", "", string)
  }
  
  result <- sum(strsplit(string, "")[[1]] == "+") - sum(strsplit(string, "")[[1]] == "-")
  
  return(result)
}

# Read the file and decode the matrix
matrix <- lapply(strsplit(readLines(filename), ";"), function(line) {
  sapply(line, decode, ignore_parenthesis=ignore_parenthesis)
})

# Save the result in a file with the same name as the input file + "decoded" and the same extension
write.table(matrix, file = sub("\\.", "_decoded.", filename), sep = ";", row.names = FALSE, col.names = FALSE)