import React from "react";
import { useTable, useGlobalFilter } from "react-table";
import Search from "./search";

function Table({ columns, data }) {
  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    rows,
    prepareRow,
    setGlobalFilter,
  } = useTable({ columns, data }, useGlobalFilter);

  return (
    <>
      <Search onSubmit={setGlobalFilter} />
      <table className = "arbitrage" {...getTableProps()}>
        <thead className = "t-head">
          {headerGroups.map((headerGroup) => (
            <tr className="t-row" {...headerGroup.getHeaderGroupProps()}>
              {headerGroup.headers.map((column) => (
                <th className="t-header" {...column.getHeaderProps()}>{column.render("Header")}</th>
              ))}
            </tr >
          ))}
        </thead>
        <tbody className="t-body" {...getTableBodyProps()}>
          {rows.map((row) => {
            prepareRow(row);
            return (
              <tr className="t-row" {...row.getRowProps()}>
                {row.cells.map((cell) => (
                  <td className="t-data" {...cell.getCellProps()}>{cell.render("Cell")}</td>
                ))}
              </tr>
            );
          })}
        </tbody>
      </table>
    </>
  );
}

export default Table;