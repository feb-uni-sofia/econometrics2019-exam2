store <- read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/store.csv', stringsAsFactors = FALSE)
str(store)

##2a 
fit <- lm (Sales ~ SchoolHoliday + Customers , data = store)
summary (fit)

mean(store$Sales[store$SchoolHoliday == 1])

##2b 
## Sales_hat =-114.61793 +  33.55643*SchoolHoliday + 8.70630*Customers

##2c explanation 
## -114 евро (intercept) е прогноза за очакваното ниво на продажби
## в ден, който не е училищна ваканция и няма нито един клиент.
## При константен брой клиенти продажбите по време на училищни ваканции
## са средно 33.55 евро по-високи
## Нивото на продажбите е средно с 8.7 евро по-високо за всеки допълнителен
## клиент.

##2d + explanatiion
## ok

fit1 <- lm (Sales ~ SchoolHoliday , data = store)
summary (fit1)

## По време на ваканции в магазина има средно повече киенти отколкото
## в дни без ваканции. Нивото на продажби е свързано с броя клиенти.

##2e 
## ok

store <- within (store, {
  CustomersCentered <- Customers - mean(Customers)
})

fit2 <- lm (Sales ~ SchoolHoliday + CustomersCentered , data=store)
summary (fit2)

##2f ?

## Виж какво е значението на beta_0 в този модел. От там идва и прогнозата.