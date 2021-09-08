import type { Principal } from '@dfinity/principal';
export interface Metadata { 'name' : string }
export interface Metagame {
  'metascoreRegisterSelf' : (arg_0: [Principal, string]) => Promise<undefined>,
  'metascoreScores' : () => Promise<Array<Score>>,
}
export type Player = { 'plug' : string } |
  { 'stoic' : string };
export type RegisterCallback = (arg_0: Metadata) => Promise<undefined>;
export type Score = [Player, bigint];
export interface _SERVICE extends Metagame {}
