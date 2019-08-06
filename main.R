install.packages("plumber")

pr <- plumber::plumb('bos_rf_score.R'); pr$run(host='0.0.0.0', port=8000)

list(df=MASS::Boston[1:10,])
