x <- rnorm (100)
hist(x)
y <- rnorm(100)
plot(x, y)
z <- rnorm(100)
plot(x, z)
par(mar = c(2, 2, 2, 2))
plot(x, y, pch=10)
title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", legend="Data", pch=20)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd = 3, col = "blue")

plot(x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)
fit <- lm(y ~ x)
abline(fit, lwd = 3, col = "red")
z <- rpois(100, 2)
par(mfrow = c(2, 1))
plot(x, y, pch = 20)
plot(x, z, pch=19)
par(mar = c(2, 2, 1, 1))
plot(x, y, pch = 20)

##Voor margin en grootte per grafiek.
par(mfrow = c(2, 2))

par(mfrow = c(1, 1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50, labels = c("Male", "Female"))
str(g)
plot(x, y)

##No data in graph
plot(x, y, type = "n")

##Subset only males
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue", pch = 19)
