puts "Cleaning database..."
Note.delete_all

puts "Creating notes..."
Note.create!(title: "Deploy na AWS", body: "Containerizado com Docker e publicado no ECS Fargate.", published: true)
Note.create!(title: "Rascunho", body: "Ainda escrevendo…", published: false)

puts "Done! Notes: #{Note.count}"
