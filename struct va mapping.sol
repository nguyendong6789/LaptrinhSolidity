//environment
//+ Javascript VM: tự chạy mà không liên kết metamask, ganache
//+ Web3 Provider: cần phải có local net: ganache
//+ Injected Web3: metamask --> Rinkerby 
pragma solidity ^0.5.0;
contract Owned{
    address owner = msg.sender;
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
}
contract Coursetro is Owned{ //tích hợp contract Owned vào contract Coursetro
    struct Instructor{
        uint age;
        string fName;
        string lName;
    }
                    //cái dưới này là tên của struct
    mapping(address=>Instructor) instructors; //mapping giống ID của Struct
    address[] public instructorAccts; //mảng
    event instructInfo(
        string fName,
        string lName,
        uint age
    );
    function setInstructor(address _address, uint _age, string memory _fName, string memory _lName) public onlyOwner{
        Instructor storage ins =  instructors[_address]; //tạo ra 1 key Address cho struct ,cái này là biến mapping
        //Giống laravel là tạo ra 1 record mới bằng cách trỏ đến Model và thêm 1 id mới (id này chính là address)
        ins.age = _age;
        ins.fName = _fName;
        ins.lName = _lName;
        instructorAccts.push(_address) - 1;
        emit instructInfo(_fName,_lName,_age);
    } 
    function getInstructors() public view  returns(address[] memory){
        return instructorAccts;
        
    }
    function getInstructor(address _address) public view returns (uint, string memory, string memory){
        return (instructors[_address].age,instructors[_address].fName,instructors[_address].lName);        
    }
    function countConstructors() public view returns(uint){
        return instructorAccts.length;
    }
}
