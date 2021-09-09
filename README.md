# Metascore Demo Game Canister

This repository demonstrates the basic Candid interface to interact with Metascore. Follow these basic steps to get your game up and running with Metascore's staging canister. We will release the production canister principal at a later date.

You should be able to pilfer the code from this canister into your own game to get up and running fairly easily.

Here's the staging URL for Metascore: https://rl4ub-oqaaa-aaaah-qbi3a-cai.raw.ic0.app/

```shell
dfx deploy --network ic
```

```shell
dfx canister --network ic call metagame register
```

If you go to the staging URL, you should see your game now: https://rl4ub-oqaaa-aaaah-qbi3a-cai.raw.ic0.app/

Let's add a new score...

```shell
dfx canister call metagame newScore "( variant { stoic = principal \"$(dfx identity get-principal)\" }, 150 )"
```

You should see your new score being reported on https://rl4ub-oqaaa-aaaah-qbi3a-cai.raw.ic0.app/ immediately.
