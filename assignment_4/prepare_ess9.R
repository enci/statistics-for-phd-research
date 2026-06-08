
make_income_monthly <- function(x){
  result = x
  which_weekly = which(ess9$infqbst == 1)
  which_annual = which(ess9$infqbst == 3)
  result[which_weekly] = x[which_weekly] * 52/12
  result[which_annual] = x[which_annual] / 12
  
  return(result)
}

netincome = make_income_monthly(ess9$netinum)
fairnetincome = make_income_monthly(ess9$frlneti)

my_country = "FR"

whichselected = which(ess9$cntry == my_country & 
                        ess9$netinum < 6666666 &
                        ess9$netusoft <= 5 & netincome > 0 &
                        ess9$happy < 11 & ess9$hhmmb < 77 &
                        ess9$yrbrn < 3000 & ess9$netustm < 6666 &
                        ess9$polintr < 7)


data_ess9 = data.frame(
  netincome = netincome[whichselected],
  fairnetincome = fairnetincome[whichselected],
  age = 2018 - ess9$yrbrn[whichselected], 
  useinternetoften = as.numeric(ess9$netusoft[whichselected] == 5) ,
  timeinternet = ess9$netustm[whichselected],
  happy = ess9$happy[whichselected],
  anweight = ess9$anweight[whichselected],
  number_household = ess9$hhmmb[whichselected],
  polintr = factor(ess9$polintr[whichselected], levels = 1:4))

