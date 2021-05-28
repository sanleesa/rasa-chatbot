# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions
from logging import NullHandler, setLoggerClass
import re
from typing import Any, Text, Dict, List
from dns.rdatatype import NULL
from dns.tsig import validate
from rasa_sdk import Action, Tracker, FormValidationAction
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import AllSlotsReset, SlotSet, UserUtteranceReverted
from rasa_sdk.types import DomainDict

from databaseconnection import DatabaseConnection as dbcon


class ActionAskProgram(Action):

    def name(self):
        return 'action_ask_program'

    def run(self, dispatcher, tracker, domain):
        try:
            buttons = []
            results = None
            # degree = tracker.get_slot('degree')
            # course = tracker.get_slot('course')

            # if (course is not None) and (degree is None):
            #     # fine program based on course
            #     results = dbcon().get_program_from_course(course)
            #     if (results is None) or (len(results) == 0):
            #         # set custom message
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find programs for {course}")
            #         return [SlotSet('course', None)]
            # elif (degree is not None):
            #     # find program based on degree
            #     results = dbcon().get_program_from_degree(degree)
            #     if (results is None) or (len(results) == 0):
            #         # set custom message
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find any programs for {degree}")
            #         return [SlotSet('degree', None)]
            # else:

            results = dbcon().get_program_list()
            if (results is None) or (len(results) == 0):
                dispatcher.utter_message(
                    text="Sorry I couldn't find any programs :(")
                return []
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Please select the program are you looking for", buttons=buttons)

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
            # degree = tracker.get_slot('degree')
            # course = tracker.get_slot('course')

            if (program in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('course', 'na'))

            # if (course is not None) and (degree is None):
            #     # query to find program from course
            #     results = dbcon().get_program_from_course(course)
            #     if (results is None) or (len(results) == 0):
            #         # set custom message
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find programs for {course}")
            #         return [SlotSet('course', None)]
            # # elif (degree is not None) or (degree is None):
            # #     # query to check degree exists
            # #     results = dbcon().get_all_degrees()
            # #     if (results is not None) or (len(results) != 0):
            # #         if (degree in results[0][0]):

            # #     else:
            # #         # set custom message
            # #         dispatcher.utter_message(
            # #             text=f"Sorry I couldn't find degree named {degree}")
            # #         return [SlotSet('degree', None)]
            # else:
            # if (results is None) or (len(results) == 0):
            #     dispatcher.utter_message(
            #         text="Sorry I couldn't find any programs :(")
            #     return []

            results = dbcon().get_degree_list(program)
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
                dispatcher.utter_message(text="Please select a degree:", buttons=buttons)
            return []

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

            # if (course is not None) and (degree is None):
            #     # query to find program from course
            #     results = dbcon().get_program_from_course(course)
            #     if (results is None) or (len(results) == 0):
            #         # set custom message
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find programs for {course}")
            #         return [SlotSet('course', None)]
            # else:
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


class ValidateProgramForm(FormValidationAction):
    def name(self) -> Text:
        return "validate_program_form"

    @staticmethod
    def program_db() -> List[Text]:
        # function returns list of all programs
        results = dbcon().get_all_programs()
        temp = []
        for i in results:
            for j in i:
                temp.append(j)
        return temp

    @staticmethod
    def degree_db() -> List[Text]:
        # fuctions returns list of all degrees
        results = dbcon().get_all_degrees()
        temp = []
        for i in results:
            for j in i:
                temp.append(j)
        return temp

    @staticmethod
    def course_db() -> List[Text]:
        # fuctions returns list of all course
        results = dbcon().get_all_courses()
        temp = []
        for i in results:
            for j in i:
                temp.append(j)
        return temp
    @staticmethod
    def query_db() -> List[Text]:
        # fuctions returns list of all queries
        results = dbcon().get_all_query()
        temp = []
        for i in results:
            for j in i:
                temp.append(j)
        return temp

    def validate_program(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate program value."""

        if (slot_value.lower() in self.program_db()):
            # validation succeeded, set the value of the "program" slot to value
            return {"program": slot_value}
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            print("This is output",self.program_db())
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"program": None}

    def validate_degree(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate degree value."""

        if (slot_value.lower() in self.degree_db()):
            # validation succeeded, set the value of the "degree" slot to value
            print("Slot vaidations",slot_value)
            return {"degree": slot_value}
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            print("the value of degree slot is set to",slot_value)
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"degree": None}

    def validate_course(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate course value."""

        if (slot_value.lower() in self.course_db()):
            # validation succeeded, set the value of the "course" slot to value
            return {"course": slot_value}
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"course": None}

    def validate_query(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate query value."""

        if (slot_value.lower() in self.query_db()):
            # validation succeeded, set the value of the "course" slot to value
            return {"query": slot_value}
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"query": None}
