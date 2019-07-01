


*** Generate Tables and figures of the article: Historical Analysis of National Subjective Wellbeing using Millions of Digitized Books, published on Nature Human Behaviour  

**** Enter the path you save the folder "TableFigure_Nature" and run this do file. All tables and figures will be saved in the folder output.

clear


set memory 700m
set matsize 10000 



global path "/Users/thomashills/Downloads/TableFigure_Nature"

use "$path/nature_valence.dta", clear



********************** FIGURES *********************************************************************************************

 ********************* Main text: scatter plot LS vs Valence- Figure 1

 graph twoway  (lfit val_resC satislfe_resC if C != 2 & C != 3 & satislfe !=.)/*
*/ (scatter val_resC satislfe_resC if C == 1 & satislfe !=. , mcolor(blue)  )/*
*/(scatter val_resC satislfe_resC if C == 4 & satislfe !=. , mcolor(blue)) /*
*/(scatter val_resC satislfe_resC if C ==5 & satislfe !=. , mcolor(blue)), ylab(, nogrid)  /*
*/ytitle("National Valence Index" ) xtitle("Survey-based Life Satisfaction") graphregion(color(white)) bgcolor(white) legend(off) note("correlation = 0.5508 (pvalue<0.01)") 
graph save $path/output/val_ls.gph,  replace
graph export $path/output/val_ls_scR.pdf,  replace


********* Main text: 2nd figure  Graphs on Estimated Life Satisfaction x year - Figure 2

*** Main text: UK, US, Germany and Italy
set more off

graph twoway  (line valence year if C==4 & year >= 1800, lcolor(blue) yaxis(1) xlabel(1800(50)2000)  /*
*/ xline(1815 1848 1915 1918 1938 1945, lpattern(dash) lwidth(thin)) note("Britain") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
  graph save "$path/output/britain.gph", replace

  graph twoway (line valence  year  if C==1  & year >= 1800,  lcolor(blue) yaxis(1) xlabel(1800(50)2000) /*
*/  xline(1803 1815 1848 1870 1915 1918 1934 1938 1945 1989 , lpattern(dash) lwidth(thin))  note("Germany") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
graph save "$path/output/germany.gph", replace

graph twoway (line valence year if C==5 & year>= 1800  , lcolor(blue) xlabel(1800(50)2000)/*
*/ xline( 1848 1861 1870 1915 1918 1938 1945, lpattern(dash) lwidth(thin))  note("Italy") legend(off)) /*
*/ , ytitle("", axis(1) ) xtitle("")
graph save "$path/output/italy.gph", replace
  
graph twoway (line valence year if C==6 & year>=1800 ,lcolor(blue) xlabel(1800(50)2000) /*
*/ xline(1861 1865 1915 1918 1929 1938 1945 1953 1975 , lpattern(dash) lwidth(thin))    note("USA") legend(off)) /*
*/, ytitle("", axis(1) )  xtitle("")
graph save "$path/output/us.gph", replace
  


cd "$path/output
 
graph combine us.gph britain.gph germany.gph italy.gph,  rows(2) cols(2) 

graph export "$path/output/history_ls_sc.pdf", replace






********* supplementary material  : Graphs on Word Count and Word Covered - Figure A.2
graph twoway  (line lcount year if C==1 & year >= 1700, ylabel(#2, axis(1)) xlabel(1700(50)2000) note("Germany") legend(off)) /*
*/ (line wcovered_valence year if C==1 & year >= 1700, yaxis(2)), xtitle("") xline(1820 , lpattern(dash) lwidth(thin)) graphregion(color(white)) bgcolor(white)
 graph save "$path/output/germany_words.gph",  replace
  

 graph twoway  (line lcount year if C==4 & year >= 1700, ylabel(#2, axis(1)) yaxis(1) xlabel(1700(50)2000)  note("Britain") legend(off)) /*
*/ (line wcovered_valence year if C==4 & year >= 1700, yaxis(2)), xtitle("") xline(1820 , lpattern(dash) lwidth(thin)) graphregion(color(white)) bgcolor(white)
graph save "$path/output/britain_words.gph",  replace


 graph twoway  (line lcount year if C==5 & year >= 1700, ylabel(#2, axis(1)) yaxis(1) xlabel(1700(50)2000)  note("Italy") legend(off)) /*
*/ (line wcovered_valence year if C==5 & year >= 1700, ylabel(#3, axis(2)) yaxis(2)), xtitle("") xline(1820 , lpattern(dash) lwidth(thin)) graphregion(color(white)) bgcolor(white)
graph save "$path/output/italy_words.gph",  replace
 
graph twoway  (line lcount year if C==6 & year >= 1700, ylabel(#3, axis(1)) yaxis(1) xlabel(1700(50)2000)  note("United States") legend(off)) /*
*/ (line wcovered_valence year if C==6 & year >= 1700, ylabel(#4, axis(2)) yaxis(2)), xtitle("") xline(1820 , lpattern(dash) lwidth(thin)) graphregion(color(white)) bgcolor(white)
graph save "$path/output/us_words.gph",  replace

 
 cd $path/output
 
graph combine us_words.gph britain_words.gph germany_words.gph  italy_words.gph , xcommon rows(2) cols(2)  
 graph export "$path/output/words.pdf", replace 

 
 **** Figure A.3 -- See at the bottom 
 
 
 *********************************** Supplementary Material Ls vs Valence Times series: Figure A.4 ************************************************************


set more off

 graph twoway (line satislfe  year  if C==1 & year >= 1970 ,  lcolor(blue) yaxis(1) ylabel(2.8(0.1)3.2) title(Germany) lwidth(thin) ytitle("", axis(1) ) note("corr = 0.1835") legend(off)) /*
*/(line valence year if C==1 & year >= 1970,  yaxis(2) xtitle("") ytitle("", axis(2) ) ylabel(5.75(0.05)6.00, axis(2)) ), graphregion(color(white)) bgcolor(white)
graph save "$path/output/germany_v_ls.gph", replace

/*


           | satislfe  valence
-------------+------------------
    satislfe |   1.0000 
             |
             |
     valence |   0.1835   1.0000 
             |   0.2912

             |

*/


 graph twoway (line satislfe  year  if C==4 & year >= 1970 , lcolor(blue) yaxis(1)  ylabel(3.05(0.1)3.25) title(Britain)  lwidth(thin) ytitle("" , axis(1) ) note("corr = 0.4453") legend(off)) /*
*/(line valence year if C==4 & year >= 1970, yaxis(2) ylabel(5.59(0.02)5.64, axis(2)) xtitle("") ytitle("" , axis(2))), graphregion(color(white)) bgcolor(white)
graph save "$path/output/britain_v_ls.gph", replace


 /*
 
             | satislfe  valence
-------------+------------------
    satislfe |   1.0000 
             |
             |
     valence |   0.4453*  1.0000 
             |   0.0083
             |


     
			 */ 

 graph twoway (line satislfe  year  if C==5 & year >= 1970 , lcolor(blue) yaxis(1) ylabel(2.5(0.2)3)  title(Italy)  lwidth(thin) ytitle("" , axis(1) ) note("corr = 0.8388") legend(off)) /*
*/(line valence year if C==5 & year >= 1970, ylabel(5.85(0.1)6.05, axis(2)) yaxis(2)  xtitle("") ytitle("" , axis(2))) , graphregion(color(white)) bgcolor(white)
graph save "$path/output/italy_v_ls.gph", replace

  
/*  
           | satislfe  valence
-------------+------------------
    satislfe |   1.0000 
             |
             |
     valence |   0.8254*  1.0000 
             |   0.0000
             |

*/
  
  

cd "$path/output
 
graph combine  britain_v_ls.gph germany_v_ls.gph italy_v_ls.gph  val_ls.gph,  rows(3) cols(2)

graph export "$path/output/v_ls.pdf", replace


 ** USA  Figure A.5 
 
 
 graph twoway (scatter satislfe_us year if C==6 & year >= 1970 & year<2010  , connect(direct) lpattern(dash)   lcolor(blue) yaxis(1) title(USA) lwidth(thin) ytitle("", axis(1) ) note("correlation = 0.4259 (pvalue = 0.0300)") legend(off)) /*
*/(line valence year if C==6 &  year<2010 & year >= 1970 ,  yaxis(2) xtitle("") ytitle("", axis(2) ) ), graphregion(color(white)) bgcolor(white)
graph export "$path/output/USA_v_ls.pdf", replace

  
  /*
             | z_life~n z_vale~e
-------------+------------------
z_lifesati~n |   1.0000 
             |
             |
   z_valence |   0.4259   1.0000 
             |   0.0300
*/


******************** COHA - US --  Figure A.6
graph twoway  (line valence year if C==6 & year >= 1820, yaxis(1) xlabel(1820(20)2000) title("United States")  note("Correlation = 0.6144  (pvalue =  0.0051)") legend(off)) /*
*/ (scatter val_score_coha year if C==6 & year >= 1820, connect(direct) lpattern(dash) yaxis(2)), xtitle("") graphregion(color(white)) bgcolor(white)
graph export "$path/output/us_coha.pdf",  replace

/*
pwcorr valence val_score_coha if C==6 & year  >= 1820 , sig


           |  valence val_sc~a
-------------+------------------
     valence |   1.0000 
             |
             |
val_score_~a |   0.6144   1.0000 
             |   0.0051



*/




******************** FMP - UK -- Figure A.7 

graph twoway  (line valence year if C==4 & year >= 1820 & year < 1951 , yaxis(1) xlabel(1820(20)1950) title("Britain")  note("Correlation = 0.4554  (pvalue < 0.000)") legend(off)) /*
*/ (line val_score_fmp year if C==4 & year >= 1820 & year < 1951,   yaxis(2)), xtitle("") graphregion(color(white)) bgcolor(white)
graph export "$path/output/uk_fmp.pdf",  replace


/*
pwcorr valence val_score_fmp if C==4 & year >= 1820 & year < 1951 , sig



             |  valence val_sc~p
-------------+------------------
     valence |   1.0000 
             |
             |
val_score_~p |   0.4554   1.0000 
             |   0.0000
             |

			 
			 
*/


*********************************************************************************************


************* Supplementary Material - Figure A.8

***  UK, US, Germany and Italy, mobile NVI top 50
  
set more off

graph twoway  (line valence_max_diff_50 year if C==4 & year >= 1800 , lcolor(blue) yaxis(1) xlabel(1800(50)2000)  /*
*/ xline( 1815 1848 1915 1918 1938 1945, lpattern(dash) lwidth(thin)) note("Britain") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
  graph save "$path/output/britain.gph", replace

 graph twoway (line valence_max_diff_50  year  if C==1  & year >= 1800 ,  lcolor(blue) yaxis(1) xlabel(1800(50)2000) /*
*/  xline(1803 1815 1848 1870 1915 1918 1934 1938 1945 1989 , lpattern(dash) lwidth(thin))  note("Germany") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
graph save "$path/output/germany.gph", replace

graph twoway (line valence_max_diff_50 year if C==5 & year>= 1800 , lcolor(blue) xlabel(1800(50)2000)/*
*/ xline( 1848 1861 1870 1915 1918 1938 1945, lpattern(dash) lwidth(thin))  note("Italy") legend(off)) /*
*/ , ytitle("", axis(1) ) xtitle("")
graph save "$path/output/italy.gph", replace
  
graph twoway (line valence_max_diff_50 year if C==6 & year>=1800  ,lcolor(blue) xlabel(1800(50)2000) /*
*/ xline(1861 1865 1915 1918 1929 1938 1945 1953 1975 , lpattern(dash) lwidth(thin))    note("USA") legend(off)) /*
*/, ytitle("", axis(1) )  xtitle("")
graph save "$path/output/us.gph", replace
  
cd "$path/output
 
graph combine us.gph britain.gph germany.gph italy.gph,  rows(2) cols(2) 

graph export "$path/output/history_ls_sc_valence_max_diff.pdf", replace


****   UK, US, Germany and Italy, mobile NVI Top 25 

graph twoway  (line valence_max_diff_25 year if C==4 & year >= 1800 , lcolor(blue) yaxis(1) xlabel(1800(50)2000)  /*
*/ xline( 1815 1848 1915 1918 1938 1945, lpattern(dash) lwidth(thin)) note("Britain") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
  graph save "$path/output/britain.gph", replace

 graph twoway (line valence_max_diff_25  year  if C==1  & year >= 1800 ,  lcolor(blue) yaxis(1) xlabel(1800(50)2000) /*
*/  xline(1803 1815 1848 1870 1915 1918 1934 1938 1945 1989 , lpattern(dash) lwidth(thin))  note("Germany") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
graph save "$path/output/germany.gph", replace

graph twoway (line valence_max_diff_25 year if C==5 & year>= 1800 , lcolor(blue) xlabel(1800(50)2000)/*
*/ xline( 1848 1861 1870 1915 1918 1938 1945, lpattern(dash) lwidth(thin))  note("Italy") legend(off)) /*
*/ , ytitle("", axis(1) ) xtitle("")
graph save "$path/output/italy.gph", replace
  
graph twoway (line valence_max_diff_25 year if C==6 & year>=1800  ,lcolor(blue) xlabel(1800(50)2000) /*
*/ xline(1861 1865 1915 1918 1929 1938 1945 1953 1975 , lpattern(dash) lwidth(thin))    note("USA") legend(off)) /*
*/, ytitle("", axis(1) )  xtitle("")
graph save "$path/output/us.gph", replace
  
cd "$path/output
 
graph combine us.gph britain.gph germany.gph italy.gph,  rows(2) cols(2) 

graph export "$path/output/history_ls_sc_valence_max_diff_25.pdf", replace


*****************************************************************************************************************************************************************








********************* Figure Valence AFINN  --- Figure A.9 
set more off

graph twoway  (line z_valence_afinn z_valence year if C==4 & year >= 1800, lcolor(blue) yaxis(1) xlabel(1800(50)2000)  /*
*/ xline(1815 1848 1915 1918 1938 1945, lpattern(dash) lwidth(thin)) title("Britain") note("correlation =  0.9040 (pvalue<0.01)") legend(off)) /*
*/ , ytitle("", axis(1) )  xtitle("")
  graph export "$path/output/britain_afinn.pdf", replace
 
/* 
pwcorr z_valence_afinn z_valence if C==4 & year >= 1800, sig

             | z_vale~n z_vale~e
-------------+------------------
z_valence_~n |   1.0000 
             |
             |
   z_valence |   0.9040   1.0000 
             |   0.0000
*/
  
  
graph twoway (line z_valence_afinn z_valence year if C==6 & year>=1800 ,lcolor(blue) xlabel(1800(50)2000) /*
*/ xline(1861 1865 1915 1918 1929 1938 1945 1953 1975 , lpattern(dash) lwidth(thin))    title("USA") note("correlation = 0.7850 (pvalue<0.01)") legend(off)) /*
*/, ytitle("", axis(1) )  xtitle("")
graph export "$path/output/us_afinn.pdf", replace
  
  
/*  
pwcorr z_valence_afinn z_valence if C==6 & year >= 1800, sig


             | z_vale~n z_vale~e
-------------+------------------
z_valence_~n |   1.0000 
             |
             |
   z_valence |   0.7850   1.0000 
             |   0.0000

*/


******************************************** TABLES*******************************************************************************


***************************** Main Text: table Valence vs Life satisfaction: Table 1  *********************************************************************
set more off
xtreg satislfe valence lgdp i.year         if  C !=2 & C !=3 , fe cluster(C)
estimates store M2
xtreg satislfe valence lgdp italy_year germany_year uk_year       if  C !=2 & C !=3 , fe cluster(C)
estimates store M3


estout M2 M3 using    $path/output/val_ls_scR.tex,  replace style(tex)/*
*/ keep( valence  )/* 
*/ order(  valence   ) /*
*/  mgroups("1" "2"  , pattern( 1 1)) /*
*/ mlabels(  "Year FE"  "CS trends"  )  /*
*/ indicate(  "GDP = lgdp"  "Country Specific Trend = italy_year" "Year FE = *.year"   )/*
*/cells( b(star fmt(%9.4f))  se(par fmt(%9.4f)) ) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels(valence "National Valence Index" lgdp "Log GDP" lcount "Log Total Words" wcovered_valence "Words Covered" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 


******************************** Main text : 2nd Table: Historical determinant of valence - Table 2


set more off
xi i.year


xtreg valence lgdpM5                       wcovered_valence polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=. , fe cluster(C)
estimates store M1

xtreg valence life_exp1                      wcovered_valence polity2 gini_edu _Iyear_* if C !=2 & C !=3 , fe cluster(C)
estimates store M2

xtreg valence life_exp1 lgdpM5                     wcovered_valence polity2 gini_edu _Iyear_* if C !=2 & C !=3 , fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence life_exp1 lgdpM5  in_confl1          wcovered_valence polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3 , fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/satlfe_p_scR.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1)/* 
*/ order( lgdpM5 life_exp1 in_confl1  ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "World Covered(t)  = wcovered_valence" "Democracy(t)= polity2" "Education Inequality(t) = gini_edu" "Year FE = _Iyear_* " "Country-Specific Trends =  usa_year"  )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM3 "(log) GDP(t-3) "  lgdpM5 "(log) GDP(t-5) "  in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" ww1 "WW1"  ww2_lgdpM "WW2*GDP"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 




***** Supplementary Material: Summary statistics-  Table A1


sutex valence val_score_fmp val_score_coha satislfe satislfe_us polarity_sentic pleasantness_sentic gdpM rgdpch life_exp in_confl polity2 gini_edu wcovered_valence wcovered_valence_FMP wcovered_pleasantness wcovered_polarity wcovered_valence_afinn if year >= 1820 &  C !=2 & C !=3, labels minmax nobs title(Main Variables) /*
*/ file("$path/output/sumstats.tex") replace





***************************** SM: table DValence vs DLife satisfaction: Table A.2 *********************************************************************

set more off
reg d.satislfe d.valence         i.year  if  C !=2 & C !=3
estimates store M1
reg d.satislfe d.valence d.lgdp i.year   if  C !=2 & C !=3
estimates store M2


estout M1 M2 using    $path/output/Dval_Dls_scR.tex,  replace style(tex)/*
*/ keep( D.valence D.lgdp  )/* 
*/ order(  D.valence D.lgdp   ) /*
*/  mgroups("1" "2"  , pattern( 1 1)) /*
*/ mlabels(  "Year FE"  "Year FE+GDP" )  /*
*/ indicate(  "Year FE = *.year"   )/*
*/cells( b(star fmt(%9.4f))  se(par fmt(%9.4f)) ) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels(D.valence "NVI(t)-NVI(t-1)" D.lgdp "Log GDP(t)-Log GDP(t-1)" lcount "Log Total Words" wcovered_valence "Words Covered" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 




******************************** SM: Table: Historical determinant of valence (all variables are visible): Table A.3


set more off
xi i.year

xtreg valence lgdpM5                       wcovered_valence polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg valence life_exp1                      wcovered_valence polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg valence life_exp1 lgdpM5                     wcovered_valence polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence life_exp1 lgdpM5  in_confl1          wcovered_valence polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/satlfe_SMR.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_valence polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_valence polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM3 "(log) GDP(t-3)" lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy " wcovered_valence "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 


********* Supplentary Material Table Lagged Variables in the historical determinants of the valence -- 


********************      Table A.4
set more off

xi i.year 

xtreg valence life_exp    polity2 gini_edu wcovered_valence  _Iy* if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M1
xtreg valence  life_exp1  polity2 gini_edu wcovered_valence  _Iy*  if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M2
xtreg valence  life_exp3   polity2 gini_edu wcovered_valence  _Iy*  if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M3
xtreg valence life_exp5  polity2 gini_edu wcovered_valence  i.year if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M4
xtreg valence life_exp10  polity2 gini_edu wcovered_valence  i.year if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M5


estout M1 M2 M3 M4 M5 using     $path/output/satlfe_p_llex_SMR.tex,  replace style(tex)/*
*/ keep( life_exp life_exp1 life_exp3 life_exp5 life_exp10   wcovered_valence polity2 gini_edu  )/* 
*/ order(life_exp life_exp1 life_exp3 life_exp5 life_exp10  polity2 gini_edu wcovered_valence   ) /*
*/mgroups(  "1" "2" "3" "4" "5" , pattern(1 1 1 1 1)) /*
*/ indicate(  "Year FE = _Iy*"   )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp "Life Expectancy(t)" life_exp3 "Life Expectancy(t- 3)" life_exp1 "Life Expectancy(t- 1)" life_exp5 "Life Expectancy(t- 5)" life_exp10 "Life Expectancy(t- 10)"  /*
*/ lgdpM "(log) GDP(t)" lgdpM3 "(log) GDP(t-3)" lgdpM1 "(log) GDP(t-1)" in_confl_ex_ww "Internal Conflict$^{-}$" /*
*/ in_confl "Internal Conflict(t)" in_confl1 "Internal Conflict(t-1)" in_confl3 "Internal Conflict(t-3)" ex_confl "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy(t)" polity25 "Democracy t- 5"  polity23 "Democracy(t- 3)" polity21 "Democracy(t- 1)" wcovered_valence "Words Covered(t)" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality(t)" gini_edu1 "Education Inequality(t-1)" gini_edu3 "Education Inequality(t-3)" /*
*/ gini_edu5 "Education Inequality t-5" ww1_lgdpM "WW1*GDP"  ww2_lgdpM "WW2*GDP"  ww1_life_exp "WW1*L.Expec."  ww2_life_exp "WW2*L.Expec." /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov "Public Debt" /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" primaryteacher_pc "Primary Teachers" ww1 "WW1" ww2 "WW2" ww1_y "WW1 yr" ww2_y "WW2 yr"  ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 

set more off



*** Table A.5 

xi i.year
xtreg valence  lgdpM polity2 gini_edu  wcovered_valence _Iy* if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M1
xtreg valence  lgdpM1 polity2 gini_edu  wcovered_valence _Iy* if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M2
xtreg valence  lgdpM3 polity2 gini_edu  wcovered_valence _Iy* if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M3
xtreg valence  lgdpM5  polity2 gini_edu  wcovered_valence _Iy* if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M4

xtreg valence  lgdpM10  polity2 gini_edu  wcovered_valence _Iy* if year>=1800 & C !=2 & C !=3, fe cluster(C)
estimates store M5


estout M1 M2 M3 M4 M5 using     $path/output/satlfe_p_llgdp_SMR.tex,  replace style(tex)/*
*/ keep(   lgdpM lgdpM1 lgdpM3 lgdpM5 lgdpM10 wcovered_valence polity2 gini_edu )/* 
*/ order( lgdpM lgdpM1 lgdpM3 lgdpM5 lgdpM10 polity2 gini_edu wcovered_valence   ) /*
*/mgroups(  "1" "2" "3" "4" "5", pattern(1 1 1 1 1)) /*
*/ indicate(  "Year FE = _Iy*"   )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp "Life Expectancy(t)" life_exp3 "Life Expectancy(t- 3)" life_exp1 "Life Expectancy(t- 1)" life_exp5 "Life Expectancy t- 5" /*
*/ lgdpM "(log) GDP(t)" lgdpM3 "(log) GDP(t-3)" lgdpM10 "(log) GDP(t-10)" lgdpM1 "(log) GDP(t-1)" lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Internal Conflict$^{-}$" /*
*/ in_confl "Internal Conflict(t)" in_confl1 "Internal Conflict(t-1)" in_confl3 "Internal Conflict(t-3)" ex_confl "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy(t)" polity25 "Democracy t- 5"  polity23 "Democracy(t- 3)" polity21 "Democracy(t- 1)" wcovered_valence "Words Covered(t)" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality(t)" gini_edu1 "Education Inequality(t-1)" gini_edu3 "Education Inequality(t-3)" /*
*/ gini_edu5 "Education Inequality t-5" ww1_lgdpM "WW1*GDP"  ww2_lgdpM "WW2*GDP"  ww1_life_exp "WW1*L.Expec."  ww2_life_exp "WW2*L.Expec." /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov "Public Debt" /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" primaryteacher_pc "Primary Teachers" ww1 "WW1" ww2 "WW2" ww1_y "WW1 yr" ww2_y "WW2 yr"  ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 



***** Table A.6 

xtreg valence in_confl                                      wcovered_valence  if C !=2 & C !=3, fe cluster(C)
estimates store M1
xtreg valence in_confl1                                     wcovered_valence if C !=2 & C !=3, fe cluster(C)
estimates store M2
xtreg valence in_confl3                                    wcovered_valence if C !=2 & C !=3, fe cluster(C)
estimates store M3
xtreg valence in_confl5                                    wcovered_valence  if C !=2 & C !=3, fe cluster(C) 
estimates store M4
xtreg valence in_confl10                                    wcovered_valence  if C !=2 & C !=3, fe cluster(C) 
estimates store M5

estout M1 M2 M3 M4 M5 using     $path/output/satlfe_p_l1_SMR.tex,  replace style(tex)/*
*/ keep( in_confl in_confl1 in_confl3 in_confl5 in_confl10 wcovered_valence)/* 
*/ order(in_confl in_confl1 in_confl3 in_confl5 in_confl10 wcovered_valence) /*
*/mgroups(  "1" "2" "3" "4" "5" , pattern(1 1 1 1 1)) /*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp "Life Expectancy " lgdpM3 "GDP (log)" in_confl3 "Internal Conflict(t-3)"/*
*/ in_confl2 "Internal Conflict(t-2)" in_confl "Internal Conflict(t)" in_confl1 "Internal Conflict(t-1)" in_confl5 "Internal Conflict(t-5)"  in_confl10 "Internal Conflict(t-10)"   ex_confl "External Conflict t"/*
*/ ex_confl1 "External Conflict t-1" ex_confl2 "External Conflict t-2" ex_confl3 "External Conflict t-3" polity21 "Democracy " wcovered_valence "Words Covered(t)" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1_lgdpM "WW1*GDP"  ww2_lgdpM "WW2*GDP"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2_life_exp "WW2*L.Expec." /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 






*********** ******************************** SM: Table: Historical determinant of valence Robustness check (all variables are visible)  -- 

**** Table A.8 
set more off
xi i.year

xtreg valence_max_diff_50 lgdpM5                     wcovered_valence_max_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  valence_max_diff_50 life_exp1                      wcovered_valence_max_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg valence_max_diff_50 life_exp1 lgdpM5                wcovered_valence_max_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence_max_diff_50 life_exp1 lgdpM5  in_confl1      wcovered_valence_max_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/satlfe_max_diff_50.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_valence_max_diff_50  polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_valence_max_diff_50  polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy "  wcovered_valence_max_diff_50 "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 




******  --- Table A.9





set more off
xi i.year


 
 
xtreg valence_max_diff_25 lgdpM5                       wcovered_valence_max_diff_25 polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  valence_max_diff_25 life_exp1                     wcovered_valence_max_diff_25 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg valence_max_diff_25 life_exp1 lgdpM5               wcovered_valence_max_diff_25 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence_max_diff_25 life_exp1 lgdpM5  in_confl1     wcovered_valence_max_diff_25 polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/satlfe_max_diff_25.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_valence_max_diff_25 polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_valence_max_diff_25 polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy " wcovered_valence_max_diff_25 "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 





**** Table A.10

set more off
xi i.year
 
xtreg valence_mean_diff_50 lgdpM5                     wcovered_valence_mean_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  valence_mean_diff_50 life_exp1                      wcovered_valence_mean_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg valence_mean_diff_50 life_exp1 lgdpM5                wcovered_valence_mean_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence_mean_diff_50 life_exp1 lgdpM5  in_confl1      wcovered_valence_mean_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/satlfe_mean_diff_50.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_valence_mean_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_valence_mean_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy "  wcovered_valence_mean_diff_50 "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 



*** ALTERNATIVE MEASURE OF VALENCE (using the valence of teh co-occurring words) Table A.11


set more off
xi i.year


 
 
xtreg valence1_max_diff_50 lgdpM5                     wcovered_valence1_max_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  valence1_max_diff_50 life_exp1                      wcovered_valence1_max_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg valence1_max_diff_50 life_exp1 lgdpM5                wcovered_valence1_max_diff_50 polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence1_max_diff_50 life_exp1 lgdpM5  in_confl1      wcovered_valence1_max_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/satlfe1_max_diff_50.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1 wcovered_valence1_max_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_valence1_max_diff_50 polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy "  wcovered_valence1_max_diff_50 "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 





***** Find My Past Data and Google - Table A.12 

 

reg z_val_score_fmp  lgdpM  ww1 ww2  wcovered_valence_FMP if year >1820 & C==4 
estimates store M1
reg z_valence        lgdpM5  ww1 ww2 wcovered_valence  if year >1820 & val_score_fmp !=.
estimates store M2

estout M1 M2 M3 using     $path/output/valence_fmp.tex,  replace style(tex)/*
*/ keep( lgdpM lgdpM5 ww1 ww2 wcovered_valence wcovered_valence_FMP )/* 
*/ order(lgdpM lgdpM5 ww1 ww2 wcovered_valence wcovered_valence_FMP ) /*
*/mgroups(  "1820-1950" "1820-1950", pattern(1 1)) /*
*/mlabels( "FindMyPast" "Google"  ) /*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp "Life Expectancy " life_exp1 "Life Expectancy t-1" lgdpM5 "GDP (log) t-5"  lgdpM "GDP (log) t" in_confl3 "Internal Conflict(t-3)"/*
*/ in_confl2 "Internal Conflict(t-2)" in_confl "Internal Conflict(t)" in_confl1 "Internal Conflict(t-1)" ex_confl "External Conflict t"/*
*/ ex_confl1 "External Conflict t-1" ex_confl2 "External Conflict t-2" ex_confl3 "External Conflict t-3" polity21 "Democracy " /*
*/ wcovered_valence "Words Covered(t)" wcovered_valence_FMP "Words Covered(t)" wcovered_valence_afinn "Words Covered(t)" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1_lgdpM "WW1*GDP"  ww2_lgdpM "WW2*GDP"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2_life_exp "WW2*L.Expec." /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww1 "WW1" ww2 "WW2" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 



set more off
xi i.year


 
 **** Pleasantness  - Table A.13 
 
xtreg pleasantness_sentic lgdpM5                       wcovered_pleasantness polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  pleasantness_sentic life_exp1                   wcovered_pleasantness polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg pleasantness_sentic life_exp1 lgdpM5              wcovered_pleasantness polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg pleasantness_sentic life_exp1 lgdpM5  in_confl1     wcovered_pleasantness polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/pleasantness.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_pleasantness polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_pleasantness polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy " wcovered_pleasantness "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 




set more off
xi i.year




 **** Polarity  --- Table A.14

 
 xtreg polarity_sentic lgdpM5                       wcovered_polarity polity2 gini_edu _Iyear_* if C !=2 & C !=3 & life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  polarity_sentic life_exp1                   wcovered_polarity polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M2

xtreg polarity_sentic life_exp1 lgdpM5              wcovered_polarity polity2 gini_edu _Iyear_* if C !=2 & C !=3, fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg polarity_sentic life_exp1 lgdpM5  in_confl1     wcovered_polarity polity2 gini_edu italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/polarity.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_polarity polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_polarity polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy " wcovered_polarity "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 




 **** Valence Afinn Only US and UK 
 
 
set more off
xi i.year
xtreg valence_afinn lgdpM5                       wcovered_valence_afinn polity2 gini_edu _Iyear_* if life_exp1 !=., fe cluster(C)
estimates store M1

xtreg  valence_afinn life_exp1                  wcovered_valence_afinn polity2 gini_edu _Iyear_* , fe cluster(C)
estimates store M2

xtreg valence_afinn life_exp1 lgdpM5             wcovered_valence_afinn polity2 gini_edu _Iyear_* , fe cluster(C)
estimates store M3

*xtreg valence life_exp lgdpM3                    wcovered_valence polity21 gini_edu  italy_year germany_year uk_year usa_year if C !=2 & C !=3, fe cluster(C)
*estimates store M2

xtreg valence_afinn life_exp1 lgdpM5  in_confl1     wcovered_valence_afinn polity2 gini_edu  uk_year usa_year , fe cluster(C)
estimates store M4



estout M1 M2 M3 M4 using     $path/output/valence_afinn.tex,  replace style(tex)/*
*/ keep( life_exp1 lgdpM5  in_confl1  wcovered_valence_afinn polity2 gini_edu italy_year germany_year uk_year usa_year)/* 
*/ order( lgdpM5 life_exp1 in_confl1 wcovered_valence_afinn polity2 gini_edu italy_year germany_year uk_year usa_year ) /*
*/mgroups( "1"  "2" "3" "4", pattern( 1 1 1 1 )) /*
*/mlabels( "Year FE" "Year FE" "Year FE"  "CS Trends" "CS Trends + Conflicts" ) /*
*/ indicate( "Year FE =  _Iyear* " )/*
*/cells( b(star fmt(%9.4f)) se(par fmt(%9.4f))) /*
*/msign(--) starlevels(* .1 ** .05 *** .01) stardetach substitute(_ \_) stats(r2 N, fmt( %9.3f %9.0f))/*
*/ varlabels( life_exp1 "Life Expectancy(t-1) " lgdpM5 "(log) GDP(t-5)" in_confl_ex_ww "Other Internal Conflicts" in_confl1 "Internal Conflict(t-1)" ex_confl /*
*/ "External Conflict"/*
*/ ex_confl_ex_ww "External Conflict$^{-}$" polity2 "Democracy " wcovered_pleasantness "Words Covered" lcount "Total Words (log)" lrealism "Realism" /*
*/lyear "Year" leducF "Education (est.)" gini_edu "Education Inequality" ww1 "WW1"  ww "World Wars"  ww1_life_exp "WW1*L.Expec." /*
*/ ww2 "WW2" italy_year "Italy Trend" germany_year "Germany Trend" uk_year "UK Trend" usa_year "USA Trend" /*
*/ infantdeath "Infant Mortality" gov_exp "Government Expenditures"  debt_gov /*
*/ "Public Debt" ww2_infantdeath "WW2*Inf. Mort." ww1_infantdeath "WW2*Inf. Mort." /*
*/ gov_rev "Government Revenues"  inflation "Inflation" deflation "Deflation" lpop "Population (log)" /*
*/ primaryteacher_pc "Primary Teachers" ww11 "WW1 t-1" ww21 "WW2 t-1" ) /* 
*/prehead("\begin{tabular} {l* {@M}{r @{} l}}" "\hline")/*
*/posthead(\hline) prefoot( \\) postfoot("\hline" "\end{tabular}") 






***** USE A DIFFERENT DATASET 
************************** FIGURE A.3  Average Valence and Correlations with Life Satisfaction: All Countries Available.


use "$path/words.dta", clear



encode country, gen(C)


g positive = ( cor >0)
g pos_sig = ( pvalue <0.05 & cor>0 )
g sig = ( pvalue <0.05 )


****************************************************************************
preserve
drop if sig==0
drop if C==3 | C==2 /*Drop Spain and France*/
ttest valence, by(positive)
collapse (mean)  mvalence = valence  (sd) sdvalence = valence   (count) n = valence , by(positive)
label variable mvalence "Valence"
label variable positive "Correlations"
generate hivalence = mvalence + invttail(n-1,0.025)*(sdvalence / sqrt(n))
generate lowvalence = mvalence - invttail(n-1,0.025)*(sdvalence / sqrt(n))
twoway (bar mvalence positive) , xlab( 0 "Negative"  1  "Positive") title("All") note("p-value(diff>0) < 0.001 ") ylabel(3(0.5)6) scheme(s2mono) legend(off) graphregion(fcolor(white) ifcolor(white)) ytitle(Valence)
graph save Graph "$path/output/bar_valence_all.gph", replace
restore



preserve
drop if sig==0
collapse (mean)  mvalence = valence  (sd) sdvalence = valence   (count) n = valence if C==4, by(positive)
label variable mvalence "Valence"
label variable positive "Correlations"
generate hivalence = mvalence + invttail(n-1,0.025)*(sdvalence / sqrt(n))
generate lowvalence = mvalence - invttail(n-1,0.025)*(sdvalence / sqrt(n))
twoway (bar mvalence positive), xlab( 0 "Negative"  1  "Positive") note("p-value(diff>0) < 0.001 ") title("UK") ylabel(3(0.5)6) scheme(s2mono) legend(off) graphregion(fcolor(white) ifcolor(white)) ytitle(Valence)
graph save Graph "$path/output/bar_valence_uk.gph", replace
restore


preserve
drop if sig==0
collapse (mean)  mvalence = valence  (sd) sdvalence = valence   (count) n = valence if C==1, by(positive)
label variable mvalence "Valence"
label variable positive "Correlations"
generate hivalence = mvalence + invttail(n-1,0.025)*(sdvalence / sqrt(n))
generate lowvalence = mvalence - invttail(n-1,0.025)*(sdvalence / sqrt(n))
twoway (bar mvalence positive) , xlab( 0 "Negative"  1  "Positive") title("Germany") note("p-value(diff>0) = 0.0857 ") ylabel(3(0.5)6) scheme(s2mono) legend(off) graphregion(fcolor(white) ifcolor(white)) ytitle(Valence) 
graph save Graph "$path/output/bar_valence_ge.gph", replace
restore


preserve
drop if sig==0
collapse (mean)  mvalence = valence  (sd) sdvalence = valence   (count) n = valence if C==5, by(positive)
label variable mvalence "Valence"
label variable positive "Correlations"
generate hivalence = mvalence + invttail(n-1,0.025)*(sdvalence / sqrt(n))
generate lowvalence = mvalence - invttail(n-1,0.025)*(sdvalence / sqrt(n))
twoway (bar mvalence positive) , xlab( 0 "Negative"  1  "Positive")  title("Italy") note("p-value(diff>0) < 0.001 ") ylabel(3(0.5)6) scheme(s2mono) legend(off) graphregion(fcolor(white) ifcolor(white)) ytitle(Valence) 
graph save Graph "$path/output/bar_valence_it.gph", replace
restore




cd $path/output

graph combine bar_valence_all.gph  bar_valence_uk.gph bar_valence_ge.gph bar_valence_it.gph  , xcommon  

graph export "$path/output/pos_neg_corr.pdf", replace






