// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Quiz{


//     안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
// 안건들을 모아놓은 자료구조도 구현하세요. 
    struct proposal{
        uint number;
        string title;
        string content;
        address proponent;
        uint agree;
        uint disagree;
    }
    mapping(string=>proposal) Propsals;
    // mapping(string=>proposal) titleToProposal;
    // proposal[] x;
    uint proposalCount;
// 사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)
    struct user {
        string name;
        address account;
        // mapping(address=>agenda) myAgenda;
        // mapping(string=>bool) vote;
    }
    // mapping(address=>user) public userList;
    user[] userList;
// * 사용자 등록 기능 - 사용자를 등록하는 기능
    function setUser(string memory _name) public {
        // userList[msg.sender] = user(_name, msg.sender);
        userList.push(user(_name,msg.sender));
    }
// * 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
    // function vote (string memory _title) public {
    //     require((titleToProposal[_title].agree + titleToProposal[_title].disagree) <userList.length);

    // }
// * 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function addProposals (string memory _title, string memory _content) public{
        proposalCount++;
        Propsals[_title] = proposal({
            number: proposalCount,
            title: _title,
            content: _content,
            proponent: msg.sender,
            agree: 0,
            disagree: 0
        });
        
        // emit ProposalAdded(proposalCount, _title, _content, msg.sender);
    }
// * 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
// * 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
// -------------------------------------------------------------------------------------------------
// * 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
}

contract Solution {

    // 안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
       struct poll{
        uint number;
        string title;
        string context;
        address by;
        uint pros;
        uint cons;
        pollStatus status;
    }
    // 안건들을 모아놓은 자료구조도 구현하세요. 
    // array or mapping 
    mapping(string=>poll) public polls;
    uint public count;

    enum votingStatus {
        notVoted,
        pro,
        con
    }

    enum pollStatus{
        ongoing,
        passed,
        rejected
    }

    struct user{
        uint number;
        string name;
        address addr;
        string[] titles;
        // string voted_props;
        mapping(string=>votingStatus) voted;
    }

    // user를 관리할 자료구조, array or mapping
    user[] public Users;

    function getUserLength() public view returns(uint){
        return Users.length;
    }
    function pushUser(uint _number, string memory _name, address _addr) public {
        // Users.push(_a);
        user storage _newuser = Users.push(); // mapping의 초기값을 설정할 수 없기 떄문에 빈아이를 넣는다(?)
        Users[Users.length-1].number = _number;
        Users[Users.length -1].name = _name;
        Users[Users.length -1].addr = msg.sender;
    }
    // * 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function suggest(string memory _title, string memory _context, address _addr) public {
        polls[_title] = poll(++count, _title, _context, _addr,0,0, pollStatus.ongoing);
    }
    // function getPoll()


    // function getUser(uint _n) public view returns(string memory, address, string[] memory ){
    //     return (Users[_n].name, Users[_n].addr, Users[_n].suggested);  
    // }

    //  function getUser2(uint _n, string memory _a) public view returns(string memory, address, string[] memory ){
    //     return (Users[_n].name, Users[_n].addr, Users[_n].suggested);  
    // }
    
    // * 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
    function vote(uint number, string memory _title, bool _vote) public {
        require(Users[number].voted[_title] == votingStatus.notVoted); //투표자가 해당 안건에 대해서 투표를 안했어야 함
        // 찬성이냐, 반대이냐
        if(_vote==true){
            polls[_title].pros++;
        Users[number].voted[_title] = votingStatus.pro;
        } else{
             polls[_title].cons++;
        Users[number].voted[_title] = votingStatus.con;
        }
    }
    // * 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
 
    // * 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
    // function 
    // * 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
    // -------------------------------------------------------------------------------------------------

}

contract User{
    /*
    1. user에서 setUser로 A 설정
    2. suggestPoll로 B, CD 제안
    3. Solution 에서 Users로 0번 검색
    4. polls로 B 검색    
    5. user에서 vote하기
    6. Soltion 에 반영여부 확인
    7. user에서 같은  poll 또 vote하기    
    */


    Solution polls;
    constructor(address _a) {
        polls = Solution(_a);
    }

    enum votingStatus{
        notVoted,
        pro,
        con
    }

        // 사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)
    struct user{
        uint number;
        string name;
        address addr;
        string[] titles;
        // string voted_props;
        mapping(string=>votingStatus) voted;
    }

    user MyAccount;

    function setUser(string memory _name) public {
        (MyAccount.number, MyAccount.name, MyAccount.addr) = (polls.getUserLength(),_name, msg.sender);
        polls.pushUser(MyAccount.number, _name,msg.sender );
    }

    modifier  voting(string memory _title, bool _vote) {
        _;
        if(_vote == true){
            MyAccount.voted[_title] = votingStatus.pro;
        }else {
            MyAccount.voted[_title] = votingStatus.con;
        }
    }

    function vote(string memory _title, bool _vote)  public voting(_title, _vote) {
        polls.vote(MyAccount.number, _title, _vote);

    }

       // * 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function suggestPoll(string memory _title, string memory _context) public {
        // polls.polls[_title] = polls.poll() (x)
        polls.suggest(_title, _context, msg.sender);
    }
    // * 사용자 등록 기능 - 사용자를 등록하는 기능
    // function setUser(string memory _name) public {
    //     // Users.push(user(_name, msg.sender, new string[](0)));
    //     user storage _newuser = Users.push(); // mapping의 초기값을 설정할 수 없기 떄문에 빈아이를 넣는다(?)
    //     // Users[Users.length-1].number = Users.length;
    //     Users[Users.length -1].name = _name;
    //     Users[Users.length -1].addr = msg.sender;
    // }
    // function getUsers() public view returns(uint){
    //     return (Users.length);
    // }

}


contract INITIALIZATION {
    uint a;
    string b;
    address c;
    bytes1 d;
    bytes e;
    bool f;

    struct set1 {
        uint a;
        string b;
        address c;
        bytes32 d;
        bytes e;
        bool f;
    }

    set1 public S1;
    set1[] group1;

    uint[] g;
    string[] h;
    bytes1[4] i;
    uint[4] j;
    address[4] k;
    string[4] l;

    struct set2 {
        uint[] g;
        string[] h;
        bytes1[4] i;
        /*uint[4] j;
        address[4] k;
        string[4] l;*/
    }

    set2 s2;

    set2[] group2;

    function pushG1() public {
        group1.push(set1(0,"",address(0),bytes32(0),new bytes(0),false));
    }

    function pushG2() public {
        bytes1[4] memory _i;
        group2.push(set2(new uint[](0),new string[](0), _i));
    }

    function getG2() public  view returns(set2[] memory) {
        return group2; // 0: tuple(uint256[],string[],bytes1[4])[]:
    }

    function getS2() public view returns(set2 memory) {
        return s2;
    }

    function getA() public view returns(uint,string memory, address, bytes1, bytes memory, bool) {
        return (a,b,c,d,e,f);
    }

    function getG() public view returns(uint[] memory, string[] memory, bytes1[4] memory, uint[4] memory, address[4] memory, string[4] memory) {
        return (g,h,i,j,k,l );
    }
}

contract doubleMapping {

    struct user{
        uint number;
        string name;
    }
    uint[] A;
    user B;

    mapping(address=>uint) balance;
    mapping(address=>mapping(string=>uint)) bankAccounts;
    mapping(address=>mapping(string=>user)) bankAccounts2; /*struct와 같은 reference type 변수는 오직 value로만 사용가능*/
    mapping(string=>mapping(string=>mapping(uint=>user))) bankAccounts3;
    mapping(address=>uint[]) Aa;

    function setBalance() public {
        balance[msg.sender] = (msg.sender).balance;
    }

    function setBankAccounts(string calldata _name) public {
        bankAccounts[msg.sender][_name] = 100;
    }

    function setBankACcounts2(string calldata _city, string calldata _state, uint _number) public {
        bankAccounts3[_city][_state][_number] = B;
    }

    function getbankAccounts(address _addr, string memory _name) public view returns(uint) {
        return bankAccounts[_addr][_name];

    }
}