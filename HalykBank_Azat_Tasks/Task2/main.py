from fpdf import FPDF
import PyPDF2

# In this task I'll create new pdf
# with library FPDF
# and wrote there some text
# after this I read data from this pdf
# with library PyPDF2


file = FPDF()  # created variable file

file.add_page()  # here we'll add page

file.set_font("Arial", size=20)  # here shown style of our pdf and it's size

file.cell(180, 7, txt="Python is an interpreted programming language", align='C')
# In the code above created cell, it's a rectangular area
# first param is width, then height, text, also another params
# like align center

file.output("Task2.pdf")  # saved file with name and in pdf format

# let's read data from it
reading_file = PyPDF2.PdfFileReader('Task2.pdf')  # we read it with PdfFileReader
print(reading_file.numPages)  # I used method numPages to check is it output number of pages

getPage1 = reading_file.getPage(0)  # get 1 first page
text = getPage1.extractText()  # from this page I'll extract text
print(text)   # and output it to the terminal

