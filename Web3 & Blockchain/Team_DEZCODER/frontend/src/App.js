//Styles
import "./App.css";
//JS library
import { useState, useEffect } from "react";
//logo
import { ReactComponent as AppLogo } from './applogo.svg';
//React-Bootstrap
import Nav from "react-bootstrap/Nav";
import NavLink from "react-bootstrap/NavLink";
import NavItem from "react-bootstrap/NavItem";
import Button from 'react-bootstrap/Button';
//External js pages
import ABI from './abi/NFTAuction.json';
import History from "./History";
import Welcome from "./Welcome";
import Auction from "./Auction";
//Web3 library
import Web3 from 'web3';

export default function App() {
  const [activeKey, setActiveKey] = useState("0");
  const [currentAddress, setCurrentAddress] = useState('');
  const [isConnect, setConnected] = useState(0);
  const [web3Provider, setWeb3Provider] = useState(null);
  const [web3, setWeb3] = useState(null);
  const [contract,setContract] = useState({});
  const [allright,setAllRight] = useState(0);
  const [accBal, setAccBal] = useState('');
  const isMobile = window.innerWidth <= 768;

  //Web3 components
  const handleDisconnect = (accounts) => {
    if (accounts.length === 0) {
      setCurrentAddress("");
      setConnected(0);
    } else {
      setCurrentAddress(accounts[0]);
      setConnected(1);
    }
    window.location.reload();
  };

  const handleChainChanged = (chainId) => {
    // If the chain is changed to Sepolia Testnet network, don't do anything.
    if (chainId === `0x${Number(80001).toString(16)}`) return; // chain id is received in hexadecimal

    // chain is changed to any other network, reload the page.
    // On reload, checkConnection will run due to useEffect.
    // Inside of that function, we are asking user to switch to Sepolia Testnet network.
    window.location.reload();
  };

  const addNetwork = () => {
    const network = {
      chainId: `0x${Number(80001).toString(16)}`,
      chainName: "Mumbai",
      rpcUrls: ["https://polygon-mumbai.infura.io/v3/4458cf4d1689497b9a38b1d6bbf05e78"],
      nativeCurrency: {
        name: "MATIC",
        symbol: "MATIC",
        decimals: 18,
      }
    };
    // const network = {
    //   chainId: `0x${Number(11155111).toString(16)}`,
    //   chainName: "Sepolia",
    //   rpcUrls: ["https://endpoints.omniatech.io/v1/eth/sepolia/public"],
    //   nativeCurrency: {
    //     name: "SepoliaETH",
    //     symbol: "SepoliaETH",
    //     decimals: 18,
    //   }
    // };
    //Request to add network
    web3Provider
      .request({
        method: "wallet_addEthereumChain",
        params: [network],
      })
      .then(() => {
        console.log("Network added successfully");
      })
      .catch((error) => {
        console.error("Failed to add network:", error);
      })
  };

  const checkConnection = async () => {
    try {
      await web3Provider.request({
        method: "wallet_switchEthereumChain",
        params: [{ chainId: `0x${Number(80001).toString(16)}` }],
        jsonrpc: '2.0',
      });
    } catch (error) {
      console.log(error);
      // If there was error switching, code 4902 represents that Sepolia Testnet network is not added to metamask, so method below will pre-fill the network details and ask user to add the network.
      if (error.code === 4902) {
        addNetwork();
      }
      if (error.code === -32002) {
        alert("Open Metamask");
      }
    }
  };

  const walletConnect = async () => {
    try {
      if (web3Provider!== null) {

        const accounts = await web3Provider.request({
          method: "eth_requestAccounts",
        });
        setCurrentAddress(accounts[0]);
        setConnected(1);
      }
    } catch (error) {
      console.log(error);
    }
    //log for current Address
    // console.log("Current Address: ", currentAddress);
  };

  function trimAddr(addr) {
    if (addr !== '') {
      let addr1 = addr.toUpperCase();
      return ("✅" + addr1.substring(0, 4) + "xxxx" + addr1.substring(37));
    }
  }

  const getContract = async() =>{
    if(web3Provider != null && web3 != null){
      const contractAddress = '0x37cf3f31fe4714bdf4329d3facbc317c805e24a7';
      const contractABI = ABI.abi;
      const cs = new web3.eth.Contract(contractABI,contractAddress);
      setContract(cs);
      //log for contract
      console.log(cs);
      setAllRight(1);
    }
    else{
      setAllRight(0);
      console.error("error fetching contract");
    }
  };

  //navigation components
  const handleSelect = (key) => {
    setActiveKey(key);
  };
  const handleClickOnImage = () => {
    setActiveKey(0);
  }

  const renderPage = (key) => {
    switch (key) {
      case "0":
        return <Welcome />
      case "1":
        return <History contract={contract} web3={web3} allright={allright} isConnect={isConnect} cA={currentAddress} />
      case "2":
        return <Auction currentAddress={currentAddress} isConnect={isConnect} contract={contract} />
      default:
        return <Welcome />
    }
  };

  const convertToEthers = (amt)=>{
    return web3.utils.fromWei(amt, 'ether');
  }

  const getAccBAl= async()=>{
    if(isConnect && allright){
      try{
        const bal = await contract.methods.getAccountBalance().call({from: currentAddress});
        const value = bal.toString();
        const EthBal = convertToEthers(value);
        setAccBal(EthBal);
        //logs for balance
        //console.log(EthBal);
        
      } catch(error){
        console.error("error getting balance ", error);
      }
    }
  };

  const renderAccBal = () =>{
    if(accBal !==''){
      return(
        <div className="accbal-btn">
          {accBal} ETH
        </div>
      );
    }
  };

  useEffect(() => {
    // if (typeof window.ethereum !== 'undefined') {
      const web3provider = window.ethereum; // Use the browser's Web3 provider
      setWeb3Provider(web3provider);
      console.log('Using MetaMask provider');
    // } 
    //  else{
    //   // Fallback to a remote Web3 provider
    //   const providerUrl = 'https://polygon-mumbai.g.alchemy.com/v2/hZbiEx-P9mRxQTZbBcH5Q3EPuqqGZLlb';
    //   // const providerUrl = 'HTTP://192.168.101.8:7545';
    //   const web3provider = new Web3.providers.HttpProvider(providerUrl);
    //   setWeb3Provider(web3provider);
    //   console.log('Using remote provider');
    // }
    if(web3Provider!= null) setWeb3(new Web3(web3Provider));

    if (web3 != null) {
      checkConnection();
      if(!isConnect) walletConnect();
      getContract();

      web3Provider.on("chainChanged", handleChainChanged);
      web3Provider.on("accountsChanged", handleDisconnect);
      // Cleanup of listener on unmount
      return () => {
        web3Provider.removeListener("chainChanged", handleChainChanged);
        web3Provider.removeListener("accountsChanged", handleDisconnect);
      };
    }
// eslint-disable-next-line
  }, [isConnect, web3Provider,allright]);
  return (
    <>
      <div className="myNavbar-container">
        <div style={isMobile?{position:'relative',top:'2%'}:{position:'absolute', left:'4%', cursor:'pointer'}} onClick={handleClickOnImage} ><AppLogo/></div>
        <div className="myNavbar">
          <Nav variant="pills" activeKey={activeKey} onSelect={handleSelect}>
          <NavItem>
              <NavLink className={`mynav-link ${activeKey === "2" ? "active" : ""}`} eventKey="2">
                Auction
              </NavLink>
            </NavItem>
            <NavItem>
              <NavLink className={`mynav-link ${activeKey === "1" ? "active" : ""}`} eventKey="1">
                History
              </NavLink>
            </NavItem>
          </Nav>
        </div>
        {/*trimAddr(currentAddress) **/}
        {isConnect ? <div className="addr-txt ">{"1234567890"}</div> : (<div style={isMobile? {position:'absolute',left:'30%',top:'14%'}:{position:'absolute',left:'75%',top:'5%'}}><Button variant="primary" className="btn-connect" onClick={walletConnect}> Connect </Button></div>)}
      </div>
      {renderPage(activeKey)}
    </>
  );
}
