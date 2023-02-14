import Table from "./Table";
import dummy from "./data.json"

function App() {
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
  ];

  const data = []
  dummy.forEach(function (v, i) {
    data.push({
      "rank":i+1,
      //percentage
      "percentage": dummy[i].percentage,
      //high
      "BaseToken": dummy[i].high.baseToken,
      "PriceUSD": dummy[i].high.priceUsd,
      "DexID": dummy[i].high.dexId,
      "ChainID": dummy[i].high.chainId,
    })
    data.push({
      //low
      "BaseToken": dummy[i].low.baseToken,
      "PriceUSD": dummy[i].low.priceUsd,
      "DexID": dummy[i].low.dexId,
      "ChainID": dummy[i].low.chainId,
    })
  })

  return <><Table columns={columns} data={data} /></>;
}

export default App;