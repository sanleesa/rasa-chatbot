# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions

import re 
import smtplib
from configparser import NoOptionError
from logging import NullHandler, setLoggerClass
from typing import Any, Text, Dict, List
from dns.rdatatype import NULL
from dns.tsig import validate
from rasa_sdk import Action, Tracker, FormValidationAction
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import AllSlotsReset, SlotSet, UserUtteranceReverted
from rasa_sdk.types import DomainDict
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from databaseconnection import DatabaseConnection as dbcon


class ActionAskGradeLevel(Action):

    def name(self):
        return 'action_ask_grade_level'

    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            buttons = []
            l = []
            results = None
            program = tracker.get_slot('program')
            degree = tracker.get_slot('degree')
            if (program is None) and (degree is None):
                results = dbcon().get_grade_from_program(program)
            elif (program is not None) and (degree is None):
                results = dbcon().get_grade_from_program(program)
            elif (program is None) and (degree is not None):
                query1 = dbcon().get_program_from_degree_payload(degree)
                results = dbcon().get_grade_from_program_tuple(query1)
            elif (program is not None) and (degree is not None):
                query1 = dbcon().get_program_from_degree_payload(degree)
                for i in query1:
                    for j in i:
                        l.append(j)

                if (program in l):
                    results = dbcon().get_grade_from_program(program)
                    print(results)
                else:
                    ret.append(SlotSet('degree', 'na'))
                    
            else:
                results = dbcon().get_grade_level_list()

            if (results is None) or (len(results) == 0):
                dispatcher.utter_message(
                    text="Sorry I couldn't find any grade levels :(")
                return []
            # if (len(results) <= 1):
            #     ret.append(SlotSet('grade_level', results[0][1]))
            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Please select grade level:", buttons=buttons, button_type="vertical")

        except Exception as ex:
            print("ActionAskGradeLevel:", ex)
        return ret


class ActionAskProgram(Action):

    def name(self):
        return 'action_ask_program'

    def run(self, dispatcher, tracker, domain):
        try:
            ret = []
            buttons = []
            results = None
            grade_level = tracker.get_slot('grade_level')
            degree = tracker.get_slot('degree')

            if (grade_level is not None) and (degree is None):
                results = dbcon().get_program_list(grade_level)
            elif (grade_level is not None) and (degree is not None):
                if (degree == 'na'):
                    results = dbcon().get_program_list(grade_level)
                else:
                    results = dbcon().get_program_from_degree(degree)
                    # val = dbcon().get_program_from_grade_program(degree, grade_level)
                    # ret.append(SlotSet('program', str(val[0][0])))
            else:
                results = dbcon().get_program_list(grade_level)

            if (results is None) or (len(results) == 0):
                dispatcher.utter_message(
                    text="Sorry I couldn't find any programs :(")
                return []

            for list in results:
                buttons.append({"title": list[0], "payload": list[1]})
            dispatcher.utter_message(
                text="Please select a program", buttons=buttons, button_type="vertical")
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

            if (grade_level in ["diploma", "postgraduatediploma", "phd"]):
                ret.append(SlotSet('degree', 'na'))
            buttons = []

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
            program_title = dbcon().get_program_title_from_grade_program(grade_level, program)
            degree_title = dbcon().get_degree_title_from_program_degree(program, degree)
            print(degree_title)
            if (results[0][0] != ""):
                dispatcher.utter_message(text=results[0][0])
            else:
                if (grade_level in ["diploma", "postgraduatediploma", "phd"]):
                    if (query == "faq"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any FAQs for {program_title[0][0]}")
                    elif (query == "subjectdetails"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any subject details for {program_title[0][0]}")
                    elif(query == "admissiondetails"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any admission details for {program_title[0][0]}")
                    elif(query == "fees"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any fee details for {program_title[0][0]}")
                    else:
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any query called {query.capitalize()}")
                else:
                    if (query == "faq"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any FAQs for {degree.capitalize()}")
                    elif (query == "subjectdetails"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any subject details for {degree.capitalize()}")
                    elif(query == "admissiondetails"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any admission details for {degree.capitalize()}")
                    elif(query == "fees"):
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any fee details for {degree.capitalize()}")
                    else:
                        dispatcher.utter_message(
                            text=f"Sorry I couldn't find any query called {query.capitalize()}")
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
            print("Feedback:", feedback)
            dbcon().insert_user_feedback(feedback)
            dispatcher.utter_message(text=f"Thank you for your feedback :)")
        except Exception as ex:
            print(ex)
        return []


class ActionAskEmailaddr(Action):

    def name(self):
        return 'action_ask_emailaddr'

    def run(self, dispatcher, tracker, domain):
        try:
            buttons = []
            results = dbcon().get_email_list()
            if (results != []):
                for list in results:
                    buttons.append({"title": list[0], "payload": list[1]})
                dispatcher.utter_message(
                    text="To who would you like to send an email to:", buttons=buttons, button_type="vertical")
            else:
                dispatcher.utter_message(
                    text="Sorry I couldn't find any emails :(")
        except Exception as ex:
            print(ex)
        return []

class ActionAskUserEmailaddr(Action):

    def name(self):
        return 'action_ask_user_emailaddr'

    def run(self, dispatcher, tracker, domain):
        try:
            dispatcher.utter_message(
                text=f"Enter your email address this is so that person you want to email writes back to you")
        except Exception as ex:
            print(ex)
        return []


class ActionAskSubject(Action):

    def name(self):
        return 'action_ask_subject'

    def run(self, dispatcher, tracker, domain):
        try:
            dispatcher.utter_message(text=f"Enter a subject for your email:")
        except Exception as ex:
            print(ex)
        return []


class ActionAskMessage(Action):

    def name(self):
        return 'action_ask_message'

    def run(self, dispatcher, tracker, domain):
        try:
            dispatcher.utter_message(text=f"Enter your email's message:")
        except Exception as ex:
            print(ex)
        return []


class ActionSendEmail(Action):

    def name(self):
        return 'action_send_email'

    def run(self, dispatcher, tracker, domain):
        try:
            receiver_email = tracker.get_slot('emailaddr')
            user_email = tracker.get_slot('user_emailaddr')
            subject = tracker.get_slot('subject')
            user_message = tracker.get_slot('message')
            print("receiver_email:", receiver_email,"user_email:",user_email,"subject:",subject,"user_message:",user_message)

            receiver_address = receiver_email

            mail_content = """ Hi you have received a messages from {}
            \nMessage: {}
            \nSent with Tora"""

            mail_content = mail_content.format(user_email, user_message)
            sender_address = 'torachatbot@gmail.com'
            sender_pass = 'Test4.?12#'
            message = MIMEMultipart()
            message['From'] = sender_address
            message['To'] = receiver_address
            message['Subject'] = subject
            message.attach(MIMEText(mail_content, 'plain'))
            session = smtplib.SMTP('smtp.gmail.com', 587)
            session.starttls()
            session.login(sender_address, sender_pass)
            text = message.as_string()
            session.sendmail(sender_address, receiver_address, text)
            print("Email Sent")
            session.quit()

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


class ValidateEmailForm(FormValidationAction):

    def name(self) -> Text:
        return "validate_email_form"

    def validate_emailaddr(self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
                           ) -> Dict[Text, Any]:
        """Validate Email Address."""
        email = re.search("[\\w\\.]{2,}@[\\w]+\\.[\\w]{2,3}", slot_value)
        if email != None:
            return {"emailaddr": email.group(0)}
        else:
            return {"emailaddr": None}

    def validate_subject(self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
                         ) -> Dict[Text, Any]:
        """Validate Email Address."""
        if slot_value != None:
            return {"emailaddr": slot_value}
        else:
            return {"emailaddr": None}

    def validate_message(self, slot_value: Any, dispatcher: CollectingDispatcher, tracker: Tracker, domain: DomainDict,
                         ) -> Dict[Text, Any]:
        """Validate Email Address."""
        if slot_value != None:
            return {"emailaddr": slot_value}
        else:
            return {"emailaddr": None}
