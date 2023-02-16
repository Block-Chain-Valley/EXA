import React from "react";

function Search({ onSubmit }) {
  const handleSubmit = (event) => {
    event.preventDefault();
    onSubmit(event.target.elements.filter.value);
  };

  return (
    <form className="searchform" onSubmit={handleSubmit}>
      <input type="text" placeholder="Enter the token..." className = "searchinput" name="filter" />
      <button className="searchbutton" type="submit">
      <span style={{ fontWeight: "bold" }}>검색하기</span>
      </button>
    </form>
  );
}

export default Search;