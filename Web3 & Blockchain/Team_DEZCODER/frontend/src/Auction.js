//custom style
import "./App.css";
//react hooks
import { useState } from "react";
//React-Bootstrap components
import Nav from 'react-bootstrap/Nav';
import NavLink from "react-bootstrap/NavLink";
import NavItem from "react-bootstrap/NavItem";
import Form from 'react-bootstrap/Form';
import InputGroup from 'react-bootstrap/InputGroup';
import Button from 'react-bootstrap/Button';
import Spinner from 'react-bootstrap/Spinner';
//external js pages
import Welcome from "./Welcome";
//web3
const Web3 = require('web3');

export default function Auction({currentAddress,isConnect,contract,changingNFT}) {
    const [activeKey, setActiveKey] = useState("create");
    const addrVal = (isConnect? trim(currentAddress) : "Not Connected");

    // const [cA, setCA] = useState("");
    // const [isConnect, setConnected] = useState(0);

    const [allright, setAllRight] = useState(0);
    const [ip1,setip1] = useState("");
    const [ip2,setip2] = useState("");
    const [ip3,setip3] = useState("");
    const [ip4,setip4] = useState("");
    const [ip5,setip5] = useState("");
    const [ip6,setip6] = useState("");
    const [eventData,setEventData] = useState(null);
    const [endAuction,setEndAuction] = useState(null);
    const [bidplaced,setbidplaced] = useState(null);
    const [isClicked,setIsClicked] = useState(0);

    function trim(addr) {
        if (addr != null) {
          let addr1 = addr.toUpperCase();
          return (addr1.substring(0, 8) + "...." + addr1.substring(37));
        }
    }

    const handleSelect = (key) => {
        setActiveKey(key);
    };
    
    function showSuccessMessage() {
        alert("SUCCESS");
    }
    function showErrorMessage(text1) {
        alert(text1);
    }

    const handleChange = (p) => {
        const string1 = p.target.value;
        if (p.target.id === 'NFTCA') {
            setip1(string1);
            // console.log(ip1);
        }
        if (p.target.id === 'NFTID') {
            setip2(string1);
            // console.log(ip2);
        }
        if (p.target.id === 'price') {
            setip3(string1);
            // console.log(ip3);
        }
        if (p.target.id === 'duration') {
            setip4(string1);
            // console.log(ip4);
        }
        if (p.target.id === 'AID') {
            setip5(string1);
            // console.log(ip4);
        }
        if (p.target.id === 'Aamt') {
            setip6(string1);
            // console.log(ip3);
        }
    }

    async function myCreateAuction(){
        if(isConnect && contract){
            try{
                const price = Web3.utils.toWei(ip3,"ether");
                // const tinMin = Number(ip4);
                // const duration = tinMin*60;
                // const dr = duration.toString();
                // await changingNFT.methods.approveTransfer('0x52e7a9ae9c3f1af7de26708ed054f8f745e0fa6d',ip2).send({from:currentAddress})
                // .on('transactionHash', function(hash){
                //     console.log("Confirm transaction with hash ",hash);
                // });

                await contract.methods.createAuction(ip1,ip2,price,ip4).send({from:currentAddress})
                .on('transactionHash', function(hash){
                    console.log("Confirm transaction with hash ",hash);
                });
            }
            catch(error){
                console.log(error);
            }
        }
    }

    async function myPlaceBid(){
        if(isConnect && contract){
        try{
            const amt = Web3.utils.toWei(ip6,'ether');
            await contract.methods.placeBid(ip5,amt).send({from:currentAddress})
            .on('transactionHash', function(hash){
                console.log("Confirm transaction with hash ",hash);
            });
        } catch(error){
            console.log(error);
        }
        }
    }

    const renderPage = (key) => {
        switch (key) {
            case "create":
                return (
                    <>
                        <InputGroup className="mb-3">
                            <InputGroup.Text id="inputGroup-sizing-default">
                                NFT Contract Address
                            </InputGroup.Text>
                            <div className="form-control-container">
                            <Form.Control
                                aria-label="Default"
                                aria-describedby="inputGroup-sizing-default"
                                inputMode="text"
                                placeholder="0X0000"
                                id='NFTCA'
                                className="ipbox"
                                onChange={handleChange}
                            />
                            </div>
                        </InputGroup>
                        <InputGroup className="mb-3">
                            <InputGroup.Text id="inputGroup-sizing-default">
                                Token ID
                            </InputGroup.Text>
                            <div className="form-control-container">
                            <Form.Control
                                aria-label="Default"
                                aria-describedby="inputGroup-sizing-default"
                                inputMode="text"
                                placeholder="1"
                                className="ipbox"
                                id='NFTID' onChange={handleChange}
                            />
                            </div>
                        </InputGroup>
                        <InputGroup className="mb-3">
                            <InputGroup.Text id="inputGroup-sizing-default">
                            Price(ETH)
                            </InputGroup.Text>
                            <div className="form-control-container">
                            <Form.Control
                                aria-label="Default"
                                aria-describedby="inputGroup-sizing-default"
                                inputMode="number"
                                placeholder="(in ETH)"
                                className="ipbox"
                                id='price' onChange={handleChange}
                            />
                            </div>
                        </InputGroup>
                        <InputGroup className="mb-3">
                            <InputGroup.Text id="inputGroup-sizing-default">
                            Duration(MIN)
                            </InputGroup.Text>
                            <div className="form-control-container">
                            <Form.Control
                                aria-label="Default"
                                aria-describedby="inputGroup-sizing-default"
                                inputMode="text"
                                placeholder="1"
                                className="ipbox"
                                id='duration' onChange={handleChange}
                            />
                            </div>
                        </InputGroup>
                        <Button variant="secondary" onClick={myCreateAuction} style={{display:'block', position:'relative',left:'25%',margin:'5%',padding:'6px'}}>
                            {isClicked? <Spinner animation="border"/>:<>Create Auction</>}
                        </Button>
                    </>
                );
            case "placebid":
                return (
                    <>
                        <InputGroup className="mb-3">
        <InputGroup.Text id="inputGroup-sizing-default">
          Auction ID
        </InputGroup.Text>
        <div className="form-control-container">
          <Form.Control
            aria-label="Default"
            aria-describedby="inputGroup-sizing-default"
            inputMode="text"
            placeholder="1"
            className="ipbox"
            id='AID' onChange={handleChange}
          />
        </div>
      </InputGroup>

      <InputGroup className="mb-3">
        <InputGroup.Text id="inputGroup-sizing-default">
          Amount
        </InputGroup.Text>
        <div className="form-control-container">
          <Form.Control
            aria-label="Default"
            aria-describedby="inputGroup-sizing-default"
            placeholder="(in ETH)"
            id='Aamt'
            className="ipbox"
            onChange={handleChange}
            inputMode="numeric"
          />
        </div>
      </InputGroup>

                            <Button variant="secondary" id="button-addon1" onClick={myPlaceBid} style={{display:'block', position:'relative',left:'25%',margin:'5%',padding:'6px'}}>
                            {isClicked? <Spinner animation="border"/>:<>Place Bid</>}
                            </Button>
                    </>
                );
            default:
                return <Welcome />
        }
    }

    return (
        <div className="mycomp1-container">
            <div className="myNavbar2">
                <Nav variant="pills" activeKey={activeKey} onSelect={handleSelect}>
                    <NavItem>
                        <NavLink eventKey="create" className={`mynav-link ${activeKey === "create" ? "active" : ""}`}>Create Auction</NavLink>
                    </NavItem>
                    <NavItem>
                        <NavLink eventKey="placebid" className={`mynav-link ${activeKey === "placebid" ? "active" : ""}`}>Place Bid</NavLink>
                    </NavItem>
                </Nav>
            </div>
            <div className="mycomp-itm2">
                {renderPage(activeKey)}
            </div>
            <div>
                
            </div>
        </div>
    );
}