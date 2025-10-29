Function 1: Add a new record
    function addRecord(string memory _data) public {
        recordCount++;
        records[recordCount] = Record(recordCount, _data, msg.sender, block.timestamp);
        emit RecordAdded(recordCount, _data, msg.sender, block.timestamp);
    }

    Function 3: Update record data (owner only)
    function updateRecord(uint256 _id, string memory _newData) public onlyOwner {
        require(_id > 0 && _id <= recordCount, "Invalid record ID");
        records[_id].data = _newData;
        emit RecordUpdated(_id, _newData);
    }
}
// 
update
// 
