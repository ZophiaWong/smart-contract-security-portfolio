# Attacker's Mindset

- [Attacker's Mindset](#attackers-mindset)
  - [🫸Denial of Service (DoS) Attack](#denial-of-service-dos-attack)
  - [🎁Donation Attack](#donation-attack)
  - [🚀Front-running Attack](#front-running-attack)
  - [🦹Griefing Attack](#griefing-attack)
  - [⚒️Miner Attack](#️miner-attack)
  - [💰Price Manipulation Attack](#price-manipulation-attack)
  - [🚪Reentrancy Attack](#reentrancy-attack)
  - [🔁Replay Attack](#replay-attack)
  - [🏃‍➡️Rug Pull](#️rug-pull)
  - [🥪Sandwich Attack](#sandwich-attack)
  - [🪄Sybil Attack](#sybil-attack)

## 🫸Denial of Service (DoS) Attack

- [ ] Is the **withdrawal** pattern followed to prevent denial of service?

  <details>
  <summary>Descriptions:</summary>

  - To prevent denial of service attacks during withdrawals, it's crucial to follow the withdrawal pattern best practices - **pull based approach**.
  </details>

  <details>
  <summary>Ref:</summary>

  - https://solodit.xyz/issues/m-06-denial-of-service-contract-owner-could-block-users-from-withdrawing-their-strike-code4rena-putty-putty-contest-git
  </details>

- [ ] Is there a minimum transaction amount enforced?
  <details>
  <summary>Description:</summary>

  - Enforcing a minimum transaction amount can prevent attackers from clogging the network with zero amount or dust transactions.
  </details>

  <details>
  <summary>Remediation:</summary>

  - Disallow transactions below a certain threshold to maintain efficiency and prevent denial of service through dust spamming.
  </details>

  <details>
  <summary>Ref:</summary>

  - [#1](https://solodit.xyz/issues/h-02-denial-of-service-code4rena-hubble-hubble-contest-git), [#2](https://solodit.cyfrin.io/issues/m-16-users-can-be-griefed-due-to-lack-of-minimum-size-within-the-loan-and-offer-sherlock-debita-finance-v3-git)
  </details>

- [ ] How does the protocol handle tokens with blacklisting functionality?
  <details>
  <summary>Description:</summary>

  - Tokens with blacklisting capabilities, such as USDC, can pose unique risks and challenges to protocols.
  </details>

  <details>
  <summary>Remediation:</summary>

  - Account for the possibilities of blacklisting within token protocols to ensure continued functionality even if certain addresses are blacklisted.
  </details>

  <details>
  <summary>Ref:</summary>

  - [#1](https://solodit.cyfrin.io/issues/m-4-blacklisted-creditor-can-block-all-repayment-besides-emergency-closure-sherlock-real-wagmi-2-git) - fixed by [modifying the state variables instead of transfer](https://github.com/RealWagmi/wagmi-leverage/commit/3c17a39e8a69a8912e6f87e84a19f55889353328#diff-481232aed109bd977e7bf7506f93a9d303bbbfa6e7a6d072c391c9486903b25eR411)
  </details>

- [ ] Can forcing the protocol to process a queue lead to DOS?
  <details>
  <summary>Description:</summary>

  - Forcing protocols to process queues, like **a queue of dust withdrawals**, can be exploited to cause a denial service.
  </details>

  <details>
  <summary>Remediation:</summary>

  - Design a queue processing in a manner that is resilient to spam and cannot be exploited to cause denial of service.
  </details>

  <details>
  <summary>Ref:</summary>

  - [#1](https://solodit.cyfrin.io/issues/denial-of-slashing-ottersec-none-ethos-evm-pdf)
  </details>

- [ ] What happens with low decimal tokens that might cause DOS?
  <details>
  <summary>Description:</summary>

  - Tokens with low decimals can present issues where the transaction process fails due to **rounding to zero amounts**.
  </details>

  <details>
  <summary>Remediation:</summary>

  - Implement logic to handle low decimal tokens in a way that prevents the transaction process from breaking due to insufficient token amounts.
  </details>

  <details>
  <summary>Ref:</summary>

  - [#1](https://solodit.xyz/issues/potential-funds-locked-due-low-token-decimal-and-long-stream-duration-spearbit-locke-pdf) - recommend to scale to 18 decimals of precision
  </details>

- [ ] Does the protocol handle external contract interactions safely?
  <details>
  <summary>Description:</summary>

  - Protocols must must handle interactions with external contracts in a way that **does not compromise** their functionality **if external calls failed**.
  </details>

  <details>
  <summary>Remediation:</summary>

  - Ensure robust handling of external contract interactions to maintain protocol integrity **regardless of external contract performance**.
  </details>

  <details>
  <summary>Ref:</summary>

  - [#1](https://solodit.xyz/issues/m-09-unhandled-chainlink-revert-would-lock-all-price-oracle-access-code4rena-juicebox-juicebox-v2-contest-git) - Reverted external call leads the protocol to fail, fixed by surrounded the external call with `try/catch` block instead of calling it directly.
  </details>

## 🎁Donation Attack

- [ ] Does the protocol rely on `balance` or `balanceOf` instead of internal accounting?
  <details>
  <summary>Description:</summary>

  - Attackers can manipulate the accounting by donating tokens.
  </details>

  <details>
  <summary>Remediation:</summary>

  - Implement internal accounting instead of relying on `balanceOf` natively.
  </details>

  <details>
  <summary>Ref:</summary>

  - [#1](https://solodit.cyfrin.io/issues/h-02-first-depositor-can-break-minting-of-shares-code4rena-prepo-prepo-contest-git)'s proof of concept
    - Attacker deposits and mints first total shares
    - Attacker transfers exorbitant amount to greatly inflate the shares price. (The protocol calculate the shares' ratio by using `balanceOf` instead of an internal accounting)
    - Subsequent depositors instead have to deposit equivalent sum to avoid minting 0 shares. Otherwise, their deposits accrue to the attacker who holds the only share.

  </details>

## 🚀Front-running Attack

- [ ] Are "get-or-create" patterns protected against front-run attacks?
- [ ] Are two-transaction actions designed to be safe from frontrunning?
- [ ] Can users maliciously cause others' transactions to revert by preempting with dust?
- [ ] Is the protocol using a properly use-bound commit-reveal scheme?

## 🦹Griefing Attack

-
- [ ] a
- [ ] b

## ⚒️Miner Attack

## 💰Price Manipulation Attack

## 🚪Reentrancy Attack

## 🔁Replay Attack

## 🏃‍➡️Rug Pull

- [ ] Can the admin of the protocol pull assets from the protocol?

## 🥪Sandwich Attack

- [ ] Does the protocol have an explicit slippage protection on user interactions?

## 🪄Sybil Attack
