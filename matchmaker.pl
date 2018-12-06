:- use_module(library(jpl)).    %Importing the jpl interface which connects the prolog and java together.


start :-sleep(0.4),	            %Makes a delay of 0.4 seconds
		
		write("Running"),nl,nl,			%Writes a text to the consol		
		interface2.  			%Executing the interface2 which is responsable for taking the name




%These are the rules of the system

    quality(Person,male) :- verify(Person," should person be male (y/n) ?").		%quality is a 3rd		verify is the a method in line 98						   		
 
    quality(Person,female) :- verify(Person," should person be female(y/n) ?").	
  
    quality(Person,tall) :- verify(Person," should person be tall(y/n) ?").

    quality(Person,short) :- verify(Person," should person be short(y/n) ?").
    
    quality(Person,talkative) :- verify(Person,"should person be talkative(y/n) ?").
    
    quality(Person,silent) :- verify(Person," should person be silent(y/n) ?").
	
    quality(Person,light) :- verify(Person," should person be light(y/n) ?").
 
    quality(Person,dark) :- verify(Person," should person be dark(y/n) ?").
   
    quality(Person,uptight) :- verify(Person,"should person be uptight(y/n) ?").
  
    quality(Person,free) :- verify(Person,"should person be free(y/n) ?").

    quality(Person,introvert) :- verify(Person," should person be introvert(y/n) ?").

    quality(Person,extrovert) :- verify(Person,"should person be extrovert(y/n) ?").

    quality(Person,student) :- verify(Person," should person be student(y/n) ?").

    quality(Person,working) :- verify(Person," should person be working(y/n) ?").

    quality(Person,smart) :- verify(Person," should person be smart(y/n) ?").

    quality(Person,fairly_smart) :- verify(Person," should person be fairly_smart(y/n) ?").

    quality(Person,slender) :- verify(Person," should person be slender (y/n) ?").
   
    quality(Person,plump) :- verify(Person," should person be plump (y/n) ?").
	
	

%These are the rules of the system based on the verified qualitys

    hypothesis(Person,joe) :-					
       quality(Person,male),
        quality(Person,smart),
        quality(Person,working),
        quality(Person,plump),
        quality(Person,extrovert).
    
    hypothesis(Person,lamech) :-
        quality(Person,male),
        quality(Person,tall),
        quality(Person,dark),
		 quality(Person,talkative),
        quality(Person,extrovert).
        
    hypothesis(Person,oscar) :-
        quality(Person,male),
        quality(Person,short),
        quality(Person,light),
        quality(Person,introvert),
        quality(Person,smart),
        quality(Person,student),
        quality(Person,slender),
        quality(Person,uptight).    
        
    hypothesis(Person,vicky) :-
       quality(Person,female),
        quality(Person,dark),
        quality(Person,short),
        quality(Person,smart),
        quality(Person,introvert).
        
    hypothesis(Person,shirley) :-
       quality(Person,female),
	    quality(Person,smart),
		 quality(Person,uptight),
        quality(Person,light).
    
    hypothesis(Person,martha) :-
       quality(Person,female),
        quality(Person,tall),
        quality(Person,introvert),
        quality(Person,free).
    
    hypothesis(Person,eva) :-
        quality(Person,female),
        quality(Person,slender),
		 quality(Person,dark),
        quality(Person,tall).

    hypothesis(Person,crystal) :-
        quality(Person,female),
        quality(Person,dark),
		 quality(Person,talkative),
		 quality(Person,fairly_smart),
        quality(Person,short).

       
    hypothesis(Person,darline) :-
        quality(Person,female),
		 quality(Person,short),
        quality(Person,dark).    
        

 


	hypothesis(_,"person with those qualities. It isn't within my knowledge base yet").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(Person,Question) :-
	write(Person),write(', do you'),write(Question),	
	interface(', do you',Person,Question),nl.
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


pt(Person):- 

		hypothesis(Person,Match),
		interface3(Person,', your perfect match is probably  ',Match,'.'),
        write(Person),write(', your perfect match is probably '),write(Match),write('.'),nl,nl,
match_description(Match),
undo,end.



		

		
 		

end :-
		nl,nl,nl,
		sleep(0.4),
		write("Shutting Down"),nl.

interface(X,Y,Z) :-			%Asks the Questions
	atom_concat(Y,X, FAtom),  %atom_concat(?Atom1, ?Atom2, ?Atom3)  Atom3 forms the concatenation of Atom1 and Atom2.
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Matchmaker'], F),									%F is the frame
	jpl_new('javax.swing.JLabel',['Medical Expert System'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),						%N will hold either y or n		
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		
interface2 :-				%Takes the name
	jpl_new('javax.swing.JFrame', ['Matchmaker'], F),
	jpl_new('javax.swing.JLabel',['Dating Expert System'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hi. How are you? Please tell me your name'], N),		%N will hold the entered name
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)				%null only happens when we cancel button is clicked, if nothing was entered it will be considered empty String ""
		->	write('You cancelled'),interface3('You cancelled. ','Thank you ','for useing ','Matchmaker.'),end,fail
		;	write("Hi. How are you? Please tell me your name : "),write(N),nl,pt(N)
	).
	
	
interface3(P,W1,D,W2) :-	%Tell the Patient whats his illness			
	atom_concat(P,W1, A),    
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Matchmaker'], F),
	jpl_new('javax.swing.JLabel',['Medical Expert System'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),			%F is the frame			W3 is the message
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)			%Exeption handling
		->	write('')
		;	write("")

	).


match_description(match):-

  match == 'joe',
  write(' joe kabucho is smart,plup,working introvert boy ');
 
  match == 'shirley',
  write(' shirley irungu is a smart,uptight light girl');
  match == 'lamech',
  write(' lamech dete is tall,dark,talkative extrovert boy');
  match == 'oscar',
  write('oscar karani is short,light,introvert,uptight,smart,student,slender boy');
  match == 'vicky',
  write('vicky jael is short ,dark,smart,introvert girl');
  match == 'darline',
  write(' darline is a short,dark girl');
  match == 'eva',
  write(' eva is tall,dark,slender girl');
  match == 'martha',
  write('martha njeri is tall,introvert,free girl ');
  match == 'crystal',
  write('crystal alice is a dark,talkative,fairly_smart,short girl');
match_description(_).


help :- write("To start type 'start.' and press Enter").