# Instalando pacotes ------------------------------------------------------
install.packages("terra")
install.packages("sf")

# Carregando (usando) os pacotes ------------------------------------------
library(terra)
library(sf)

# Carregando um dado de entrada -------------------------------------------
srtm = rast("data/srtm.tif")
srtm
plot(srtm) 
landsat = rast("data/landsat.tif")

# Verificando a imagem ----------------------------------------------------
ncol(srtm) # mostra o n?mero de colunas da imagem
nrow(srtm) # mostra o n?mero de linhas da imagem
nlyr(srtm) # mostra o n?mero de camadas da imagem
nlyr(landsat) # mostra o n?mero de camadas da imagem
res(srtm) # mostra a resolu??o da imagem
res(landsat) # mostra a resolu??o da imagem
ext(srtm) # mostra a extens?o da imagem

# Opera??es b?sicas -------------------------------------------------------
srtm2 = srtm + 1000
srtm3 = srtm - 1024
srtm4 = srtm / srtm
srtm5 = srtm * 0


# Reclassifica??o ---------------------------------------------------------
srtm_new = subst(srtm, 1500:2000, NA) # simples

rcl = matrix(c(0, 1500, 1, 1500, 2000, 2, 2000, 9999, 3),
              ncol = 3, byrow = TRUE)
rcl
srtm_recl = classify(srtm, rcl = rcl) # complexo

# Cria??o de um ?ndice NDVI utilizando as opera??es b?sicas
# NDVI = (NIR - RED) / (NIR + RED)
nir = landsat[[4]]
red = landsat[[3]]

# exemplo 1
ndvi = (nir - red) / (nir + red)

# exemplo 2
ndvi_fun = function(nir, red){
  (nir - red) / (nir + red)
}

ndvi2 = ndvi_fun(nir, red)


# Opera??es focais (moving window) ----------------------------------------
srtm_focal_mean = focal(srtm, w = c(3, 3), fun = "mean")
srtm_focal_majority = focal(srtm, w = c(3, 3), fun = "modal")


# Estat?sticas globais sobre a imagem -------------------------------------
media = global(srtm, fun = "mean")
soma = global(srtm, fun = "sum")


# Resampling --------------------------------------------------------------
new_srtm = srtm
res(new_srtm) = 0.001
new_srtm
srtm_resampled = resample(srtm, new_srtm, method = "near")
srtm_resampled


# Reproje??o --------------------------------------------------------------
crs(srtm, describe = TRUE)
srtm_utm = project(srtm, "EPSG:32612", method = "near")
crs(srtm_utm, describe = TRUE)


# Lendo dados vetoriais com o pacote sf -----------------------------------
zion = read_sf("data/zion.gpkg")


# Crop/Mask ---------------------------------------------------------------
srtm_utm_c = crop(srtm_utm, zion)
srtm_utm_m = mask(srtm_utm_c, zion)
srtm_utm_m = mask(crop(srtm_utm, zion), zion) # forma alternativa (mais pr?tica)


# Extra??o de valores da imagem utilizando pontos -------------------------
zion_points = read_sf("data/zion_points.gpkg")
zion_extract = extract(srtm, zion_points)
zion_points = cbind(zion_points, zion_extract)
write_sf(zion_points, "data/zion_points_values.gpkg") # salvar o arquivo modificado


# Salvando o raster -------------------------------------------------------
writeRaster(srtm_utm_m, "data/srtm_utm_m.tif")