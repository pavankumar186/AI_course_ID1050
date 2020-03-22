% This prolog program has been written by Pavan Kumar Vemuri.

% Football


% won(winner block,loser block)
% all blocks in lowercase
/* This predicate has 2 arguments i.e won/2 */

% This is just the database of all the matches that happened and their results.

won(b,g).
won(p,g).
won(c,a).
won(a,d).
won(c,d).
won(h,f).
won(e,f).
won(e,b).
won(c,b).
won(e,c).

% draw(block1,block2)
% all blocks in lowercase
/* This predicate has 2 arguments i.e draw/2 */


draw(b,p).
draw(e,h).

% category(block name,number of the category)
% block name in lowercase
% number of the category is 1 or 2 or 3
/* This predicate has 2 arguments i.e category/2 */

% It was mentioned that a draw has to be considered as a win for both the teams

% A hostel block is considered to be of category 1 if it wins all matches or in other words
% loses no matches therefore we have taken the same using the keyword not and the anonymous variable _
% which means that it can be literally anything. 
% The predicate checks all the possibilities of the anonymous variable and then gives the output true if the hostel block loses no matches
% it gives the output false even if it loses one match.
% we do not need to consider draws here because they are treated as a win already

category(S,1):-
	not(won(_,S)).

% A hostel block is considered to be of category 3 if it loses all matches or in other words
% wins no matches therefore we have taken the same using the keyword not and the anonymous variable _
% which means that it can be literally anything.
% The predicate checks all the possibilities of the anonymous variable and then gives the output true if the hostel block wins no matches
% it gives the output false even if it wins one match.
% here we make sure that the hostel block doesn not have a draw also because it has to be treated as a win.
% we do this by adding the condition that it should not belong to the database of draws, by doing an "and" with the negation of the fact that it belongs to the database.

category(S,3):-
	not(won(S,_)),not(draw(S,_)),not(draw(_,S)).


% A hostel block is considered to be of category 2 if it wins some matches and 
% loses some matches therefore we have taken the same using the keyword not, applied on the
% predicates which say that they belong to category 1 and 3 and then apply an "and" to both of these
% this is true because if it does not belong to category 1 it means that it did not win all matches
% similarly if it does not belong to category 3 it did not lose all matches,therefore if it does not belong to 
% both it means it won some matches and lost some.

category(S,2):-
	not(category(S,1)),not(category(S,3)).