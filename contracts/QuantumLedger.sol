// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuantumLedger {
    address public owner;

    struct Record {
        uint256 id;
        string data;
        address addedBy;
        uint256 timestamp;
    }

    uint256 public recordCount;
    mapping(uint256 => Record) public records;

    event RecordAdded(uint256 id, string data, address addedBy, uint256 timestamp);
    event RecordUpdated(uint256 id, string newData);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function 1: Add a new record
    function addRecord(string memory _data) public {
        recordCount++;
        records[recordCount] = Record(recordCount, _data, msg.sender, block.timestamp);
        emit RecordAdded(recordCount, _data, msg.sender, block.timestamp);
    }

    // Function 2: Get record details by ID
    function getRecord(uint256 _id) public view returns (string memory, address, uint256) {
        require(_id > 0 && _id <= recordCount, "Invalid record ID");
        Record memory record = records[_id];
        return (record.data, record.addedBy, record.timestamp);
    }

    // Function 3: Update record data (owner only)
    function updateRecord(uint256 _id, string memory _newData) public onlyOwner {
        require(_id > 0 && _id <= recordCount, "Invalid record ID");
        records[_id].data = _newData;
        emit RecordUpdated(_id, _newData);
    }
}
