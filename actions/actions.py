# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions
from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import AllSlotsReset, SlotSet

from databaseconnection import DatabaseConnection as dbcon

class ActionHandleQuery(Action):
    def name(self):
        return 'action_handle_query'
        
    def run(self, dispatcher, tracker, domain):
        try:
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')
            query = tracker.get_slot('query')
            dispatcher.utter_message(text=f"program={program}, degree={degree}, course={course}, query={query}")
        except Exception as ex:
            print(ex)
        return []

class ActionAskDegree(Action):
    def name(self):
        return 'action_ask_degree'
        
    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            program = tracker.get_slot('program')
            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))
            buttons = []
            results = dbcon().get_degree_list(str(program))
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(text="Please select a degree:", buttons=buttons)
        except Exception as ex:
            print(ex)
        return ret

class ActionAskCourse(Action):
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
            results = dbcon().get_course_list(str(program), str(degree))
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(text="Please select a course:", buttons=buttons)
        except Exception as ex:
            print(ex)
        return ret