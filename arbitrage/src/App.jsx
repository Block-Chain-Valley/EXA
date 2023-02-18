import axios from 'axios';
import { useEffect, useRef, useState } from 'react';
import Navbar from './Navbar';
import Table from "./Table";

const url = 'http://3.39.64.74:8000/getArbitrage' //백엔드 API 서버 주소
const delay = 20000; //호출 간격

function useInterval(callback, delay) {
  const savedCallback = useRef();
  useEffect(() => {
    savedCallback.current = callback;
  }, [callback]);

  useEffect(() => {
    function tick() {
      savedCallback.current();
    }
    if (delay !== null) {
      savedCallback.current();
      let id = setInterval(tick, delay);
      return () => clearInterval(id);
    }
  }, [delay]);
}

function App() {

  const [dummy, setUsers] = useState([]);

  useInterval(() => {
    axios.get(url)
      .then(response => {
        setUsers(response.data);
        console.log(dummy);
      })
      .catch(error => {
        console.log(error);
      });
  }, delay);


  const columns = [
    {
      accessor: "rank",
      Header: "Rank",
    },
    {
      accessor: "percentage",
      Header: "Percentage",
    },
    {
      accessor: "BaseToken",
      Header: "Basetoken",
    },
    {
      accessor: "PriceUSD",
      Header: "PriceUSD",
    },
    {
      accessor: "DexID",
      Header: "DexID",
    },
    {
      accessor: "ChainID",
      Header: "ChainID",
    },
    {
      accessor: "PairAddress",
      Header: "PairAddress",
    },
  ];

  const data = []
  dummy.forEach(function (v, i) {
    data.push({
      "rank": i + 1,
      //percentage
      "percentage": dummy[i].percentage,
      //high
      "BaseToken": dummy[i].high.baseToken,
      "PriceUSD": dummy[i].high.priceUsd,
      "DexID": dummy[i].high.dexId,
      "ChainID": dummy[i].high.chainId,
      "PairAddress": dummy[i].high.PairAddress,
    })
    data.push({
      //low
      "BaseToken": dummy[i].low.baseToken,
      "PriceUSD": dummy[i].low.priceUsd,
      "DexID": dummy[i].low.dexId,
      "ChainID": dummy[i].low.chainId,
      "PairAddress": dummy[i].low.PairAddress,
    })
  })

  return (
    <div>
      <Navbar />
      <Table columns={columns} data={data}/>
    </div>
  );
}


export default App;