$same = 0
$sim = 0
$diff = 0
	
def count_amino(sequence, a)
	if(a=='b' || a=="j" || a == "x" || a == "z")
		return
	end
	count = sequence.count(a)
	len = sequence.length
	percentage = count.to_f/len.to_f
	percentage = (percentage*100).round(2)
	puts "#{a}\t#{count}\t\t#{percentage}%"
end
#	group 	1 	a,v,i,l,m,f,y,w 
#		  	2	s,t,n,q
#			3	c,u,g,p
#			4	r,h,k 
#			5	d,e
def group(var)
	case var
	when 'a','v','i','l','m','f','y','w'
		return 1
	when 's','t','n','q'
		return 2
	when 'c','u','g','p'
		return 3
	when 'r','h','k'
		return 4
	when 'd','e'
		return 5
	else
		return 0
	end
end

def similiar(x,y)
	if(x==y)
		puts "#{x} - #{y}"
		$same += 1
	elsif(group(x) == group(y)) 
		puts "#{x} * #{y}"
		$sim += 1
	else
		puts "#{x}   #{y}"
		$diff += 1
	end

end

def compare_protein(sequence,protein)
	len = protein.length
	(0..len-1).each do |i|
		similiar(sequence[i],protein[i])
	end
end


puts "Enter a protein sequence"
#sequence  = gets.chomp
sequence = "mprlflfhll efclllnqfs ravaakwkdd viklcgrelv raqiaicgms twskrslsqedapqtprpva eivpsfinkd tetiiimlef ianlppelka alserqpslp elqqyvpalkdsnlsfeefk klirnrqsea adsnpselky lgldthsqkk rrpyvalfek ccligctkrs lakyc"
#sequence = "mprlflfhll efclllnqfs ravaakwkdd viklcgrelv raqiaicgms twskrslsqedapqtprpva"

puts sequence
sequence = sequence.gsub(/\s+/, "")
len = sequence.length
puts "length of array is: #{len}"
array = Array.new

puts "Menu"
puts "--------"
puts "(1) Find amino acid value at index"
puts "(2) Count number of particular amino acids"
puts "(3) Print table"
puts "(4) Protein Alignment"

choice = gets.chomp.to_i
case choice 
	when 1
		puts "Enter index value to find amino acid"
		i = gets.chomp.to_i
		puts "Amino acid is: #{sequence[i-1]}"
	when 2
		puts "Enter amino acid to count"
		a = gets.chomp
		count_amino(sequence, a)
	when 3
		puts "Table"
		puts "aa\tCount\t%\n------------------"
		('a'..'z').each do |a|
			count_amino(sequence, a)
		end
	when 4
		puts "Enter second protein"
		protein  = gets.chomp
		protein = protein.gsub(/\s+/, "")
		puts "Protein Alignment\n------------------"
		compare_protein(sequence,protein)
		puts "Same = #{$same}"
		puts "Similiar = #{$sim}"
		puts "Different = #{$diff}"
	else
		puts "Unknown input"
end