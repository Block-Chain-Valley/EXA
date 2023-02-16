import React from "react";
import "./App.css";
import Logo from "./img/EXA.png";
import Search from "./search";

function SerCon() {
  return (
    <div className="ser-con">
      <img src={Logo} className="logo" />
      <Search />
    </div>
  );
}
// SerCon 컴포넌트를 만들어서 로고 이미지랑 search formd이랑 search button 한번에 중간으로 옮겼습니다. 

export default SerCon;
