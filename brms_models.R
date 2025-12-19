
#model codes to run and store before knitting

fit_lag <- brm(
  PAL_int_scale ~ lag_density_scale + s(frequency, k=8) + (1 | species/subject),
  data = earHair,
  family = gaussian(),
  prior = c(
    prior(normal(0, 1), class = "b"),
    prior(normal(0, 2), class = "Intercept"),
    prior(exponential(1), class = "sd"),
    prior(exponential(1), class = "sigma")
  ),
  chains = 4,
  iter = 10000,
  cores = 4,
  control = list(adapt_delta = 0.95)
)


saveRDS(fit_lag, file = "fit_lag.rds")

summary(fit_lag)
plot(fit_lag)

