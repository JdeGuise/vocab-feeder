import SlackDailyVocabWrapper from "../components/SlackDailyVocabWrapper/SlackDailyVocabWrapper";
import ReviewVocabWrapper from "../components/ReviewVocabWrapper/ReviewVocabWrapper.js";
import Home from "../components/Home/Home";
import LessonNotesWrapper from "../components/LessonNotesWrapper/LessonNotesWrapper";
import VocabDeckWrapper from "../components/VocabDeckWrapper/VocabDeckWrapper";
import { ToastContextProvider } from "../contexts/ToastContext";

// ReviewVocabWrapper.js
export const SETNAME_QUERY_PARAM = "set_name";
export const REVIEWTYPE_QUERY_PARAM = "review_type";
export const REVIEWMODE_QUERY_PARAM = "review_mode";
export const GET_REVIEW_CATEGORIES_ENDPOINT = "/api/review-categories";
export const GET_VOCAB_FOR_CATEGORY_ENDPOINT = "/api/vocab-for-category";

// ReviewCategoryList.js
export const REVIEW_ENDPOINT = "/review";
export const REVIEW_ENDPOINT_SETNAME_PARAM =
  REVIEW_ENDPOINT + "?" + SETNAME_QUERY_PARAM + "=";
export const REVIEW_ENDPOINT_REVIEW_TYPE_PARAM =
  REVIEW_ENDPOINT + "?" + REVIEWTYPE_QUERY_PARAM + "=";
export const REVIEW_ENDPOINT_REVIEW_MODE_PARAM =
  REVIEW_ENDPOINT + "?" + REVIEWMODE_QUERY_PARAM + "=";
export const CHOOSE_CATEGORY_LABEL = "Choose a category";
export const REVIEW_ALL_CATEGORY_LABEL = "Review All";

// SlackDailyVocabWrapper.js
export const GET_SLACK_INFO_ENDPOINT = "/api/slack-info";
export const SEND_SLACK_MSG_ENDPOINT = "/api/slack-message";
export const SLACK_ENDPOINT = "/slack";
export const SLACK_APP_HEADER = "Slack App";
export const SLACK_INPUT_PLACEHOLDER = "# of Records to Send";
export const SLACK_SENT_CONFIRMATION = "Your vocab has been sent to Slack!";
export const SLACK_RECORD_MIN = 1;
export const SLACK_RECORD_MAX = 25;

// ReviewVocabCardSession.js
export const VOCAB_CARD_PREV_BUTTON_STR = "❮ Prev";
export const VOCAB_CARD_NEXT_BUTTON_STR = "Next ❯";
export const VOCAB_CARD_FLIP_BUTTON_STR = "Flip";

export const VOCAB_CARD_ANSWER_PLACEHOLDER = "Enter your answer.";
export const VOCAB_CARD_SUBMIT_BUTTON_STR = "Submit";
export const VOCAB_CARD_ORIGINAL_BUTTON_CSS =
  "vocab-card-controls-btn vocab-card-controls-flip-btn";
export const VOCAB_CARD_DISABLED_BUTTON_CSS =
  "vocab-card-controls-btn vocab-card-controls-disable-btn";

export const SHOW_CARD_SIDE_CSS = "vocab-card-show-side";
export const HIDE_CARD_SIDE_CSS = "vocab-card-hide-side";
export const HIDE_NEXT_BTN_CSS = "vocab-card-hide-next-btn";
export const HIDE_PREV_BTN_CSS = "vocab-card-hide-prev-btn";

export const VOCAB_CARD_REVIEW_PRACTICE_LABEL = "Practice";
export const VOCAB_CARD_REVIEW_PRACTICE_STR =
  VOCAB_CARD_REVIEW_PRACTICE_LABEL.toLowerCase();
export const VOCAB_CARD_REVIEW_TEST_LABEL = "Test";
export const VOCAB_CARD_REVIEW_TEST_STR =
VOCAB_CARD_REVIEW_TEST_LABEL.toLowerCase();

export const VOCAB_CARD_CORRECT_ANSWER_MSG = "That's Right!";
export const VOCAB_CARD_INCORRECT_ANSWER_MSG = "Incorrect.";
export const VOCAB_CARD_CORRECT_CSS = "showCorrect";
export const VOCAB_CARD_INCORRECT_CSS = "showIncorrect";
export const VOCAB_CARD_IMAGE_NEEDED_NAME = "image-needed.png";



// ReviewVocabCardSessionTest.js
export const DONE_LABEL = 'Done';

// ReviewLessonNotes.js
export const LESSON_NOTES_TITLE = "Lesson Notes";
export const GET_LESSON_PEOPLE_NAMES_ENDPOINT = "/api/lesson-people-names";
export const PERSON_QUERY_PARAM = "person";
export const LESSONDATE_QUERY_PARAM = "lessondate";
export const LESSONS_ENDPOINT = "/lessons";
export const LESSON_ENDPOINT_PERSON_PARAM =
  LESSONS_ENDPOINT + "?" + PERSON_QUERY_PARAM + "=";

// VocabDeckWrapper.js
export const DECK_TITLE = "Vocab Entries";
export const DECK_ENDPOINT = "/deck";
export const VOCAB_RECORDS_ENDPOINT = "/api/vocab";
export const VOCAB_DECK_PAGE_LIMIT = "10";
export const TOAST_UPDATE_MSG = "Vocab successfully updated.";
export const TOAST_CREATE_MSG = "Vocab successfully created.";
export const TOAST_DELETE_MSG = "Vocab successfully deleted.";

// VocabDeckTable.jsx
export const ADD_VOCAB_ENTRY_LABEL = "Add Vocab Entry";
export const SEARCH_FIELDS = ["dutch", "english", "notes", "pronunciationlink", "set_name"];

// VocabDeckEntry.js
export const EDIT_BTN_LABEL = "Edit";

// VocabDeckWrapperAddVocab.js
export const SAVE_BTN_LABEL = "Save";
export const CANCEL_BTN_LABEL = "Cancel";

// VocabDeckWrapperDeleteRecordModal.js
export const CANCEL_BTN_X = "X";
export const DELETE_BTN_LABEL = "Delete";
export const CONFIRM_DELETE_MSG = "Confirm Deletion";
export const RECORD_DELETE_CONFIRM = "Are you sure you want to delete the vocab record?";

// TableSearch.jsx
export const TABLE_SEARCH_PLACEHOLDER = "Enter a search term";

// AWS
export const S3_BUCKET_URL =
  "https://vocab-feeder.s3.eu-west-3.amazonaws.com/vocab-images/";

// Generic
export const ERROR_STR = "Error: ";
export const GET_METHOD = "GET";
export const POST_METHOD = "POST";
export const PATCH_METHOD = "PATCH";
export const DELETE_METHOD = "DELETE";
export const CONTENT_TYPE_JSON_UTF8 = "application/json; charset=UTF-8";
export const LOADING_STR = "Loading...";
export const ROOT_ENDPOINT = "/";
export const EMPTY_VOCAB_FORM = {
  id: "",
  dutch: "",
  english: "",
  pronunciationlink: "",
  notes: "",
  category: "",
};

// App.js
export const APP_HEADER_TITLE = "De Nederlandse App";
export const ROUTES = [
  {
    route: ROOT_ENDPOINT,
    linkLabel: "Home",
    element: <Home />,
  },
  {
    route: SLACK_ENDPOINT,
    linkLabel: "Slack",
    element: <SlackDailyVocabWrapper />,
  },
  {
    route: REVIEW_ENDPOINT,
    linkLabel: "Review",
    element: <ReviewVocabWrapper />,
  },
  {
    route: LESSONS_ENDPOINT,
    linkLabel: "Notes",
    element: <LessonNotesWrapper />,
  },
  {
    route: DECK_ENDPOINT,
    linkLabel: "Deck",
    element: <ToastContextProvider><VocabDeckWrapper/></ToastContextProvider>,
  },
];