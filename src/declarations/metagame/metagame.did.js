export const idlFactory = ({ IDL }) => {
  const Metadata = IDL.Record({ 'name' : IDL.Text });
  const RegisterCallback = IDL.Func([Metadata], [], []);
  const Player = IDL.Variant({ 'plug' : IDL.Text, 'stoic' : IDL.Text });
  const Score = IDL.Tuple(Player, IDL.Nat);
  const Metagame = IDL.Service({
    'metascoreRegisterSelf' : IDL.Func([RegisterCallback], [], []),
    'metascoreScores' : IDL.Func([], [IDL.Vec(Score)], ['query']),
  });
  return Metagame;
};
export const init = ({ IDL }) => { return []; };
