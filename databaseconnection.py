import mysql.connector

class DatabaseConnection():

    config = {
        "host": "localhost",
        "user": "sanlee",
        "password": "password",
        "database": "chatbotdb"
    }

    def __init__(self):
        self.db = mysql.connector.connect(**self.config)
        self.cursor = self.db.cursor()

    def insert_user_query(self, user_query):
        my_cursor = self.cursor
        sql = "INSERT INTO user_queries (query) VALUES (%s);"
        val = user_query
        my_cursor.execute(sql, (val,))
        self.db.commit()
        print("Data inserted successfully")
    
    def get_response(self, user_query):
        my_cursor = self.cursor
        sql = "SELECT bot_responses FROM user_queries where query = (%s);"
        val = user_query
        my_cursor.execute(sql, (val,))
        results = my_cursor.fetchall()
        print(f"get_response found this as a response: {results}")
        return results

    def get_all_programs(self):
        try:
            my_cursor = self.cursor
            sql = """SELECT payload FROM level_1;"""
            my_cursor.execute(sql)
            results = my_cursor.fetchall()
            print(f"get_program_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    def get_all_degrees(self):
        try:
            my_cursor = self.cursor
            sql = """SELECT payload FROM level_2;"""
            my_cursor.execute(sql)
            results = my_cursor.fetchall()
            print(f"get_program_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    def get_all_courses(self):
        try:
            my_cursor = self.cursor
            sql = """SELECT payload FROM level_3;"""
            my_cursor.execute(sql)
            results = my_cursor.fetchall()
            print(f"get_program_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    def get_all_query(self):
        try:
            my_cursor = self.cursor
            sql = """SELECT payload FROM level_4;"""
            my_cursor.execute(sql)
            results = my_cursor.fetchall()
            print(f"get_program_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)


    def get_program_list(self):
        try:
            my_cursor = self.cursor
            sql = """SELECT title, payload FROM level_1;"""
            my_cursor.execute(sql)
            results = my_cursor.fetchall()
            print(f"get_program_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    def get_degree_list(self, program):
        try:
            my_cursor = self.cursor
            sql = """SELECT level_2.title,level_2.payload FROM level_2 
            INNER JOIN level_1 on level_1.level_1_id = level_2.level_1_id_fk WHERE level_1.payload = (%s);"""
            val = program
            my_cursor.execute(sql, (val,))
            results = my_cursor.fetchall()
            print(f"get_degree_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)
    
    def get_course_list(self, program, degree):
        try:
            my_cursor = self.cursor
            sql = """SELECT level_3.title, level_3.payload FROM level_3 
            INNER JOIN level_2 on level_3.level_2_id_fk = level_2.level_2_id 
            INNER JOIN level_1 on level_2.level_1_id_fk = level_1.level_1_id 
            WHERE level_1.payload = (%s) AND level_2.payload = (%s);"""
            my_cursor.execute(sql, (program, degree))
            results = my_cursor.fetchall()
            print(f"get_course_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)
    
    def get_query_list(self, program, degree, course):
        try:
            my_cursor = self.cursor
            sql = """SELECT level_4.title, level_4.payload FROM level_4 
            INNER JOIN level_3 on level_4.level_3_id_fk = level_3.level_3_id 
            INNER JOIN level_2 on level_3.level_2_id_fk = level_2.level_2_id 
            INNER JOIN level_1 on level_2.level_1_id_fk = level_1.level_1_id 
            WHERE level_3.payload = (%s) AND level_2.payload = (%s) AND level_1.payload = (%s);"""
            my_cursor.execute(sql, (course, degree, program))
            results = my_cursor.fetchall()
            print(f"get_query_list found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)
    
    def get_query_response(self, program, degree, course, query):
        try:
            my_cursor = self.cursor
            sql = """SELECT details FROM level_5 
            INNER JOIN level_4 ON level_4.level_4_id = level_5.level_4_id_fk 
            INNER JOIN level_3 ON level_3.level_3_id = level_4.level_3_id_fk 
            INNER JOIN level_2 ON level_2.level_2_id = level_3.level_2_id_fk 
            INNER JOIN level_1 on level_1.level_1_id = level_2.level_1_id_fk 
            WHERE level_1.payload = (%s) AND  level_2.payload = (%s) AND  level_3.payload = (%s) AND level_4.payload = (%s);"""
            my_cursor.execute(sql, (program , degree, course, query))
            results = my_cursor.fetchall()
            print(f"get_query_response found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    def get_program_from_course(self, course):
        try:
            my_cursor = self.cursor
            sql = """SELECT title, payload FROM level_1 WHERE level_1_id IN (SELECT level_1_id_fk FROM level_2 WHERE level_2_id 
            IN (SELECT level_2_id_fk FROM level_3 WHERE lower(payload) = (%s)))"""
            my_cursor.execute(sql, (course,))
            results = my_cursor.fetchall()
            print(f"get_program_from_course found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)
    
    def get_program_from_degree(self, degree):
        try:
            my_cursor = self.cursor
            sql = """SELECT title, payload FROM level_1 WHERE level_1_id IN 
            (SELECT level_1_id_fk FROM level_2 WHERE payload = (%s))"""
            my_cursor.execute(sql, (degree,))
            results = my_cursor.fetchall()
            print(f"get_program_from_degree found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    def get_degree_from_program(self, program):
        try:
            my_cursor = self.cursor
            sql = """SELECT title, payload FROM level_2 WHERE level_2_id IN (SELECT level_2_id_fk FROM level_3 
            WHERE lower(payload) = (%s))"""
            my_cursor.execute(sql, (program,))
            results = my_cursor.fetchall()
            print(f"get_degree_from_program found this as a response: {results}")
            return results
        except Exception as err:
            print("Err:",err)

    