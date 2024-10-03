#!/usr/local/bin/Rscript

library(raster)
library(rgdal)

tgl <- commandArgs(trailingOnly = TRUE)
suhumax = brick("data/suhumax.nc")
load("~/Data_riset/SHPZom9120.Rda")

suhumaxmax = disaggregate(stackApply(suhumax, rep(1, 7), fun= max), 10, method = "bilinear")

CropPlot = mask(disaggregate(crop(suhumaxmax, SHPZom9120), 5, method = "bilinear"), SHPZom9120)

redblue = colorRampPalette(c("red","orange","blue"))

pdf(file = "output/suhumax.pdf", height =5, width = 7)
plot(CropPlot, col = rev(redblue(5)), 
main = paste0("Suhu Maksimum Tanggal ", paste(tgl, collapse = " "))
)
plot(SHPZom9120, add = T)
dev.off()