# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
#...
Product.create!(title: "Nintendo Switch Super Smash Bros. Ultimate Edition Bundle",
    description:
    %{<p>
      <em>Gaming icons clash in the ultimate brawl!</em>
      Gaming icons clash in the ultimate brawl you can play anytime, anywhere! 
      Smash rivals off the stage as new characters Isabelle, Simon Belmont and King K. Rool 
      join Inkling, Ridley, and every fighter in Super Smash Bros. history. Enjoy enhanced speed 
      and combat at new stages based on the Castlevania series, Super Mario Odyssey, and more!
      Having trouble choosing a stage? Then select the Stage Morph option to transform one stage 
      into another while battling—a series first! Plus, new echo fighters Dark Samus, Richter Belmont, 
      and Chrom join the battle. Whether you play locally or online, savor the faster combat, new attacks, 
      and new defensive options, like a perfect shield. Jam out to 900 different music compositions and 
      go 1-on-1 with a friend, hold a 4-player free-for-all, kick it up to 8-player battles and more! 
      Feel free to bust out your GameCube controllers—legendary couch competitions await—or play together 
      anytime, anywhere!</p>},
    image_url: 'ssbundle.png',
    price: 359.99)
#...
Product.create!(title: "Limited Edition Spider-Man PS4 Pro Bundle",
    description:
    %{<p>
        <em>See Spider-Man in Full Swing!</em>
        Experience a brand-new and authentic Spider-Man adventure 
        with a fully customized Amazing Red PS4 Pro console 
        featuring the Spider icon, DUALSHOCK®4 wireless controller, 
        Marvel’s Spider-Man game, and digital content.
        This isn’t the Spider-Man you’ve met or ever seen before. 
        This is an experienced Peter Parker who’s more masterful at fighting 
        big crime in New York City. At the same time, he’s struggling to balance his 
        chaotic personal life and career while the fate of millions of New Yorkers rest 
        upon his shoulders.
        </p>},
    image_url: 'spiderbundle.jpg',
    price: 9.95)
#...