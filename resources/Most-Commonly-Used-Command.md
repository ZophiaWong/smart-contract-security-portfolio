- [`Foundry`](#foundry)
  - [`forge`](#forge)
  - [`cast`](#cast)
- [`Slither`](#slither)
- [`Aderyn`](#aderyn)

## `Foundry`

### `forge`

- `forge init`: Creates a new project.
- `forge build`: Compiles smart contracts.
- `forge test`: Runs your test suite.
- `forge script`: Used for deploying contracts via a script.

### `cast`

- `cast block-number`: Get the latest block number.
- `cast balance <ADDRESS>`: Check the ETH balance of an account.
- `cast chain-id`: Get the chain ID of the connected network.
- `cast client`: Get information about the connected RPC client.
- `cast call <TO> <SIG> [ARGS...]`: Simulate a smart contract call.
- `cast send <TO> <SIG> [ARGS...]`: Send a transaction.
- `cast estimate`: Estimate the gas required for a transaction.
- `cast receipt <TX_HASH>`: Get the transaction receipt.
- `cast tx <TX_HASH>`: Get details about a specific transaction.
- `cast run <TX_HASH>`: Replay and trace a transaction.
- `cast abi-encode <SIG> [ARGS...]`: Encode function arguments.
- `cast abi-decode <SIG> <DATA>`: Decode ABI-encoded data.
- `cast 4byte <SELECTOR>`: Get function signatures from 4byte directory.
- `cast 4byte-decode <CALLDATA>`: Decode ABI-encoded calldata.
- `cast --to-wei <NUMBER>`: Convert a number to its Wei equivalent.
- `cast from-utf8 <HEX_STRING>`: Convert a hex string to a UTF-8 string.
- `cast to-bytes32 <STRING>`: Convert a string to a bytes32 hex string.
- `cast compute-address <ADDRESS> <NONCE>`: Compute the address of a contract.
- `cast create2 <CALLER> <SALT> <INIT_CODE_HASH>`: Compute the address of a contract using CREATE2.

## `Slither`

- `slither . --exclude-dependencies`: Analyzes all Solidity files in the current directory, excluding dependencies. This is useful for focusing on the project's own code.
- `slither . --print function-summary`: Summarizes functions with details like modifiers, internal calls, and state variable access. This helps to quickly understand the behavior of each function.
- `slither . --print vars-and-auth`: Lists state variables modified in each function and their authorization. This is useful for identifying which functions can modify sensitive state variables.
- `slither . --print call-graph`: Exports the call-graph of the contracts to a dot file. This provides a visual representation of the function calls between contracts, helping to understand the overall architecture.

## `Aderyn`

```
aderyn .
```
