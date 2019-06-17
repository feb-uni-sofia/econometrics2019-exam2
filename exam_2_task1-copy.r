trips <- read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/trips.csv', stringsAsFactors = FALSE)
str(trips)

##1a 
## ok
mean (trips$trip_duration)

##1b
## ok
trips <- within ( trips, {
  weekend <- (trips$day == "weekend")
  })

trips <- within (trips, {
  trip_duration_minutes <- trip_duration / 60 
})

##1c
## ok
fit <- lm (trip_duration_minutes~weekend , data = trips)
summary (fit)

## 1d
## С черта обикновено означаваме средно аритметично. Тук ще е y_hat (прогнозна стойност от модела)
## Yi(cherta) = 13.7072 + 1.9561weekend

##1e explanation
## Средно 13.7 минути трае пътуване с такси в работен ден
## Пътуванията събота и неделя средно траят 1.95 минути повече.

##1f 
## Този въпрос се отнася за тест с едностранна алтернатива и такива не сме обсъждали на лекцията
## t stats 2.442 with p-value < 0.05
## reject H0 at 10% error probability

##1g explanation
## Този въпрос се отнася за диагностика на модела, което също не сме обсъждали

