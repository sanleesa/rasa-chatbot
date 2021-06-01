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


class ActionAskGradeLevel(Action):

    def name(self):
        return 'action_ask_grade_level'

    def run(self, dispatcher, tracker, domain):
        try:
            buttons = []
            results = None
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')

            if (degree is not None) and (program is None):
                # query to get grade level from degree
                results = dbcon().get_grade_from_degree(degree)
                if (results is None) or (len(results) == 0):
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find grade level for {degree}")
                    return [SlotSet('degree', None)]
            elif (program is not None):
                # query to get grade level from program
                results = dbcon().get_grade_from_program(program)
                if (results is None) or (len(results) == 0):
                    dispatcher.utter_message(
                        text=f"Sorry I couldn't find grade level for {program}")
                    return [SlotSet('program', None)]
            else:
                results = dbcon().get_grade_level_list()
                if (results is None) or (len(results) == 0):
                    dispatcher.utter_message(
                        text="Sorry I couldn't find any grade levels :(")
                    return []

            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Please select grade level", buttons=buttons, button_type="vertical")

        except Exception as ex:
            print(ex)
        return []


class ActionAskProgram(Action):

    def name(self):
        return 'action_ask_program'

    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            buttons = []
            results = None
            grade_level = tracker.get_slot('grade_level')
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')

            # if (grade_level in ["diploma", "postgraduatediploma", "phd"]):
            #     ret.append(SlotSet('degree', 'na'))

            # if (degree is not None) and (program is None):
            #     # query to get grade level from degree
            #     results = dbcon().get_grade_from_degree(degree)
            #     if (results is None) or (len(results) == 0):
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find grade level for {degree}")
            #         return [SlotSet('degree', None)]
            # else:
            results = dbcon().get_program_list(grade_level)
            if (results is None) or (len(results) == 0):
                dispatcher.utter_message(
                    text="Sorry I couldn't find any programs :(")
                return []

            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(text="Please select a program", buttons=buttons, button_type="vertical")
            return []

        except Exception as ex:
            print(ex)
        return ret


class ActionAskDegree(Action):

    def name(self):
        return 'action_ask_degree'

    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            results = None
            grade_level = tracker.get_slot('grade_level')
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')

            if (grade_level in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('degree', 'na'))
            buttons = []

            # if (degree is not None) and (program is None):
            #     # query to get grade level from degree
            #     results = dbcon.get_grade_from_degree(degree)
            #     if (results is None) or (len(results) == 0):
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find grade level for {degree}")
            #         return [SlotSet('degree', None)]
            # elif (program is not None) and (degree is None):
            #     # query to get grade level from program
            #     results = dbcon.get_grade_from_program(program)
            #     if (results is None) or (len(results) == 0):
            #         dispatcher.utter_message(
            #             text=f"Sorry I couldn't find grade level for {program}")
            #         return [SlotSet('program', None)]
            # else:
            results = dbcon().get_degree_list(grade_level, program)
            if (results is None) or (len(results) == 0):
                dispatcher.utter_message(
                    text="Sorry I couldn't find any degree :(")
                return []

            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Please select a degree", buttons=buttons, button_type="vertical")

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
            grade_level = tracker.get_slot('grade_level')
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            if (grade_level in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('degree', 'na'))
            buttons = []
            results = dbcon().get_query_list(grade_level, program, degree)
            if (results != []):
                for list in results:
                    buttons.append({"title": list[0], "payload": list[1]})
                dispatcher.utter_message(
                    text="What is your query pertaining to:", buttons=buttons, button_type="vertical")
                print(tracker.latest_action_name)
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
            grade_level = tracker.get_slot('grade_level')
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            query = tracker.get_slot('query')
            results = dbcon().get_query_response(grade_level, program, degree, query)
            if (results[0][0] != ""):
                dispatcher.utter_message(text=results[0][0])
            else:
                if (grade_level in ["diploma", "postgraduatediploma", "phd"]):
                    if (query == "faq"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any FAQs for {program.capitalize()}")
                    elif (query == "subjectdetails"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any subject details for {program.capitalize()}")
                    elif(query == "admissiondetails"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any admission details for {program.capitalize()}")
                    elif(query == "fees"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any fee details for {program.capitalize()}")
                    else:
                        dispatcher.utter_message(text=f"Sorry I couldn't find any query called {query.capitalize()}")
                else:
                    if (query == "faq"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any FAQs for {degree.capitalize()}")
                    elif (query == "subjectdetails"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any subject details for {degree.capitalize()}")
                    elif(query == "admissiondetails"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any admission details for {degree.capitalize()}")
                    elif(query == "fees"):
                        dispatcher.utter_message(text=f"Sorry I couldn't find any fee details for {degree.capitalize()}")
                    else:
                        dispatcher.utter_message(text=f"Sorry I couldn't find any query called {query.capitalize()}")
        except Exception as ex:
            print(ex)
        return []

class ActionAskFeedback(Action):

    def name(self):
        return 'action_ask_feedback'

    def run(self, dispatcher, tracker, domain):
        try:
            dispatcher.utter_message(text=f"Enter your feedback")
        except Exception as ex:
            print(ex)
        return []

class ActionProvideFeedback(Action):

    def name(self):
        return 'action_provide_feedback'

    def run(self, dispatcher, tracker, domain):
        try:
            feedback = tracker.get_slot('feedback')
            print("Feedback:",feedback)
            dbcon().insert_user_feedback(feedback)
            dispatcher.utter_message(text=f"Thank you for your feedback :)")
        except Exception as ex:
            print(ex)
        return []

class ActionAskEmail(Action):

    def name(self):
        return 'action_ask_email'
    
    def run(self, dispatcher, tracker, domain):
        try:
            pass
        except Exception as ex:
            print(ex)
        return []

class ValidateProgramForm(FormValidationAction):
    def name(self) -> Text:
        return "validate_program_form"

    @staticmethod
    def grade_level_db() -> List[Text]:
        # function returns list of all grade level
        results = dbcon().get_all_grade_level()
        temp = []
        for i in results:
            for j in i:
                temp.append(j)
        return temp

    @staticmethod
    def program_db() -> List[Text]:
        # fuctions returns list of all program
        results = dbcon().get_all_program()
        temp = []
        for i in results:
            for j in i:
                temp.append(j)
        return temp

    @staticmethod
    def degree_db() -> List[Text]:
        # fuctions returns list of all degree
        results = dbcon().get_all_degree()
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

    def validate_grade_level(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate grade level value."""
        if (slot_value.lower() in self.grade_level_db()):
            # validation succeeded, set the value of the "grade level" slot to value
            ret = {"grade_level": slot_value}
            if (slot_value.lower() in ["diploma", "postgraduatediploma", "phd"]):
                ret["degree"] = "na"
            return ret
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"grade_level": None}

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
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"program": None}

    def validate_degree(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate degree value."""

        if (slot_value.lower() in self.degree_db()):
            # validation succeeded, set the value of the "degree" slot to value
            return {"degree": slot_value}
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"degree": None}

    def validate_query(
        self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
    ) -> Dict[Text, Any]:
        """Validate query value."""

        if (slot_value.lower() in self.query_db()):
            # validation succeeded, set the value of the "query" slot to value
            return {"query": slot_value}
        else:
            # validation failed, set this slot to None so that the
            # user will be asked for the slot again
            dispatcher.utter_message(
                text=f"Sorry I couldn't find any information on {slot_value}")
            return {"query": None}
