<DB> 
[collections: Token] : 대략 660개
Token 기본 정보 csv 파일 데이터

[collections: cex]
ccxt로 불러낸 실시간 정보

[collections: dex]
dexscreener api로 불러낸 실시간 정보


<algorithm>
--병렬 처리--
ccxt로 DB 업데이트 >> 주기 : 1분에 한번씩 전체 업데이트
dexscreener로 DB 업데이트 >> 주기 : 3분에 한번씩 전체 업데이트

--병렬 처리--
DB에 쌓인 데이터를 이용하여 arbitrage 상위 30개를 JSON 파일로 변환
- telegrambot api 이용해서 쏴줌
- front-end react.js에 쏴줌