
puts "Cate persoane voteaza?"
counter = gets.chomp.to_i
puts "Cum se numesc persoanele care candideaza?"
candideaza = gets.chomp

candideaza_array = candideaza.split
#imputul luat este pun intr un array
clasament = Hash.new
#se creaza un hash gol
candideaza_array.map do |x|
	clasament[x] = []
end
#itereaza prin array si pune in hashul nostru ca si key elemenetele arrayului si ca value un array gol
flag = true
while flag
	puts "Ce vrei sa faci?(VOT/EXIT/CLASAMENT)"
	choose = gets.chomp.downcase
	if counter <= clasament.values.flatten.length
		#counter = nr. votanti si restul e cate lume a votat
		puts "Toata lumea a votat"
		puts "Clasamentul este:"
		clasament.each do |key,value|
			puts "#{key.capitalize} are #{value.length} voturi"
		end
		flag = false
	elsif choose == "vot" && counter > clasament.values.flatten.length
			puts "Cum te numesti?"
			nume_votant = gets.chomp
			if clasament.values.flatten.include?(nume_votant)
				puts "Sa ti fie rusine! ai mai votat :("
			else
				puts "Candidatii sunt: #{candideaza.upcase}."
				puts "Pe cine vrei sa votezi?"
				alegere = gets.chomp
				if clasament.keys.include?(alegere) 
					clasament[alegere] << nume_votant
				else
					puts "Ai scris numele gresit, mai incearca :)"
				end
		 end
	elsif choose == "clasament"
		puts "Pana acum au votat #{clasament.values.flatten.length}/#{counter} persone."
		clasament.each do |key,value|
			puts "Candidatul #{key.capitalize} a fost votat de catre #{value.length} persoane"
			# puts "Candidatul #{key.capitalize} are #{value.length} voturi"
		end
	elsif choose == "exit"
		flag = false
	else
		puts "Ai scris gresit ce doresti.Try again"
	end
end
