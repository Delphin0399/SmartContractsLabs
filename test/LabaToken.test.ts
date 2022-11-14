import { expect } from "chai";
import { ethers } from "hardhat";

describe("LabaToken", function () {
  it("Should have the correct initial supply", async function () {

    const [owner] = await ethers.getSigners();
    const ownerAddress = await owner.getAddress();

    const initialSupply = ethers.utils.parseEther("100000");
    const LabaToken = await ethers.getContractFactory("LabaToken");
    const labaToken = await LabaToken.deploy(initialSupply);
    await labaToken.deployed();

    const supply = await labaToken.balanceOf(ownerAddress);
    expect(supply).to.equal(initialSupply);
  });
});