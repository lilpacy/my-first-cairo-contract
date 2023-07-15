use array::ArrayTrait;
use result::ResultTrait;

#[test]
fn test_deployer_is_owner() {
    let deployer_address = 123;
    let class_hash = declare('ownable').unwrap();
    let constructor_args = ArrayTrait::new();
    let prepared = prepare(class_hash, @constructor_args).unwrap();
    
    start_prank(deployer_address, prepared.contract_address);
    let contract_address = deploy(prepared).unwrap();
    stop_prank(contract_address);

    let function_args = ArrayTrait::new();
    let returned = call(contract_address, 'get_owner', @function_args).unwrap();
    let owner_address = *returned.at(0_u32);

    assert(owner_address == deployer_address, 'The owner is not the deployer');
}