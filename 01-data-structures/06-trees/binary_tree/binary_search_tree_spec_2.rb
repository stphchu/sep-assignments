include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:saving_face) { Node.new("Saving Face", 88) }
  let (:black_panther) { Node.new("Black Panther", 96) }
  let (:the_favourite) { Node.new("The Favourite", 93) }
  let (:shame) { Node.new("Shame", 78) }
  let (:your_name) { Node.new("Your Name (Kimi No Na Wa)", 97) }
  let (:moonlight) { Node.new("Moonlight", 98) }
  let (:arrival) { Node.new("Arrival", 94) }
  let (:dr_strange) { Node.new("Doctor Strange", 89) }
  let (:deadpool) { Node.new("Deadpool", 84) }
  let (:braidsmaids) { Node.new("Braidsmaids", 90) }
  let (:twelve_years_slave) { Node.new("12 Years a Slave", 95) }
  let (:mulan) { Node.new("Mulan", 86) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, deadpool)
      expect(root.left.title).to eq "Deadpool"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, deadpool)
      tree.insert(root, shame)
      expect(root.left.left.title).to eq "Shame"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, shame)
      tree.insert(root, mulan)
      expect(root.left.right.title).to eq "Mulan"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, black_panther)
      expect(root.right.title).to eq "Black Panther"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, black_panther)
      tree.insert(root, the_favourite)
      expect(root.right.left.title).to eq "The Favourite"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, arrival)
      tree.insert(root, moonlight)
      expect(root.right.right.title).to eq "Moonlight"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, saving_face)
      tree.insert(root, the_favourite)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, deadpool)
      expect(tree.find(root, deadpool.title).title).to eq "Deadpool"
    end

    it "properly finds a left-left node" do
      tree.insert(root, deadpool)
      tree.insert(root, shame)
      expect(tree.find(root, shame.title).title).to eq "Shame"
    end

    it "properly finds a left-right node" do
      tree.insert(root, mulan)
      tree.insert(root, your_name)
      expect(tree.find(root, your_name.title).title).to eq "Your Name (Kimi No Na Wa)"
    end

    it "properly finds a right node" do
      tree.insert(root, saving_face)
      expect(tree.find(root, saving_face.title).title).to eq "Saving Face"
    end

    it "properly finds a right-left node" do
      tree.insert(root, black_panther)
      tree.insert(root, deadpool)
      expect(tree.find(root, deadpool.title).title).to eq "Deadpool"
    end

    it "properly finds a right-right node" do
      tree.insert(root, dr_strange)
      tree.insert(root, moonlight)
      expect(tree.find(root, moonlight.title).title).to eq "Moonlight"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, deadpool)
      tree.delete(root, deadpool.title)
      expect(tree.find(root, deadpool.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(root, mulan)
      tree.insert(root, deadpool)
      tree.delete(root, deadpool.title)
      expect(tree.find(root, deadpool.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, shame)
      tree.insert(root, deadpool)
      tree.delete(root, deadpool.title)
      expect(tree.find(root, deadpool.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, twelve_years_slave)
      tree.delete(root, twelve_years_slave.title)
      expect(tree.find(root, twelve_years_slave.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, twelve_years_slave)
      tree.insert(root, braidsmaids)
      tree.delete(root, braidsmaids.title)
      expect(tree.find(root, braidsmaids.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, the_favourite)
      tree.insert(root, moonlight)
      tree.delete(root, moonlight.title)
      expect(tree.find(root, moonlight.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "The Matrix: 87\nShame: 78\nSaving Face: 88\nMulan: 86\nBraidsmaids: 90\nDeadpool: 84\n"
       tree.insert(root, shame)
       tree.insert(root, saving_face)
       tree.insert(root, mulan)
       tree.insert(root, deadpool)
       tree.insert(root, braidsmaids)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

  end
end
