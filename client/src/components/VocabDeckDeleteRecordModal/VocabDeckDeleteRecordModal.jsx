// @src/components/VocabDeckWrapperDeleteRecordModal.jsx
import styles from "./VocabDeckDeleteRecordModal.module.css";
import * as Constants from "../../constants/constants.js";

const VocabDeckWrapperDeleteRecordModal = ({ setDeleteRecord, handleDeleteRecord }) => {
  return (
    <>
      <div className={styles.darkBG} onClick={() => setDeleteRecord(false)} />
      <div className={styles.centered}>
        <div className={styles.modal}>
          <div className={styles.modalHeader}>
            <h5 className={styles.heading}>{Constants.CONFIRM_DELETE_MSG}</h5>
          </div>
          <button
            className={styles.closeBtn}
            onClick={() => setDeleteRecord(false)}
          >
            {Constants.CANCEL_BTN_X}
          </button>
          <div className={styles.modalContent}>
            {Constants.RECORD_DELETE_CONFIRM}
          </div>
          <div className={styles.modalActions}>
            <div className={styles.actionsContainer}>
              <button
                className={styles.deleteBtn}
                onClick={() => {
                  setDeleteRecord(false);
                  handleDeleteRecord();
                }}
              >
                {Constants.DELETE_BTN_LABEL}
              </button>
              <button
                className={styles.cancelBtn}
                onClick={() => setDeleteRecord(false)}
              >
                {Constants.CANCEL_BTN_LABEL}
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default VocabDeckWrapperDeleteRecordModal;