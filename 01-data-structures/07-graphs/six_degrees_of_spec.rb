include RSpec

require_relative 'six_degrees_of'

RSpec.describe SixDegreesOf, type: Class do
  let (:kevin_bacon) {Node.new("Kevin Bacon") }
  let (:alec_baldwin) {Node.new("Alec Baldwin")}
  let (:alicia_vikander) {Node.new("Alicia Vikander")}
  let (:andrew_garfield) {Node.new("Andrew Garfield")}
  let (:anne_hathaway) {Node.new("Anne Hawthaway")}
  let (:bill_skarsgard) {Node.new("Bill Skarsgård")}
  let (:carey_mulligan) {Node.new("Carey Mulligan")}
  let (:cate_blanchett) {Node.new("Cate Blanchett")}
  let (:charlotte_rampling) {Node.new("Charlotte Rampling")}
  let (:charlize_theron) {Node.new("Charlize Theron")}
  let (:chris_hemsworth) {Node.new("Chris Hemsworth")}
  let (:domhnall_gleeson) {Node.new("Domhnall Gleeson")}
  let (:eddie_redmayne) {Node.new("Eddie Redmayne")}
  let (:emma_stone) {Node.new("Emma Stone")}
  let (:james_badge_dale) {Node.new("James Badge Dale")}
  let (:james_mcavoy) {Node.new("James McAvoy")}
  let (:janelle_monae) {Node.new("Janelle Monáe")}
  let (:jennifer_lawrence) {Node.new("Jennifer Lawrence")}
  let (:jessica_chastain) {Node.new("Jessica Chastain")}
  let (:john_goodman) {Node.new("John Goodman")}
  let (:john_lithgow) {Node.new("John Lithgow")}
  let (:julianne_moore) {Node.new("Julian Moore")}
  let (:keira_knightley) {Node.new("Keira Knightley")}
  let (:kristen_stewart) {Node.new("Kristen Stewart")}
  let (:lori_singer) {Node.new("Lori Singer") }
  let (:mahershala_ali) {Node.new("Mahershala Ali")}
  let (:matthew_mcconaughey) {Node.new("Matthew McConaughey")}
  let (:matthias_schoenaerts) {Node.new("Matthias Schoenaerts")}
  let (:michael_stuhlbarg) {Node.new("Michael Stuhlbarg")}
  let (:michael_fassbender) {Node.new("Michael Fassbender")}
  let (:naomie_harris) {Node.new("Naomie Harris")}
  let(:nicholas_hoult) {Node.new("Nicholas Hoult")}
  let (:octavia_spencer) {Node.new("Octavia Spencer")}
  let (:oscar_isaac) {Node.new("Oscar Isaac")}
  let (:russell_crowe) {Node.new("Russell Crowe")}
  let (:sally_hawkins) {Node.new("Sally Hawkins")}
  let (:zoe_kravitz) {Node.new("Zoë Kravitz")}

  before do
    kevin_bacon.film_actor_hash["FootLoose"] = [lori_singer, john_lithgow, john_goodman]
    kevin_bacon.film_actor_hash["X-Men: First Class"] = [james_mcavoy, michael_fassbender, jennifer_lawrence, nicholas_hoult, zoe_kravitz]

    alec_baldwin.film_actor_hash["Still Alice"] = [julianne_moore, kristen_stewart]
    alec_baldwin.film_actor_hash["Blue Jasmine"] = [michael_stuhlbarg, sally_hawkins, cate_blanchett]

    alicia_vikander.film_actor_hash["Ex Machina"] = [domhnall_gleeson, oscar_isaac]
    alicia_vikander.film_actor_hash["The Danish Girl"] = [eddie_redmayne, matthias_schoenaerts]
    alicia_vikander.film_actor_hash["Anna Karenina"] = [keira_knightley, domhnall_gleeson, bill_skarsgard]

    andrew_garfield.film_actor_hash["Never Let Me Go"] = [carey_mulligan, sally_hawkins, keira_knightley, charlotte_rampling, domhnall_gleeson]
    andrew_garfield.film_actor_hash["The Amazing Spider-man"] = [emma_stone]

    anne_hathaway.film_actor_hash["Interstellar"] = [matthew_mcconaughey, john_lithgow, michael_stuhlbarg]
    anne_hathaway.film_actor_hash["Les Misérables"] = [russell_crowe, eddie_redmayne]

    bill_skarsgard.film_actor_hash["Atomic Blonde"] = [charlize_theron, james_mcavoy, john_goodman]
    bill_skarsgard.film_actor_hash["It Chapter 2"] = [jessica_chastain, james_mcavoy]
    bill_skarsgard.film_actor_hash["Anna Karenina"] = [keira_knightley, domhnall_gleeson, alicia_vikander]

    carey_mulligan.film_actor_hash["Shame"] = [michael_fassbender, james_badge_dale]
    carey_mulligan.film_actor_hash["Never Let Me Go"] = [andrew_garfield, sally_hawkins, keira_knightley, charlotte_rampling, domhnall_gleeson]

    cate_blanchett.film_actor_hash["Robinhood"] = [russell_crowe, oscar_isaac]
    cate_blanchett.film_actor_hash["Blue Jasmine"] = [michael_stuhlbarg, sally_hawkins, alec_baldwin]

    charlotte_rampling.film_actor_hash["Never Let Me Go"] = [carey_mulligan, andrew_garfield, sally_hawkins, keira_knightley, domhnall_gleeson]
    charlotte_rampling.film_actor_hash["Red Sparrow"] = [jennifer_lawrence, matthias_schoenaerts]

    charlize_theron.film_actor_hash["The Huntsman: Winter's War"] = [chris_hemsworth, jessica_chastain]
    charlize_theron.film_actor_hash["Snow White and the Huntsman"] = [kristen_stewart, chris_hemsworth]
    charlize_theron.film_actor_hash["Mad Max: Fury Road"] = [nicholas_hoult, zoe_kravitz]
    charlize_theron.film_actor_hash["Atomic Blonde"] = [james_mcavoy, john_goodman, bill_skarsgard]

    chris_hemsworth.film_actor_hash["Snow White and the Huntsman"] = [charlize_theron, kristen_stewart]
    chris_hemsworth.film_actor_hash["The Huntsman: Winter's War"] = [charlize_theron, jessica_chastain]

    domhnall_gleeson.film_actor_hash["Never Let Me Go"] = [carey_mulligan, andrew_garfield, sally_hawkins, keira_knightley, charlotte_rampling]
    domhnall_gleeson.film_actor_hash["Ex Machina"] = [alicia_vikander, oscar_isaac]
    domhnall_gleeson.film_actor_hash["Anna Karenina"] = [keira_knightley, alicia_vikander, bill_skarsgard]

    eddie_redmayne.film_actor_hash["The Danish Girl"] = [alicia_vikander, matthias_schoenaerts]
    eddie_redmayne.film_actor_hash["Les Misérables"] = [anne_hathaway, russell_crowe]

    emma_stone.film_actor_hash["The Amazing Spider-man"] = [andrew_garfield]
    emma_stone.film_actor_hash["The Help"] = [octavia_spencer, jessica_chastain]

    james_badge_dale.film_actor_hash["Shame"] = [michael_fassbender, carey_mulligan]

    james_mcavoy.film_actor_hash["X-Men: First Class"] = [kevin_bacon, michael_fassbender, jennifer_lawrence, nicholas_hoult, zoe_kravitz]
    james_mcavoy.film_actor_hash["It Chapter 2"] = [jessica_chastain, bill_skarsgard]
    james_mcavoy.film_actor_hash["Atomic Blonde"] = [charlize_theron, john_goodman, bill_skarsgard]

    janelle_monae.film_actor_hash["Moonlight"] = [mahershala_ali, naomie_harris]
    janelle_monae.film_actor_hash["Hidden Figures"] = [octavia_spencer, mahershala_ali]

    jennifer_lawrence.film_actor_hash["X-Men: First Class"] = [kevin_bacon, james_mcavoy, michael_fassbender, nicholas_hoult, zoe_kravitz]
    jennifer_lawrence.film_actor_hash["Red Sparrow"] = [charlotte_rampling, matthias_schoenaerts]
    jennifer_lawrence.film_actor_hash["The Hunger Games: Mockingjay - Part 1"] = [julianne_moore, mahershala_ali]

    jessica_chastain.film_actor_hash["The Help"] = [octavia_spencer, emma_stone]
    jessica_chastain.film_actor_hash["It Chapter 2"] = [james_mcavoy, bill_skarsgard]
    jessica_chastain.film_actor_hash["The Huntsman: Winter's War"] = [chris_hemsworth, charlize_theron]

    john_goodman.film_actor_hash["FootLoose"] = [kevin_bacon, lori_singer, john_lithgow]
    john_goodman.film_actor_hash["Atomic Blonde"] = [charlize_theron, james_mcavoy, bill_skarsgard]

    john_lithgow.film_actor_hash["FootLoose"] = [kevin_bacon, lori_singer, john_goodman]
    john_lithgow.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, michael_stuhlbarg]

    julianne_moore.film_actor_hash["Still Alice"] = [alec_baldwin, kristen_stewart]
    julianne_moore.film_actor_hash["The Hunger Games: Mockingjay - Part 1"] = [jennifer_lawrence, mahershala_ali]

    keira_knightley.film_actor_hash["Never Let Me Go"] = [carey_mulligan, andrew_garfield, sally_hawkins, charlotte_rampling, domhnall_gleeson]
    keira_knightley.film_actor_hash["Anna Karenina"] = [domhnall_gleeson, alicia_vikander, bill_skarsgard]

    kristen_stewart.film_actor_hash["Still Alice"] = [julianne_moore, alec_baldwin]
    kristen_stewart.film_actor_hash["Snow White and the Huntsman"] = [charlize_theron, chris_hemsworth]

    lori_singer.film_actor_hash["FootLoose"] = [kevin_bacon, john_lithgow, john_goodman]

    mahershala_ali.film_actor_hash["Moonlight"] = [janelle_monae, naomie_harris]
    mahershala_ali.film_actor_hash["The Hunger Games: Mockingjay - Part 1"] = [jennifer_lawrence, julianne_moore]
    mahershala_ali.film_actor_hash["Hidden Figures"] = [octavia_spencer, janelle_monae]

    matthew_mcconaughey.film_actor_hash["Interstellar"] = [john_lithgow, anne_hathaway, michael_stuhlbarg]

    matthias_schoenaerts.film_actor_hash["Red Sparrow"] = [jennifer_lawrence, charlotte_rampling]
    matthias_schoenaerts.film_actor_hash["The Danish Girl"] = [alicia_vikander, eddie_redmayne]

    michael_stuhlbarg.film_actor_hash["The Shape of Water"] = [sally_hawkins, octavia_spencer]
    michael_stuhlbarg.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, john_lithgow]
    michael_stuhlbarg.film_actor_hash["Blue Jasmine"] = [sally_hawkins, cate_blanchett, alec_baldwin]

    michael_fassbender.film_actor_hash["X-Men: First Class"] = [kevin_bacon, james_mcavoy, jennifer_lawrence, nicholas_hoult, zoe_kravitz]
    michael_fassbender.film_actor_hash["Shame"] = [carey_mulligan, james_badge_dale]

    naomie_harris.film_actor_hash["Moonlight"] = [mahershala_ali, janelle_monae]

    nicholas_hoult.film_actor_hash["X-Men: First Class"] = [kevin_bacon, james_mcavoy, michael_fassbender, jennifer_lawrence, zoe_kravitz]
    nicholas_hoult.film_actor_hash["Mad Max: Fury Road"] = [charlize_theron, zoe_kravitz]

    octavia_spencer.film_actor_hash["The Help"] = [emma_stone, jessica_chastain]
    octavia_spencer.film_actor_hash["The Shape of Water"] = [sally_hawkins, michael_stuhlbarg]
    octavia_spencer.film_actor_hash["Hidden Figures"] = [janelle_monae, mahershala_ali]

    oscar_isaac.film_actor_hash["Ex Machina"] = [domhnall_gleeson, alicia_vikander]
    oscar_isaac.film_actor_hash["Robinhood"] = [cate_blanchett, russell_crowe]

    russell_crowe.film_actor_hash["Les Misérables"] = [eddie_redmayne, anne_hathaway]
    russell_crowe.film_actor_hash["Robinhood"] = [cate_blanchett, oscar_isaac]

    sally_hawkins.film_actor_hash["Never Let Me Go"] = [carey_mulligan, andrew_garfield, keira_knightley, charlotte_rampling, domhnall_gleeson]
    sally_hawkins.film_actor_hash["The Shape of Water"] = [octavia_spencer, michael_stuhlbarg]
    sally_hawkins.film_actor_hash["Blue Jasmine"] = [cate_blanchett, alec_baldwin, michael_stuhlbarg]

    zoe_kravitz.film_actor_hash["X-Men: First Class"] = [kevin_bacon, michael_fassbender, jennifer_lawrence, james_mcavoy, nicholas_hoult]
    zoe_kravitz.film_actor_hash["Mad Max: Fury Road"] = [charlize_theron, nicholas_hoult]
  end

    describe "Nodes are created correctly" do
      it "returns the name of the node" do
        expect(kevin_bacon.name).to eq("Kevin Bacon")
      end

      it "returns an actor from the node's film list" do
        expect(kevin_bacon.film_actor_hash["X-Men: First Class"][0].name).to eq("James McAvoy")
      end
    end

    describe "testing Kevin Bacon as starting node" do
      it "returns a message that Kevin Bacon is 0 degrees from himself" do
        six_degrees_of = SixDegreesOf.new
        expect(six_degrees_of.find_kevin_bacon(kevin_bacon)).to eq("Kevin Bacon is 0 degrees from himself.")
      end
    end

    describe "testing various actors as starting node" do
      it "returns correct array of movie for one degree" do
        six_degrees_of = SixDegreesOf.new
        expect(six_degrees_of.find_kevin_bacon(john_goodman)).to eq(["FootLoose"])
      end
      it "returns correct array of movies for two degrees" do
        six_degrees_of = SixDegreesOf.new
        expect(six_degrees_of.find_kevin_bacon(carey_mulligan)).to eq(["Shame", "X-men: First Class"])
      end
      it "returns correct array of movies for two degrees" do
        six_degrees_of = SixDegreesOf.new
        expect(six_degrees_of.find_kevin_bacon(kristen_stewart)).to eq(["Atomic Blonde", "FootLoose"])
      end
    end

  end
