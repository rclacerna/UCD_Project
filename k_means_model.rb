#################################################################
#                                                               #
#    Ryan Lacerna                                               #
#    Student number: 10276505                                   #
#    Final Year Project: VSMing Newgrange                       #
#    Supervisor/Mentor: Prof. Mark Keane                        #
#                                                               #
#################################################################

require_relative 'vector_space_model'
require_relative 'frequency_model'

require 'rubygems'
require 'kmeans/pair'
require 'kmeans/pearson'
require 'kmeans/cluster'

class K_means
  def self.hash(tf_idf)
    @hash = {}
    tf_idf.each do |col|
      hash2 = {}
      arr = %w{ dots_cupmarks circular spirals arcs radiate_circular semicircular chevrons triangles quadrangular scalariform straight waves} # keys
      (1...col.size).each { |d| hash2[arr[d-1]] = col[d] }        # create a hash of hashes
      @hash[col[0]]  = hash2                                      # add values
    end
    p'-'*100
  p  @hash
  end

  def self.k_means(hash)
    for i in 0..10
      vector = hash
      @result = Kmeans::Cluster.new(vector, {
          :centroids => 4,
          :loop_max => 100
      })
      # The results differ for each run
      @result.make_cluster
      p @result.cluster.values
    end
  end
end




