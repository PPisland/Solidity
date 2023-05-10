// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note{

    address a;

    function getAddress() public view returns (address) {
        return address(this);
        // 해당 컨트랙트의 주소를 가져옴
    }

    function getMyAddress() public view returns(address) {
        return address(msg.sender);
        //
    }

    function getMyBalance() public  view returns(uint) {
        return address(msg.sender).balance;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }


    function setA(address _a) public {
        a = _a;
    }

    function setA2(bytes20 _a) public {
        a= address( _a);
    }

    function getA() public view returns(address) {
        return a;
    }

    // uint b;

    // function changeB() public {
    //     b = b+5;
    // }

    // function add(uint _a, uint _b) public pure returns(uint){
    //     return (_a+_b);
    // }


}

contract Mapping{
    mapping(uint => uint) a; // key-value 쌍이 숫자-숫자로 연결되어있는 maaping a
    mapping(uint => string) b;
    mapping(string => address) c;

    // 7반의 앨리스의 점수 
    mapping(uint => mapping(string=>uint)) scroe; // 이중 맵핑

    // 이름을 검색하면 그 아이의 키를 반환받는 contract를 구현하고 싶다.
    mapping(string => uint) height;

    // 정보 넣기
    function setHeight(string memory _name, uint _h )public {
        height[_name] = _h; // mapping이름 [key값] = value 값
    }

    // 정보 받기
    function getHeight(string memory _name) public view returns(uint) {
        return height[_name];
    }
    
    function deleteHegith(string memory _name) public {
        delete height[_name];
    }

}
