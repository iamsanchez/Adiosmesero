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
	Product.create(Name: "Ensalada", Description: "Ensalada al estilo césar", Image: "http://www.simplyrecipes.com/photos/caesar-salad-lower.jpg,",Tax: "0.15", Price: "125.00",Category_id: 1)
	Product.create(Name: "Palitos de Queso", Description: "Pan relleno de delicioso Queso",Image: "http://everycollegegirl.com/wp-content/uploads/2012/03/mozz-sticks.jpg",Tax: "0.15", Price: "111.00",Category_id: 1 )
	Product.create(Name: "Anafre de Frijoles", Description: "Rico Anafre de Frijoles con tortillas fritas", Image: "https://s-media-cache-ak0.pinimg.com/736x/42/98/73/429873fb5271d0f6b620021b78c4aa41.jpg",Tax: "15.00",Price: "123.00",Category_id: 1)
	Product.create(Name: "Ceviche", Description: "Ceviche Fresco", Image: "http://www.simplyrecipes.com/photos/ceviche-b.jpg",Tax: "15.00",Price: "200.00",Category_id: 1)

	#Platos
	Product.create(Name: "Hamburguesa", Description: "Es una muy buena Hamburguesa", Image: "http://burgerking.s3-website-us-east-1.amazonaws.com/sites/default/files/hamburguesa_deluxe.png", Tax: "0.12", Price: "200.00",Category_id: 2)
	Product.create(Name: "Pizza", Description: "Que Pizza mas rica", Image: "http://gezzinyspizza.com/image/cache/data/pizza%20pie-977x395.png", Tax: "0.15", Price: "250.00",Category_id: 2)



	Product.create(Name: "Coca Cola", Description: "Sin Mucho hielo!", Image: "https://yt3.ggpht.com/-3o0qMaMvuwc/AAAAAAAAAAI/AAAAAAAAAAA/CycJ2hpRKvA/s900-c-k-no/photo.jpg", Tax: "0.12", Price: "20.00",Category_id: 3)
	Product.create(Name: "Te Helado", Description: "Muy bueno!", Image: "http://mujer.starmedia.com/imagenes/2013/06/D%C3%ADa-Nacional-del-T%C3%A9-helado.jpg", Tax: "0.12", Price: "20.00",Category_id: 3)
	Product.create(Name: "Flan", Description: "De Coco", Image: "http://www.theinternationalkitchen.com/tik_content/images/recipes/flan2.jpg", Tax: "0.12", Price: "240.00",Category_id: 4)
	Product.create(Name: "Pastel", Description: "Nuestro especial", Image: "http://www.pastelchocolate.com/wp-content/uploads/2015/02/pastel-de-chocolate.jpg", Tax: "0.12", Price: "120.00",Category_id: 4)
	5.times do |a|
		Table.create(used: false)
	end
	#Client.create(Name: "nombre",ISV: 0.15, Total: 200, bill_id: 1)	
	#@soy = Client.find_by_sql(['SELECT * FROM clients WHERE bill_id = ? AND "Name" = ?',1,"nombre"])