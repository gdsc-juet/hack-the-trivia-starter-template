import './App.css';

export default function Welcome() {

  const isMobile = window.innerWidth <= 768;
  const pStyle = {
    marginLeft:"10%",
  };

  const pStyleMobile = {
    marginLeft:"25%",
  };
    return (
      <div className="welcome-container">
        <p style={{marginLeft:"5%"}}>Welcome</p>
        <p style={isMobile?pStyleMobile:pStyle}>To</p>
        <p style={{marginLeft:'-8%'}}><span style={{color:"white"}}>Decentralized</span><span> Auction App</span></p>
      </div>
    );
  }
  