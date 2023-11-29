import { Row, Cell } from "@table-library/react-table-library/table";
import * as Constants from "../../constants/constants";

const Vocab = ({
  vocab,
  vocab: { id, dutch, english, pronunciationlink, notes, set_name },
  captureEdit,
  changeEditState,
  captureDelete,
  changeDeleteState,
}) => {
  return (
    <Row key={id} item={vocab}>
      <Cell>{dutch}</Cell>
      <Cell>{english}</Cell>
      <Cell>{pronunciationlink}</Cell>
      <Cell>{notes}</Cell>
      <Cell>{set_name}</Cell>
      <Cell>
        <button
          onClick={() => {
            captureEdit(vocab);
            changeEditState(vocab);
          }}
        >
          {Constants.EDIT_BTN_LABEL}
        </button>
        <button
          onClick={() => {
            captureDelete(vocab);
            changeDeleteState(vocab);
          }}
        >
          {Constants.DELETE_BTN_LABEL}
        </button>
      </Cell>
    </Row>
  );
};

export default Vocab;