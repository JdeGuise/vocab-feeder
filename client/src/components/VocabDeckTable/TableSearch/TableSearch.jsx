import * as Constants from "../../../constants/constants";

const TableSearch = ({ styles, handleSearch, searchValue }) => {
    return (
      <>
        <div className={styles.searchWrapper}>
          <label htmlFor="search">
            <input
              id="search"
              type="text"
              placeholder={Constants.TABLE_SEARCH_PLACEHOLDER}
              onChange={handleSearch}
              value={searchValue}
            />
          </label>
        </div>
      </>
    );
  };
  
  export default TableSearch;