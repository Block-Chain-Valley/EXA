import React from "react";

function Search({ onSubmit }) {
  const handleSubmit = (event) => {
    event.preventDefault();
    onSubmit(event.target.elements.filter.value);
  };

  return (
    <form className="searchform" onSubmit={handleSubmit}>
      <input className = "searchinput" name="filter" />
      <button className="searchbutton" type="submit"></button>
    </form>
  );
}

export default Search;