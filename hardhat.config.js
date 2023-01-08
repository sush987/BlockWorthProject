require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const hex = utf8ToHex(PRIVATE_KEY ?? '');

const { API_URL, PRIVATE_KEY }= process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  defaultNetwork: "polygon_mumbai",
  networks:{
    mumbai:{
      url: API_URL,
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};

function utf8ToHex(str:string) {
  return Array.from(str).map(c =>
      c.charCodeAt(0) < 128 ? c.charCodeAt(0).toString(16) :
          encodeURIComponent(c).replace(/\%/g,'').toLowerCase()
  ).join('');
}
