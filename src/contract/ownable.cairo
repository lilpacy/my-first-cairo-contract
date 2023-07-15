#[contract]
mod Ownable {
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    struct Storage {
        owner: ContractAddress,
    }

    // The constructor is the function that is called when the contract is
    // deployed.
    #[constructor]
    fn constructor() {
        // The caller is the address that called the function.
        let deployer = get_caller_address();
        // We write the caller's address to the storage.
        owner::write(deployer);
    }

    // The view is a function that does not modify the contract's state.
    #[view]
    fn get_owner() -> ContractAddress {
        owner::read()
    }
}