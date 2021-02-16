pragma solidity ^0.5.0;
contract ctThongTinSinhVien{
    uint public dem=0;
    struct tblThongTinSinhVien{
        uint mssv;
        string  hoten;
        uint namsinh;
    }
    //mapping 1 giá trị với 1 dòng trong bảng
    //vì không có primary key cho bảng nên phải dùng mapping với address
    //để có giá trị duy nhất
    mapping(address=>tblThongTinSinhVien) mpThongTinSinhVien;

    //không duyệt qua được từng mảng của struct nên phải lưu vào array
    address[] public arrThongTinSinhVien;
    //Lưu 1 mảng cấu trúc data Struct vào trong 1 address (có thể mà thông tin số dư tài khoản, coin nắm giữ ...)
    function themSinhVien(address _address,uint _mssv,string memory _hoten, uint _namsinh) public{
        tblThongTinSinhVien storage ttsv = mpThongTinSinhVien[_address];
        ttsv.mssv=_mssv;
        ttsv.hoten=_hoten;
        ttsv.namsinh=_namsinh;
        //thêm vào array
        arrThongTinSinhVien.push(_address);
        dem++;
    }
    
    function xemTatCaThongTinSinhVien() public view returns (address[] memory){
        return arrThongTinSinhVien;
    }
    function xemThongTinSinhVien(address _address) public view returns(uint,string memory,uint){
        return(mpThongTinSinhVien[_address].mssv,mpThongTinSinhVien[_address].hoten,mpThongTinSinhVien[_address].namsinh);
    }
    function tongsoSinhVien() public view returns(uint){
        return arrThongTinSinhVien.length;
    }
    
    
    //mapping id vào bảng sinh viên
    mapping(uint=>tblThongTinSinhVien) mpThongTinSinhVien2;
    function themSinhVien2(uint _id,uint _mssv,string memory _hoten, uint _namsinh) public{
        tblThongTinSinhVien storage ttsv = mpThongTinSinhVien2[_id];
        ttsv.mssv=_mssv;
        ttsv.hoten=_hoten;
        ttsv.namsinh=_namsinh;
        //thêm vào array
        //arrThongTinSinhVien.push(_address);
        dem++;
    }
    function lietkeSinhVien2() public view returns(uint,string memory,uint){
        for(uint i=1;i<=dem;i++){
            return(mpThongTinSinhVien2[i].mssv,mpThongTinSinhVien2[i].hoten,mpThongTinSinhVien2[i].namsinh);
        }//chỉ có thể return được 1 record đầu tiên
    }
    function xemThongTinSinhVien2(uint _id) public view returns(string memory){
        return mpThongTinSinhVien2[_id].hoten;
    }
}
