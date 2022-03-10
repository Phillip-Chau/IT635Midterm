import psycopg2

conn = psycopg2.connect("postgresql://app_inventory:password@localhost/app_inventory")
cur = conn.cursor()

print("Enter an application ID")
application_id = int(input())
cur.execute("""
    SELECT applications.application_name, applications.business_categorization, applications.business_unit, employees.employee_id, employees.employees_name, employees.programming_lang, servers.server_name, servers.ip_address, servers.tech_stack
    FROM applications, employees, servers
    WHERE application_id=%s""", (application_id,));
for row in cur:
    application_name = row[0]
    business_categorization = row[1]
    business_unit = row[2]
    employee_id = row[3]
    employees_name = row[4]
    programming_lang = row[5]
    server_name = row[6]
    ip_address = row[7]
    tech_stack = row[8]
print(f"Application name:{row[0]} \n Business Categorization:{row[1]} \n Business Unit {row[2]} \n Employee ID: {row[3]} \n Employees Name: {row[4]} \n Programming Language: {row[5]} \n Server Name:{row[6]} \n IP Address:{row[7]} \n Technology Stack:{row[8]} ")

cur.close()
conn.close()