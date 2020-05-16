pragma solidity >=0.4.21 <0.7.0;


contract Meeting {
    address public owner;
    string public meetingDescription;
    bytes32[] public passportHashes;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == owner, "You are not owner");
        _;
    }

    function addDescription(string memory description) public restricted {
        meetingDescription = description;
    }

    function registerMember(string memory passport) public {
        require(
            !verifyMemberRegistration(passport),
            "Passport already registereed"
        );
        passportHashes.push(keccak256(abi.encodePacked((passport))));
    }

    function verifyMemberRegistration(string memory passport)
        public
        view
        returns (bool)
    {
        bytes32 passportHash = keccak256(abi.encodePacked(passport));

        bool isPassportHashExists = false;
        for (uint256 i = 0; i < passportHashes.length; i++) {
            if (passportHashes[i] == passportHash) {
                isPassportHashExists = true;
            }
        }

        return isPassportHashExists;
    }
}
