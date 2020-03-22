% This prolog program has been written by Pavan Kumar Vemuri.


% country(countryname,area,population,list of neighbours	)
% countryname is in lowercase and space is given with '_'
% area in million km^2
% population in crores
% the list of neighbours are seperated with comma
/* This predicate has 4 arguments i.e country/4 */


% Details about area and population were taken from
% https://www.worldometers.info/population/countries-in-asia-by-population

% Details about neighbours were mostly taken from
% http://www.quickgs.com/neighbouring-countries-of-different-asian-countries/

country(india,2.973,133.92,[china,bangladesh,bhutan,myanmar,nepal,pakistan]).
country(china,9.597,138.64,[afghanistan, bhutan, india, kazakhstan, kyrgyzstan, laos, mongolia, myanmar, north_korea, nepal, pakistan, tajikistan]).
country(indonesia,1.811,27.35,[timor_leste,malaysia]).
country(pakistan,0.77,22.08,[india,afghanistan,china,iran]).
country(bangladesh,0.13,16.46,[india,myanmar]).
country(japan,0.364,12.64,[south_korea,china]).
country(philippines,0.298,10.95,[]).
country(vietnam,0.31,9.73,[cambodia,china,laos]).
country(turkey,0.769,8.43,[georgia,iran,iraq,syria,azerbaijan,armenia]).
country(iran,1.628,8.39,[afghanistan,azerbaijan,armenia,iraq,pakistan,turkey,turkmenistan]).
country(thailand,0.510,6.97,[myanmar,cambodia,laos,malaysia]).
 country(myanmar,0.653,5.44,[bangladesh,china,india,laos,thailand]).
 country(south_korea,0.097,5.12,[north_korea]).
 country(iraq,0.434,4.02,[iran,jordan,kuwait,saudi_arabia,syria,turkey]).
 country(afghanistan,0.652,3.89,[pakistan,iran,turkmenistan,tajikistan,china,uzbekistan]).
country(saudi_arabia,2.149,3.48,[iraq,jordan,kuwait,oman,qatar,united_arab_emirates,yemen]).
country(uzbekistan,0.425,3.34,[afghanistan,kazakhstan,kyrgyzstan,tajikistan,turkmenistan]).
 country(malaysia,0.328,3.23,[brunei,indonesia,thailand,singapore]).
 country(yemen,0.527,2.98,[saudi_arabia,oman]).
 country(nepal,0.143,2.91,[india,china]).
 country(north_korea,0.120,2.57,[south_korea,china]).
 country(taiwan,0.035,2.38,[]).
 country(sri_lanka,0.062,2.14,[india]).
 country(kazakhstan,2.699,1.87,[china,kyrgyzstan,turkmenistan,uzbekistan]).
 country(syria,0.183,1.75,[iraq,israel,jordan,lebanon,turkey]).
 country(cambodia,0.176,1.67,[vietnam,thailand,laos]).
 country(jordan,0.088,1.02,[iraq,israel,saudi_arabia,syria,state_of_palestine]).
 country(azerbaijan,0.082,1.01,[armenia,georgia,iran,turkey]).
 country(united_arab_emirates,0.083,0.98,[oman,qatar,saudi_arabia]).
 country(tajikistan,0.139,0.95,[afghanistan,china,kyrgyzstan,uzbekistan]).
 country(israel,0.021,0.86,[jordan,lebanon,syria,state_of_palestine]).
 country(hong_kong,0.001,0.74,[china]).
 country(laos,0.230,0.72,[myanmar,cambodia,china,thailand,vietnam]).
country(lebanon,0.010,0.68,[israel,syria]).
 country(kyrgyzstan,0.191,0.65,[china,kazakhstan,tajikistan,uzbekistan]).
 country(turkmenistan,0.469,0.60,[afghanistan,iran,kazakhstan,uzbekistan]).
country(singapore,0.0007,0.58,[malaysia]).
country(state_of_palestine,0.006,0.51,[israel,jordan]).
 country(oman,0.309,0.51,[saudi_arabia,united_arab_emirates,yemen]).
 country(kuwait,0.017,0.42,[iraq,saudi_arabia]).
 country(georgia,0.069,0.39,[armenia,azerbaijan,turkey]).
 country(mongolia,1.553,0.32,[china]).
 country(armenia,0.028,0.29,[azerbaijan,georgia,turkey]).
 country(qatar,0.011,0.28,[saudi_arabia,united_arab_emirates,bahrain]).
 country(bahrain,0.0007,0.17,[saudi_arabia,qatar]).
 country(timor_leste,0.014,0.13,[indonesia]).
 country(cyprus,0.009,0.12,[syria,turkey,lebanon]).
 country(bhutan,0.038,0.07,[india,china]).
 country(macao,0.00003,0.06,[china]).
 country(maldives,0.0003,0.05,[]).
 country(brunei,0.005,0.04,[malaysia]).



% density(countryname,density)
% countryname is in lowercase and space is given with '_'
% density is in crores per million km^2
/* This predicate has 2 arguments i.e density/2 */

% This predicate first takes info about the country from the database and then uses the
% data about the population and area, dividing them and then storing the result in D.


density(S,D):-
	country(S,X,Y,Z),
	D is Y/X.


/* The find_pop predicate tries to find a country from the
 given list of countries who has area and population 
greater than a given value. This is done by recursing
over the list of neighbouring countries list and 
checking the required condition at each stage.
This predicate has 3 arguments i.e find_pop/3 */


% we use this predicate as a part of the process of finding a neighbouring country 
% with population and area greater than the given country. 


find_pop(X,Y,[H|T]):-
	country(H,A,B,C),
	A>X,B>Y;
	find_pop(X,Y,T).

% The following predicate is used to find if there is a neighbouring country
% which has population and area greater than the given country. It first uses the data from
% the database we wrote intially and then takes the list of neighbours, area and population which are then
% used by the find_pop predicate to give us the required answer.
/* This predicate has 1 arguments i.e bigger_pop/1 */

bigger_pop(S):-
	country(S,X,Y,[H|T]),
	find_pop(X,Y,[H|T]).

/* The find_den predicate tries to find a country from the
 given list of countries who has density greater than a given value. This is done by recursing
over the list of neighbouring countries list and checking the required condition at each stage.
This predicate has 2 arguments i.e find_den/2 */

find_den(D1,[H|T]):-
	density(H,D2),
	D2>D1;
	find_den(D1,T).

% The following predicate is used to find if there is a neighbouring country
% which has denisty greater than the given country. It first uses the data from
% the database we wrote intially and then takes the list of neighbours, and uses the predicate density to get the density, these are then
% used by the find_den predicate to give us the required answer.
/* This predicate has 1 arguments i.e greater_den/1 */

greater_den(S):-
	country(S,X,Y,[H|T]),
	density(S,D1),
	find_den(D1,[H|T]).