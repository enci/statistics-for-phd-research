

```{r}
library(haven)
ess9 <- read_sas("ess9e02.sas7bdat")
ess9 <- data.frame(ess9)
source("Assignment6_prepare_ess9.R")
```