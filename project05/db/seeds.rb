# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sit amet ligula sit amet tortor ornare pretium congue a lorem. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum suscipit turpis ut lectus semper euismod. Nam vel dolor nec ipsum pellentesque faucibus. Nunc nec nunc felis. Aenean vestibulum, purus eget elementum tempor, purus nisl lobortis mauris, vel convallis eros nibh at libero. Integer iaculis, turpis nec iaculis malesuada, justo neque accumsan ante, ut pellentesque diam sapien et metus. Ut volutpat, nisl et tempor sollicitudin, sapien augue posuere urna, sed aliquet nisl tortor ut est.

Etiam nec velit risus. Mauris dictum, eros id ullamcorper scelerisque, magna magna consequat ligula, ut tempus justo tortor quis urna. Vestibulum ornare turpis at mi tempor eleifend. Donec sem risus, rhoncus at iaculis sit amet, rhoncus vitae mi. Donec pulvinar porta felis eu auctor. Phasellus eget augue leo, nec posuere felis. Quisque felis ipsum, consectetur porttitor dapibus eget, dictum malesuada urna.

In lorem lacus, molestie sit amet varius eget, condimentum in nulla. Suspendisse metus lorem, viverra vel scelerisque quis, rhoncus ac quam. Donec at sodales sem. Nullam ut orci justo. Aenean quis mi non turpis vestibulum varius sit amet euismod sapien. Etiam egestas tortor ut dui dictum varius. Ut suscipit odio a nisi cursus iaculis. Nunc id dui at arcu semper fringilla id vitae mauris. Phasellus elit tellus, posuere varius iaculis non, iaculis vitae risus. Nulla iaculis ullamcorper dignissim. Suspendisse consectetur elementum lacus nec viverra. Praesent ullamcorper tellus vel dui feugiat at accumsan lacus facilisis. Donec vel risus velit, a scelerisque nisi.

Integer condimentum, augue condimentum commodo molestie, orci ipsum porta dolor, eget aliquam risus odio vitae ipsum. Nulla ut ipsum quis nisi fermentum dictum. Nulla sed ipsum non magna elementum vehicula sit amet at neque. Sed tempor mauris eu augue sagittis non feugiat nisi laoreet. Suspendisse vel quam ipsum, quis ullamcorper tellus. Proin porttitor mattis aliquet. Aenean consequat ultrices lectus non accumsan.

In feugiat interdum dapibus. Cras pulvinar ipsum vitae ante tincidunt tempus. Morbi congue dignissim dui in fermentum. Morbi congue justo sit amet nibh tempor in tempus nisi adipiscing. Suspendisse ut metus nisi. Nunc vitae purus orci. Suspendisse potenti. Donec tellus mi, molestie eu interdum vel, placerat ac eros. Nulla scelerisque imperdiet velit id porta. Sed nunc magna, convallis vitae elementum id, tincidunt quis dolor. Mauris porttitor, dolor quis sodales scelerisque, lacus augue laoreet sapien, sed condimentum mi est eu leo. Aliquam in justo id odio tincidunt lacinia. Fusce elementum fermentum egestas. Nulla condimentum ullamcorper mauris, vestibulum pretium lorem faucibus at. "

for i in 0...100  do
	Article.create!(:title => "Article#{i}",
									:body => body,
									:num_edits => 22,
									:author_id => 1)
end