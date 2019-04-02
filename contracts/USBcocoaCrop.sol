pragma solidity ^0.5.0;

contract USBcocoaCrop {
    string  public name = "USB Cocoa Crop";
    string  public symbol = "USBCC";
    string  public standard = "USB Cocoa Crop v0.9";
    string public description = "This SmartContract is an abstract that represents a cocoa crop field in Macuto Venezuela, owned by the Simón Bolívar University who warranty the preservation of the cocoa trees in order to be compliant with the Certified Emission Reductions (CERs) standard. With this contract, the Simón Bolívar University display its interests in the preservation of 250 local variety cocoa tree, in the seek to help researches and the local growth economy.";
    uint256 public totalSupply = 250;
    uint8 public decimals = 0;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
}
