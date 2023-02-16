import React from "react";
import "./Navbar.css";

function Navbar() {
  return (
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><button className="login">Log-In</button></li>
        <li><button className="mypage">My Page</button></li>
        <li><button className="connect-wallet">Connect Wallet</button></li>
      </ul>
    </nav>
  );
}

export default Navbar;