// SPDX-License-Identifier: MIT
pragma solidity >=0.6.7 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract SoftFlyToken is ERC20Capped, Ownable {
    constructor ()
        ERC20("SoftFlyToken", "SFT")
        // 1 million SFT = 1 * 10**6 * 10**18
        ERC20Capped(1000000000000000000000000)
        public {
    }

    event Minted(address to, uint256 amount);

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit Minted(to, amount);
    }

    receive () external payable {
        revert();
    }
}
