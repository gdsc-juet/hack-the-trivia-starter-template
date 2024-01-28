import './App.css';
//import Button from "react-bootstrap/esm/Button";
import Table from 'react-bootstrap/Table';
import React, { useState, useEffect } from "react";

export default function History({ contract, web3, allright, isConnect, cA }) {

  const [dEventData, setDEventData] = useState(null);
  const [tEventData, setTEventData] = useState(null);

  const convertToEthers = (amt) => {
    return web3.utils.fromWei(amt, 'ether');
  }

  function trimToETH(amt) {
    const value = amt.toString();
    const EthBal = convertToEthers(value);
    return EthBal;
  }

  async function getEventData(eventName, filter) {
    if (allright && isConnect) {
      const events = await contract.getPastEvents(eventName, {
        filter,
        fromBlock: 0,
        toBlock: 'latest'
      });

      const eventsWithTimestamp = await Promise.all(events.map(async (event) => {
        const block = await web3.eth.getBlock(event.blockNumber);
        const timestamp = ((block.timestamp).toString()) * 1000;
        return { ...event, timestamp };
      }));

      return eventsWithTimestamp;
    } else {
      return null;
    }
  }

  const renderDWEventData = (data, type) => {
    if (allright && data !== null) {
      if (data.length !== 0) {
        return (
          <>
            <Table bordered striped size='sm' variant='dark' style={{ marginTop: "1%", width: "20%" }}>
              <caption style={{ captionSide: "top", fontSize: "large", fontWeight: "600", color: "firebrick" }}>{type}</caption>
              <thead>
                <tr>
                  <th>#</th>
                  <th>Type</th>
                  <th>Amount</th>
                  <th>Time</th>
                </tr>
              </thead>
              <tbody>
                {
                  data.map((itm, index) => (
                    <React.Fragment key={index}>
                      <tr>
                        <td>{index}</td>
                        <td>{itm.returnValues[2]}</td>
                        <td>{trimToETH(itm.returnValues[1])} ETH</td>
                        <td>{formatTimestamp(itm.timestamp)}</td>
                      </tr>
                    </React.Fragment>
                  ))
                }
              </tbody>
            </Table>
          </>
        );
      } else {
        return (
          <span>No {type}</span>
        );
      }
    } else {
      return (
        <span>Not connected</span>
      );
    }
  }

  const formatTimestamp = (timestamp) => {
    const date = new Date(timestamp);
    const formattedDate = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`;
    const formattedTime = `${padZero(date.getHours())}:${padZero(date.getMinutes())}:${padZero(date.getSeconds())}`;
    return `${formattedDate} ${formattedTime}`;
  }

  const padZero = (num) => {
    return num.toString().padStart(2, '0');
  }

  const compareAddr = (addr1, addr2) => {
    const a1 = addr1.toUpperCase();
    const a2 = addr2.toUpperCase();
    if (a1 === a2) return 1;
    else return 0;
  }

  const renderTransferEventData = (data) => {
    if (data !== null) {
      if (data.length !== 0) {
        return (
          <>
            <Table bordered responsive striped size='sm' variant='dark' style={{ marginTop: "1%", width: "20%" }}>
              <caption style={{ captionSide: "top", fontSize: "large", fontWeight: "600", color: "firebrick" }}>Transfer Data</caption>
              <thead>
                <tr>
                  <th>#</th>
                  <th>From</th>
                  <th>To</th>
                  <th>Amount</th>
                  <th>Time</th>
                </tr>
              </thead>
              <tbody>
                {
                  data.map((itm, index) => (
                    <React.Fragment key={index}>
                      <tr>
                        <td>{index}</td>
                        <td>{compareAddr(itm.returnValues[0], cA) ? "My" : itm.returnValues[0]}</td>
                        <td>{compareAddr(itm.returnValues[1], cA) ? "My" : itm.returnValues[1]}</td>
                        <td>{trimToETH(itm.returnValues[2])} ETH</td>
                        <td>{formatTimestamp(itm.timestamp)}</td>
                      </tr>
                    </React.Fragment>
                  ))
                }
              </tbody>
            </Table>
          </>
        );
      } else {
        return (
          <span>No Transfer data</span>
        );
      }
    } else {
      return (
        <span>Not connected</span>
      );
    }
  }

  useEffect(() => {
    const fetchEvents = async () => {
      const dEvents = await getEventData('DW', { user: cA });
      //const wEvents = await getEventData('DW', { messege: "Withdraw"});
      const tEvents = await getEventData('Transfer', { from: cA });
      const tEvents2 = await getEventData('Transfer', { to: cA });
      const combinedEvent = tEvents.concat(tEvents2);
      // const uniqueEvents = [];
      // const seen = {};

      // combinedEvent.forEach((event) => {
      //   const eventKey = event.returnValues[0] - event.returnValues[1];
      //   if (!seen[eventKey]) {
      //     seen[eventKey] = true;
      //     uniqueEvents.push(event);
      //   }
      // });

      setDEventData(dEvents);
      //setWEventData(wEvents);
      setTEventData(combinedEvent);
      //logs for testing
      // if(dEventData!==null){
      //   console.log(dEventData[0].returnValues[0]);
      //   console.log("CA ",cA);
      // }
    };
    // if (allright && isConnect) fetchEvents();
    // eslint-disable-next-line
  }, [allright, isConnect]);

  return (
    <div className='history-container'>
        <p>THIS IS HISTORY Page</p>
      {/* {renderDWEventData(dEventData, "Deposit/Withdraw Data")} */}
      {/* {renderDWEventData(wEventData, "Withdrawal Data")} */}
      {/* {renderTransferEventData(tEventData)} */}

    </div>
  );
}
