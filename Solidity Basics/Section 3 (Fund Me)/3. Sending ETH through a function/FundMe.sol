// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {

    function fund() public payable {
        // allow users to send $
        // have a minimum of $ sent
        // How do we send ETH to this contract?
        // Msg.value;

        require(msg.value > 1e18); // 1e18 = 1 ETH = 1 * 10 ** 18
    }

    //function withdraw() public {}

}
