
comarques_catalunya <- data.frame(
  code = c("AN", "CE", "AR", "PS", "RI", "AE", "PE", "GA", "BE", "AU", "PJ", "SO", "GI", "BE", "OS", "NO", "BA", "SE", "MO", "SE", "VO", "AN", "SA", "PU", "UR", "VR", "MA", "AC", "CB", "GG", "PR", "AP", "BA", "GA", "RE", "BP", "TA", "BL", "BE", "BC", "TA", "MO"),
  name = c("Aran", "Cerdanya", "Alta Ribagorça", "Pallars Sobirà", "Ripollès", "Alt Empordà", "Pla de l'Estany", "Garrotxa", "Berguedà", "Alt Urgell", "Pallars Jussà", "Solsonès", "Gironès", "Baix Empordà", "Osona", "Noguera", "Bages", "Segarra", "Moianès", "Selva", "Vallès Occidental", "Anoia", "Segrià", "Pla d'Urgell", "Urgell", "Vallès Oriental", "Maresme", "Alt Camp", "Conca de Barberà", "Garrigues", "Priorat", "Alt Penedès", "Barcelonès", "Garraf", "Ribera d'Ebre", "Baix Penedès", "Terra Alta", "Baix Llobregat", "Baix Ebre", "Baix Camp", "Tarragonès", "Montsià"),
  row = c(1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 9),
  col = c(3, 6, 3, 4, 7, 9, 8, 7, 6, 4, 3, 5, 9, 10, 7, 3, 5, 4, 6, 8, 6, 5, 2, 3, 4, 7, 8, 5, 4, 3, 2, 6, 6, 4, 2, 3, 1, 5, 2, 3, 4, 2),
  stringsAsFactors = FALSE
)
geofacet::grid_preview(comarques_catalunya)
