import gspread
from oauth2client.service_account import ServiceAccountCredentials
from pprint import pprint

scope = ["https://spreadsheets.google.com/feeds",'https://www.googleapis.com/auth/spreadsheets',"https://www.googleapis.com/auth/drive.file","https://www.googleapis.com/auth/drive"]
creds = ServiceAccountCredentials.from_json_keyfile_name("creads.json", scope)

clients = gspread.authorize(creds)
sheet = clients.open("tutorial").sheet1 # Open the spreadhseet

#sheet.update_cell(5,1, "Umair") # updated sheet cell through index # Write
data = sheet.get_all_records()   # Get a list of all records      # Read
pprint(data)
