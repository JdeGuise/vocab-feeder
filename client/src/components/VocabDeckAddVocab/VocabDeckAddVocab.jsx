import * as Constants from "../../constants/constants";

const VocabDeckWrapperAddVocab = ({
  addForm,
  setAddForm,
  handleAddChange,
  handleCancel,
  setShowAddRecordForm,
  onCreateVocab,
  styles,
}) => {
  let { dutch, english, pronunciationlink, notes, category } = addForm;

  // POST request; calls handleVocabCreate to push changes to the page
  const handleAddForm = (e) => {
    e.preventDefault();
    delete addForm.id;

    fetch(Constants.VOCAB_RECORDS_ENDPOINT, {
      method: Constants.POST_METHOD,
      body: JSON.stringify(addForm),
    })
      .then((res) => res.json())
      .then((updatedVocab) => {
        handleVocabCreate(updatedVocab);
      })
      .catch((err) => {
        console.error(Constants.ERROR_STR, err);
      });
  };

  // when PATCH request happens; auto-hides the form, pushes changes to display
  const handleVocabCreate = (updatedVocab) => {
    onCreateVocab(updatedVocab);
    setShowAddRecordForm(false);
    setAddForm(Constants.EMPTY_VOCAB_FORM);
  };

  const labels = {
    Dutch: dutch,
    English: english,
    PronunciationLink: pronunciationlink,
    Notes: notes,
    Category: category,
  };

  return (
    <div className={styles.formStyles}>
      <form onSubmit={handleAddForm}>
        <div className="form-wrapper">
          <div className={styles.formInputWrapper}>
            {Object.entries(labels).map(([key, value], i) => (
              <div className={styles.formInput} key={key}>
                <div className={styles.inputLabel}>{key}</div>
                <div>
                  <input
                    type="text"
                    name={key.toLowerCase()}
                    value={value}
                    onChange={handleAddChange}
                  />
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className={styles.formBtnRow}>
          <div className={styles.formBtns}>
            <button type="submit">{Constants.SAVE_BTN_LABEL}</button>
          </div>
          <div className={styles.formBtns}>
            <button onClick={handleCancel}>{Constants.CANCEL_BTN_LABEL}</button>
          </div>
        </div>
      </form>
    </div>
  );
};

export default VocabDeckWrapperAddVocab;