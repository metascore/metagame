import Array "mo:base/Array";
import Principal "mo:base/Principal";
import Result "mo:base/Result";

import Metascore "mo:metascore/Metascore";

// TODO: Example of merging Metascore.GameInterface with your own type.
shared ({ caller = owner }) actor class Metagame() : async Metascore.GameInterface = self {

    // Your canister is responsible for storing its own full list of scores.
    // Metascore will only store the highest score for each player.
    stable var scores : [Metascore.Score] = [
        (#plug(Principal.fromText("ztlax-3lufm-ahpvx-36scg-7b4lf-m34dn-md7or-ltgjf-nhq4k-qqffn-oqe")), 10),
        (#stoic(Principal.fromText("k4ltb-urk4m-kdfc4-a2sib-br5ub-gcnep-tkxt2-2oqqa-ldzj2-zvmyw-gqe")), 8),
    ];

    // Use this to call Metascore's methods. That principal is Metascore's staging canister on Mainnet.
    let metascore : Metascore.MetascoreInterface = actor("rl4ub-oqaaa-aaaah-qbi3a-cai");

    // This is a required function to integrate with Metascore.
    // Metascore will call this method upon registration and around once per day.
    public query func metascoreScores() : async [Metascore.Score] {
        scores;
    };

    // This is a required function to integrate with Metascore.
    // Metascore will call this function when registering your canister, or when requesting updated metadata.
    public shared func metascoreRegisterSelf(callback : Metascore.RegisterCallback) : async () {
        await callback({
            name = "Metagame: Attack of the Demo Canister!";
        });
    };

    // Here is an example of a function we can use to register our game in metascore.Array
    public func register () : async Result.Result<(), Text> {
        await metascore.register(Principal.fromActor(self));
    };

    // Here is an example of a function to register a score in game.
    public shared func newScore (player : Metascore.Player, score : Nat) : async () {
        let newScore : Metascore.Score = (player, score);

        // Store your score in your own canister.
        scores := Array.append(scores, [newScore]);

        // When a new high score for a player happens, you should push that to Metascore.
        // This will ensure that your game is up-to-date in our canisters.
        // NOTE: Metascore does not implement this method yet
        await metascore.scoreUpdate([newScore]);
    };
};
