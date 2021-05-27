# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions
from logging import NullHandler, setLoggerClass
import re
from typing import Any, Text, Dict, List
from dns.rdatatype import NULL
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import AllSlotsReset, SlotSet, UserUtteranceReverted

from databaseconnection import DatabaseConnection as dbcon

class ActionAskProgram(Action):

    def name(self):
        return 'action_ask_program'

    def run(self, dispatcher, tracker, domain):
        try:
            buttons = []
            results = None
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')

            if (course is not None) and (degree is None):
                # fine program based on course
                results = dbcon().get_program_from_course(course)
                if (results is None) or (len(results) == 0):
                    # set custom message
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find programs for {course}")
                    return [SlotSet('course', None)]
            elif (degree is not None):
                # find program based on degree
                results = dbcon().get_program_from_degree(degree)
                if (results is None) or (len(results) == 0):
                    # set custom message
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find any programs for {degree}")
                    return [SlotSet('degree', None)]
            else:
                results = dbcon().get_program_list()
                if (results is None) or (len(results) == 0):
                    dispatcher.utter_message(
                        text="Sorry I couldn't find any programs :(")
                    return []

            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Hi, what program are you looking for?", buttons=buttons)

        except Exception as ex:
            print(ex)
        return []


class ActionAskDegree(Action):

    def name(self):
        return 'action_ask_degree'

    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            buttons = []
            results = None
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')

            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))

            if (course is not None) and (degree is None):
                # query to find program from course
                results = dbcon().get_program_from_course(course)
                if (results is None) or (len(results) == 0):
                    # set custom message
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find programs for {course}")
                    return [SlotSet('course', None)]
            # elif (degree is not None) or (degree is None):
            #     # query to check degree exists
            #     results = dbcon().get_all_degrees()
            #     if (results is not None) or (len(results) != 0):
            #         if (degree in results[0][0]):
                        
            #     else:
            #         # set custom message
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find degree named {degree}")
            #         return [SlotSet('degree', None)]
            else:
                results = dbcon().get_degree_list(program)
                if (results is None) or (len(results) == 0):
                    dispatcher.utter_message(
                        text="Sorry I couldn't find any programs :(")
                    return []

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
            results = None
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')

            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))
            buttons = []

            if (course is not None) and (degree is None):
                # query to find program from course
                results = dbcon().get_program_from_course(course)
                if (results is None) or (len(results) == 0):
                    # set custom message
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find programs for {course}")
                    return [SlotSet('course', None)]
            elif (course is not None):
                results = dbcon().get_course_list(course)
                if (results is None) or (len(results) == 0):
                    # set custom message
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find programs for {course}")
                    return [SlotSet('course', None)]
            else:
                results = dbcon().get_course_list(program, degree)
                if (results is None) or (len(results) == 0):
                    dispatcher.utter_message(
                        text="Sorry I couldn't find any programs :(")
                    return []

            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Please select a course:", buttons=buttons)

        except Exception as ex:
            print(ex)
        return ret


class ActionAskQuery(Action):

    def name(self):
        return 'action_ask_query'

    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            results = None
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')
            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))
            buttons = []
            results = dbcon().get_query_list(program, degree, course)
            if (results != []):
                for list in results:
                    buttons.append({"title": list[0], "payload": list[1]})
                dispatcher.utter_message(
                    text="What is your query pertaining to:", buttons=buttons)
            else:
                dispatcher.utter_message(
                    text="Sorry I couldn't find any options :(")
        except Exception as ex:
            print(ex)
        return ret


class ActionHandleQuery(Action):

    def name(self):
        return 'action_handle_query'

    def run(self, dispatcher, tracker, domain):
        try:
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            course = tracker.get_slot('course')
            query = tracker.get_slot('query')
            results = dbcon().get_query_response(program, degree, course, query)
            dispatcher.utter_message(text=results[0][0])
        except Exception as ex:
            print(ex)
        return []
