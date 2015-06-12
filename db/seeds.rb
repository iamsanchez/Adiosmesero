# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	#Product.create(Name: "Prueba Ultima", Description: "Soy una Description", Image: "http://www.schnauzi.com/wp-content/uploads/2014/06/gato-con-botas.jpg", Tax: "0.12", Price: "200.00",Category_id: 6)
	Category.create(Name: "Entrada")
	Category.create(Name: "Plato Principial")
	Category.create(Name: "Bebida")
	Category.create(Name: "Postre")
	Product.create(Name: "Nachos", Description: "Ricos Nachos", Image: "http://everydaylife.globalpost.com/DM-Resize/photos.demandstudios.com/getty/article/41/169/78365099.jpg?w=600&h=600&keep_ratio=1&webp=1", Tax: "0.15", Price: "125.00",Category_id: 1)
	Product.create(Name: "Alitas", Description: "Ricas Alitas", Image: "http://fodmapliving.com/wp-content/uploads/2013/01/buffalo-wings.jpg", Tax: "0.15", Price: "150.00",Category_id: 1)
	Product.create(Name: "Hamburguesa", Description: "Es una muy buena Hamburguesa", Image: "http://burgerking.s3-website-us-east-1.amazonaws.com/sites/default/files/hamburguesa_deluxe.png", Tax: "0.12", Price: "200.00",Category_id: 2)
	Product.create(Name: "Pizza", Description: "Que Pizza mas rica", Image: "http://gezzinyspizza.com/image/cache/data/pizza%20pie-977x395.png", Tax: "0.15", Price: "250.00",Category_id: 2)
	Product.create(Name: "Coca Cola", Description: "Sin Mucho hielo!", Image: "https://yt3.ggpht.com/-3o0qMaMvuwc/AAAAAAAAAAI/AAAAAAAAAAA/CycJ2hpRKvA/s900-c-k-no/photo.jpg", Tax: "0.12", Price: "20.00",Category_id: 3)
	Product.create(Name: "Te Helado", Description: "Muy bueno!", Image: "http://mujer.starmedia.com/imagenes/2013/06/D%C3%ADa-Nacional-del-T%C3%A9-helado.jpg", Tax: "0.12", Price: "20.00",Category_id: 3)
	Product.create(Name: "Flan", Description: "De Coco", Image: "http://www.schnauzi.com/wp-content/uploads/2014/06/gato-con-botas.jpg", Tax: "0.12", Price: "240.00",Category_id: 4)
	Product.create(Name: "Pastel", Description: "Nuestro especial", Image: "http://www.schnauzi.com/wp-content/uploads/2014/06/gato-con-botas.jpg", Tax: "0.12", Price: "120.00",Category_id: 4)
	Table.create(used: false)
	Table.create(used: false)
	Table.create(used: false)
	Table.create(used: false)
	#Client.create(Name: "nombre",ISV: 0.15, Total: 200, bill_id: 1)	
	#@soy = Client.find_by_sql(['SELECT * FROM clients WHERE bill_id = ? AND "Name" = ?',1,"nombre"])