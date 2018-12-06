%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dating.pl
%
% joe kabucho
%
% P15/42519/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

notice:-
write('Hi this is an expert system to determine couple matches '),nl,
write('Hope you get the person of your  wish!'),nl,
nl,
write('Goodluck pal.'),nl,
nl.


%hypothesises

match(Person,joe):-
						qualities(Person, male),
						qualities(Person, built),
						qualities(Person, tall),
						qualities(Person, dark),
						qualities(Person, handsome),
						qualities(Person, talkative),
						qualities(Person, smart).
								
match(Person,alice):-
						qualities(Person, female),
						qualities(Person, beautiful),
						qualities(Person, short),
						qualities(Person, quiet).
							
match(Person,eva):-
						qualities(Person, famale),
						qualities(Person, slender),
						qualities(Person, tall).
						
match(Person,lamech):-
						qualities(Person, male),
						qualities(Person, light),
						qualities(Person, quiet),
						qualities(Person, short).
						
match(Person,Darline):-
						qualities(Person,female),
						qualities(Person,chubby),
						qualities(Person,short).
						
match(Person,oscar):-
						qualities(Person, male),
						qualities(Person, short),
						qualities(Person, grumpy),
						qualities(Person, talkative),
						qualities(Person, slender),
						qualities(Person, light),
						qualities(Person, smart).
						
						
match(Person,shirley):-
						qualities(Person, female),
						qualities(Person, short),
						qualities(Person, light),
						qualities(Person, quiet).
						

match(Person,martha):-
						qualities(Person, female),
						qualities(Person, tall),
						qualities(Person, chubby),
						qualities(Person, dark).
						
match(Person,brian):-
						qualities(Person, male),
						qualities(Person, dark),
						qualities(Person, smart),
						qualities(Person, grumpy).
						
match(Person,nduati):-
						qualities(Person, male),
						qualities(Person, short),
						qualities(Person, grumpy),
						qualities(Person, smart),
						qualities(Person, uptight),
						qualities(Person, workaholic).
						
match(Person,victoria):-
						qualities(Person, female),
						qualities(Person, short),
						qualities(Person, dark),
						qualities(Person, rich),
						qualities(Person, not_smart),
						qualities(Person, partyholic),
						qualities(Person, artistic),
				        qualities(Person, free).
						

/*Ask rules*/

qualities(P, Val):-ask('guy/girl of your dreams qualities should be',Val).
ask(Obj, Val):-known(Obj, Val, true),!.
ask(Obj, Val):-known(Obj, Val, false),!, fail.
ask(Obj, Val):-nl,write(Obj),write(' '),
			write( Val) , write('?(y/n)'), read(Ans), !,
			((Ans=y, assert(known(Obj, Val, true)));(assert(known(Obj, Val, false)),fail)).
			
matchmake:-nl,write('Providing a  match..........'),nl,match(qualities,match) ,!,nl,
			write('your match could be '), write(match).
matchmake:- nl, write('Sorry,we may not be able to matchmake you with a date!!').

start:-notice,repeat, abolish(known/3),dynamic(known/3), retractall(known/3), matchmake,nl,nl, write('Try again ? (y/n)'),read(Resp),\+ Resp=y,
		nl,write('Bye ! Thanks for using this system'),abolish(known,3) .
		
		
						

						
