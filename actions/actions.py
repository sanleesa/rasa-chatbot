# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions
from logging import NullHandler
import re
from typing import Any, Text, Dict, List
from dns.rdatatype import NULL
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import AllSlotsReset, SlotSet

from databaseconnection import DatabaseConnection as dbcon

class ActionHandleQuery(Action):

    db = dbcon()

    def name(self):
        return 'action_handle_query'
        
    def run(self, dispatcher, tracker, domain):
        try:
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')
            query = tracker.get_slot('query')
            results = self.db.get_query_response(program, degree, course, query)
            dispatcher.utter_message(text=results[0][0])
        except Exception as ex:
            print(ex)
        return []

class ActionAskProgram(Action):

    db = dbcon()

    def name(self):
        return 'action_ask_program'
        
    def run(self, dispatcher, tracker, domain):
        try:
            buttons = []
            results = self.db.get_program_list()
            if (results != []):
                for list in results:
                    buttons.append({"title": list[0], "payload": list[1]})
                dispatcher.utter_message(text="Hi, what program are you looking for?", buttons=buttons)
            else:
                dispatcher.utter_message(text="Sorry I couldn't find any programs")
        except Exception as ex:
            print(ex)
        return []

class ActionAskDegree(Action):

    db = dbcon()

    def name(self):
        return 'action_ask_degree'
        
    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            program = tracker.get_slot('program')
            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))
            buttons = []
            results = self.db.get_degree_list(program)
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(text="Please select a degree:", buttons=buttons)
        except Exception as ex:
            print(ex)
        return ret

class ActionAskCourse(Action):

    db = dbcon()

    def name(self):
        return 'action_ask_course'
        
    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))
            buttons = []
            results = self.db.get_course_list(program, degree)
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(text="Please select a course:", buttons=buttons)
        except Exception as ex:
            print(ex)
        return ret

class ActionAskQuery(Action):

    db = dbcon()
    
    def name(self):
        return 'action_ask_query'
        
    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')
            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))
            buttons = []
            results = self.db.get_query_list(str(program), str(degree), str(course))
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(text="What is your query pertaining to:", buttons=buttons)
        except Exception as ex:
            print(ex)
        return ret