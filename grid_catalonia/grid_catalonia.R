
# Libraries we need
library(tidyverse)
library(ggplot2)
library(reshape2)
library(showtext)

# For creating a custom grid, visit this site: https://digital.ebp.ch/2021/03/02/tilemaps-in-r/
library(geofacet) # Package for creating custom grids

# This line opens a new window for creating the grid
grid_design()

# Loading fonts
font_add_google("DM Serif Display", "abril")
font_add_google("Tajawal", "tawa")
showtext_auto()

# Creating the custom grid ()
comarques <- data.frame(
  code = c("AN", "CE", "AR", "PS", "RI", "AE", "PE", "GA", "BE", "AU", "PJ", "SO", "GI", "BE", "OS", "NO", "BA", "SE", "MO", "SE", "VO", "AN", "SA", "PU", "UR", "VR", "MA", "AC", "CB", "GG", "PR", "AP", "BA", "GA", "RE", "BP", "TA", "BL", "BE", "BC", "TA", "MO"),
  name = c("Aran", "Cerdanya", "Alta Ribagorça", "Pallars Sobirà", "Ripollès", "Alt Empordà", "Pla de l'Estany", "Garrotxa", "Berguedà", "Alt Urgell", "Pallars Jussà", "Solsonès", "Gironès", "Baix Empordà", "Osona", "Noguera", "Bages", "Segarra", "Moianès", "Selva", "Vallès Occidental", "Anoia", "Segrià", "Pla d'Urgell", "Urgell", "Vallès Oriental", "Maresme", "Alt Camp", "Conca de Barberà", "Garrigues", "Priorat", "Alt Penedès", "Barcelonès", "Garraf", "Ribera d'Ebre", "Baix Penedès", "Terra Alta", "Baix Llobregat", "Baix Ebre", "Baix Camp", "Tarragonès", "Montsià"),
  row = c(1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 9),
  col = c(3, 6, 3, 4, 7, 9, 8, 7, 6, 4, 3, 5, 9, 10, 7, 3, 5, 4, 6, 8, 6, 5, 2, 3, 4, 7, 8, 5, 4, 3, 2, 6, 6, 4, 2, 3, 1, 5, 2, 3, 4, 2),
  stringsAsFactors = FALSE
)


datos <- read.csv("setmanes_desembre.csv", encoding = "UTF-8")

# Factors reordering
datos$setmana <- factor(datos$setmana, levels = c("16-22", "23-29","30-06","07-13", "14-20"))
unique(datos$setmana)


# Plotting
cat <- ggplot(datos, aes(x = setmana, y = positius_x, group = name, fill = tendencia)) +
  geom_area() +
  scale_fill_manual(values = c("#FF5A31", "#FACB66", "grey")) +
  facet_geo(~name, grid = comarques, label = "name") +
  theme_minimal() +
  labs(x = "setmana", y="positius x 100.000 habitants",
       title="Positius de COVID-19 x cada 100.000 habitants",
       subtitle="Evolució de les últimes 5 setmanes (del 16 de novembre al 20 de desembre)",
       caption="Laura Navarro Soler | Font: Portal de Dades Obertes de la Generalitat de Catalunya.\n S'han comptabilitzat positius per prova PCR, test ràpid i ELISA \n La llegenda de colors es refereix a l'augmente o disminució de la setmana passada (14-20 desembre) respecte l'anterior (7-13 desembre)") +
  theme(panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "black"),
        panel.background = element_rect(fill = "black"),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        plot.title = element_text(color = "#818181", size = 26, family = "abril"),
        plot.subtitle = element_text(color = "#818181", size = 18,family = "tawa"),
        plot.caption = element_text(color = "#818181", size = 10),
        strip.text.x = element_text(color = "#818181", size = 12, face = "bold",family = "tawa"),
        legend.position = c(0.8, 0.2),
        axis.text.x = element_text(size = 8, face = "bold", angle = 60,family = "tawa"),
        axis.text.y = element_text(size = 8, face = "bold"),
        legend.text = element_text(color = "#818181", size = 14,family = "tawa"),
        legend.key.size = unit(0.5,"cm"),
        legend.spacing.y = unit(.5, "char"))
cat
ggsave(cat,
       filename = "comarques3.png",
       scale = 1, 
       width = 14.3, 
       height = 13, 
       units = "in",
       dpi = 300)
