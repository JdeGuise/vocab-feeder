import { useState } from "react";
import * as Constants from "../../constants/constants";

import {
  Table,
  Header,
  HeaderRow,
  HeaderCell,
  Body,
} from "@table-library/react-table-library/table";
import vocabDeckTableStyles from "./VocabDeckTable.module.css";
import { useTheme } from "@table-library/react-table-library/theme";

import { usePagination } from "@table-library/react-table-library/pagination";
import TableSearch from "./TableSearch/TableSearch";
import TableFooter from "./TableFooter/TableFooter";
import VocabDeckEntry from "../VocabDeckEntry/VocabDeckEntry";
import Modal from "../VocabDeckDeleteRecordModal/VocabDeckDeleteRecordModal";

const VocabTable = ({
  data,
  LIMIT,
  editForm,
  showEditRecordForm,
  showDeleteRecordForm,
  setShowAddRecordForm,
  setEditForm,
  setShowEditRecordForm,
  setDeleteForm,
  setShowDeleteRecordForm,
  handleDeleteRecord,
}) => {
  const theme = useTheme({
    HeaderRow: `
        background-color: #eaf5fd;
        .th {
          border-bottom: 1px solid #a0a8ae;
        }
      `,
    Row: `
        &:nth-of-type(odd) {
          background-color: #d2e9fb;
        }

        &:nth-of-type(even) {
          background-color: #eaf5fd;
        }
      `,
    BaseCell: `
        padding: 11px;
      `,
    Cell: `
        &:not(:last-of-type) {
          border-right: 1px solid #a0a8ae;
        }
      `,
  });

  const columns = [
    {
      label: "Dutch",
      field: "dutch",
    },
    {
      label: "English",
      field: "english",
    },
    {
      label: "Pronunciation URL",
      field: "pronunciationlink",
    },
    {
      label: "Notes",
      field: "notes",
    },
    {
      label: "Category",
      field: "set_name",
    },
    {
      label: "Actions",
      field: "editBtn",
    },
  ];

  const [search, setSearch] = useState("");

  const handleSearch = (event) => {
    setSearch(event.target.value);
  };

  // capture the vocab you wish to edit, set to state
  const captureEdit = (clickedVocab) => {
    let filtered = data.filter((vocab) => vocab.id === clickedVocab.id);
    setEditForm(filtered[0]);
  };

  // capture the vocab you wish to delete, set to state
  const captureDelete = (clickedVocab) => {
    let filtered = data.filter((vocab) => vocab.id === clickedVocab.id);
    setDeleteForm(filtered[0]);
  };

  const checkFieldsForSearchTerm = (vocabRecord, lowercaseSearch) => {
    const possibleSearchParams = Constants.SEARCH_FIELDS.map((field) => vocabRecord[field]?.toLowerCase());

    return possibleSearchParams.some(
      field => field?.includes(lowercaseSearch)
    );
  };

  const currentData = {
    nodes: data.filter(
      (vocabRecord) => checkFieldsForSearchTerm(vocabRecord, search.toLowerCase())
    )
  };

  const pageCount = parseInt(data.length / LIMIT) + 1;
  const pagination = usePagination(currentData, {
    state: {
      page: 0,
      size: LIMIT,
    },
  });

  const changeAddState = () => {
    setShowAddRecordForm((addRecord) => !addRecord); // shows the form
  };

  // needed logic for conditional rendering of the form - shows the vocab you want when you want them, and hides it when you don't
  const changeEditState = (vocab) => {
    if (vocab.id === editForm.id || !showEditRecordForm) {
      setShowEditRecordForm((showEditRecordForm) => !showEditRecordForm); // hides the form
    }
  };

  // needed logic for conditional rendering of the form - shows the vocab you want when you want them, and hides it when you don't
  const changeDeleteState = (vocab) => {
    setShowDeleteRecordForm((showDeleteRecordForm) => !showDeleteRecordForm);
  };

  return (
    <>
      <TableSearch
        styles={vocabDeckTableStyles}
        handleSearch={handleSearch}
        searchValue={search}
      />

      <div className={vocabDeckTableStyles.vocabEntryBtn}>
        <button
          onClick={() => {
            changeAddState();
          }}
        >
          {Constants.ADD_VOCAB_ENTRY_LABEL}
        </button>
      </div>

      <div className={vocabDeckTableStyles.wrapper}>
        <Table data={currentData} theme={theme} pagination={pagination}>
          {(tableList) => (
            <>
              <Header>
                <HeaderRow>
                  {columns.map((column) => (
                    <HeaderCell key={column.field}>{column.label}</HeaderCell>
                  ))}
                </HeaderRow>
              </Header>

              <Body>
                {tableList.map((vocab) => (
                  <VocabDeckEntry
                    key={vocab.id}
                    vocab={vocab}
                    captureEdit={captureEdit}
                    changeEditState={changeEditState}
                    captureDelete={captureDelete}
                    changeDeleteState={changeDeleteState}
                  />
                ))}
              </Body>
            </>
          )}
        </Table>

        <TableFooter pagination={pagination} pageCount={pageCount} />
      </div>
      {showDeleteRecordForm && (
        <Modal
          setDeleteRecord={setShowDeleteRecordForm}
          handleDeleteRecord={handleDeleteRecord}
        />
      )}
    </>
  );
};

export default VocabTable;