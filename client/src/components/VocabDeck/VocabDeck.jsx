// @/src/components/VocabDeck/VocabDeck.jsx
import { useState } from "react";
import styles from "./VocabDeck.module.css";

import VocabDeckEditVocab from "../VocabDeckEditVocab/VocabDeckEditVocab";
import VocabDeckAddVocab from "./../VocabDeckAddVocab/VocabDeckAddVocab";
import VocabDeckTable from "../VocabDeckTable/VocabDeckTable";
import * as Constants from "../../constants/constants";

const VocabDeck = ({
  data,
  LIMIT,
  onCreateVocab,
  onUpdateVocab,
  setRefetch,
}) => {
  // state for edit form inputs
  const [editForm, setEditForm] = useState(Constants.EMPTY_VOCAB_FORM);
  const [showEditRecordForm, setShowEditRecordForm] = useState(false);

  // state for add form inputs
  const [addForm, setAddForm] = useState(Constants.EMPTY_VOCAB_FORM);
  const [showAddRecordForm, setShowAddRecordForm] = useState(false);

  // state for delete form inputs
  const [deleteForm, setDeleteForm] = useState(Constants.EMPTY_VOCAB_FORM);
  const [showDeleteRecordForm, setShowDeleteRecordForm] = useState(false);

  // capture user input in edit form inputs
  const handleEditChange = (e) => {
    setEditForm({
      ...editForm,
      [e.target.name]: e.target.value,
    });
  };

  // capture user input in add form inputs
  const handleAddChange = (e) => {
    setAddForm({
      ...addForm,
      [e.target.name]: e.target.value,
    });
  };

  const handleCancel = () => {
    setShowAddRecordForm(false);
    setAddForm(Constants.EMPTY_VOCAB_FORM);
    setShowEditRecordForm(false);
    setEditForm(Constants.EMPTY_VOCAB_FORM);
  };

  // POST request; calls handleVocabCreate to push changes to the page
  const handleDeleteRecord = () => {
    fetch(Constants.VOCAB_RECORDS_ENDPOINT, {
      method: Constants.DELETE_METHOD,
      body: JSON.stringify(deleteForm),
    })
      .then((res) => res.json())
      .then(() => {
        setRefetch((prevState) => !prevState);
      })
      .catch((err) => {
        console.error(Constants.ERROR_STR, err);
      });
  };

  let datatableMarkup;
  if (showEditRecordForm) {
    datatableMarkup = (
      <VocabDeckEditVocab
        editForm={editForm}
        handleEditChange={handleEditChange}
        handleCancel={handleCancel}
        setShowEditRecordForm={setShowEditRecordForm}
        onUpdateVocab={onUpdateVocab}
        styles={styles}
      />
    );
  } else if (showAddRecordForm) {
    datatableMarkup = (
      <VocabDeckAddVocab
        addForm={addForm}
        setAddForm={setAddForm}
        handleAddChange={handleAddChange}
        handleCancel={handleCancel}
        setShowAddRecordForm={setShowAddRecordForm}
        onCreateVocab={onCreateVocab}
        styles={styles}
      />
    );
  } else {
    datatableMarkup = (
      <VocabDeckTable
        data={data}
        LIMIT={LIMIT}
        editForm={editForm}
        showEditRecordForm={showEditRecordForm}
        showDeleteRecordForm={showDeleteRecordForm}
        setShowAddRecordForm={setShowAddRecordForm}
        setEditForm={setEditForm}
        setShowEditRecordForm={setShowEditRecordForm}
        setDeleteForm={setDeleteForm}
        setShowDeleteRecordForm={setShowDeleteRecordForm}
        handleDeleteRecord={handleDeleteRecord}
      />
    );
  }

  return <>{datatableMarkup}</>;
};

export default VocabDeck;