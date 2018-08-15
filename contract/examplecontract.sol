pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";


contract ExampleContract is usingOraclize {

    string public result;

    event NewOraclizeQuery(string description);

    function ExampleContract() public {
        callUserAPI();
    }

    function __callback(bytes32 myid, string _result) public {
        if (msg.sender != oraclize_cbAddress()) revert();
        NewOraclizeQuery(result);
        result = _result;
    }

    function callTodoAPI() public payable {
        NewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        oraclize_query("URL", "https://jsonplaceholder.typicode.com/todos/1");
    }
    
    function callUserAPI() public payable {
        NewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        oraclize_query("URL", "https://jsonplaceholder.typicode.com/users/1");
    }
    
    function getResult() public returns (string){
        return result;
    }

}