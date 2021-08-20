# 1. creating and saving graph

mtcars
plot(mtcars$wt, mtcars$mpg)
abline(lm(mtcars$mpg ~ mtcars$wt))
title("Regression of MPG on weight")

pdf("plot_mpg_wt.pdf")

attach(mtcars)
plot(wt, mpg)
abline(lm(mpg ~ wt))
title ("Regression pg MPG on Weight")
detach (mtcars)

dev.off()

jpeg("plot_mpg_wt.jpeg")

attach(mtcars)
plot(wt, mpg)
abline(lm(mpg ~ wt))
title("Regression pg MPG on Weight")
detach(mtcars)

dev.off()