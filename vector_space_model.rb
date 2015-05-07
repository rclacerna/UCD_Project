#################################################################
#                                                               #
#    Ryan Lacerna                                               #
#    Student number: 10276505                                   #
#    Final Year Project: VSMing Newgrange                       #
#    Supervisor/Mentor: Prof. Mark Keane                        #
#                                                               #
#################################################################

require_relative 'frequency_model'
#require_relative 'test'

class VSM

  def self.get(term_frequencies)
    @term_frequencies = term_frequencies
  end

  def self.sum_document_freq
    @doc_freq = Array.new(13,0)
    @term_frequencies.each do |col|
      for i in 0..col.count-1
        if col[i] != nil
          @doc_freq[i] += 1
        end
      end
    end
   p @doc_freq
  end

  def self.inverse_document_frequency
    output = []
    @doc_freq.each do |col|
      p df = col#.to_f
      score = Math.log10(N/df)     # formula
      output << score.round(3)
    end
    output
  end

  def self.term_frequency
    output = []
    @term_frequencies.each do |col|
      array = []
      array << col[0]
      for i in 1..col.count-1
        tf = col[i] + 1
        score = tf
        array << score
        #array << (score/N).round(3)
      end
      output << array
    end
    output
  end

  def self.tf_idf(tf, idf)
    output = []
    tf.each do |col|
      array = []
      k_means_array = []
      array << col[0]             # adds name of place at start of array
      for i in 1..col.count-1
        i_d_f = idf[i-1]#.to_f     # iterate through IDF
        tf = col[i]#.to_f          # Iterate through TF
        score = i_d_f * tf        # TF * IDF
        array << score.round(2)   # to -> Pair wise similarity
      end
      output << array
    end
    output
  end


  # *100 because the k-means gem recognises all the values in the vector that are less than 1.0 to all be in the same group
  def self.tf_idf_to_kmeans(tf, idf)
    output = []
    tf.each do |col|
      array = []
      k_means_array = []
      array << col[0]             # adds name of place at start of array
      for i in 1..col.count-1
        i_d_f = idf[i-1]#.to_f     # iterate through IDF
        tf = col[i]#.to_f          # Iterate through TF
        score = i_d_f * tf        # TF * IDF
       array << (100*score).round
      end
      output << array
    end
    output
  end

  #this method sums up all the TF_IDF values in given document, thus giving us the size of the bubble for visualization in d3.js
  def self.doc_length(tf_idf)
    output = []
    tf_idf.each do |row|
      add= []
      add << row[0]
      array = []
      for i in 1..row.count-1
        array << row[i]
      end
      add << (array.inject {|sum, n| sum + n})*100
      output<<add
    end
    output.each do |row|
      p row
    end
  end

  def self.pair_wise_similarity(tf_idf)
    output = []
    tf_idf.combination(2) do |first, second| # e.g => [1,2,3,4,5] => [1,2][1,3][1,4][1,5], [2,3][2,4][2,5], [3,4][3,5], [4,5]
      pairs = []
      multiplied = []
      pairs << first[0]                      # add pair names at start of array
      pairs << second[0]                     # add pair names at start of array
      for i in 1..first.count-1
        multiplied << first[i] * second[i]   # multiply each pair values together
      end
      pairs << (multiplied.inject {|sum, n| sum + n}).round(2) # sums all the multiplied pair values
      output << pairs                                                 # output all pair values
    end
    output
  end
end

