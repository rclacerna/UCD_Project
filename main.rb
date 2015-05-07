#################################################################
#                                                               #
#    Ryan Lacerna                                               #
#    Student number: 10276505                                   #
#    Final Year Project: VSMing Newgrange                       #
#    Supervisor/Mentor: Prof. Mark Keane                        #
#                                                               #
#################################################################
require_relative 'frequency_model'
require_relative 'vector_space_model'
# require_relative 'K_means_model'

term_frequencies = Frequency.tomb  #--->   # TODO: choose:: "site", "tomb" or "country" to see results

VSM.get(term_frequencies)
N = term_frequencies.length
VSM.sum_document_freq
idf = VSM.inverse_document_frequency
tf  = VSM.term_frequency
tf_idf = VSM.tf_idf(tf, idf)
#VSM.doc_length(tf_idf)

 #_________________________OUTPUTS_____________________________________
p '-'*100
p 'TF:'
tf.each do |row|
  p row
end

p '-'*100

p "IDF      #{idf}"
 #p "TF:         #{tf}"
p '-'*100
 ##______________________TF * IDF output________________________________
p "TF*IDF:"
tf_idf.each do |col|
  p col
end
 #_____________________Pair Wise output________________________________
p'-'*100
p 'Pair wise similarity::'
pairs = VSM.pair_wise_similarity(tf_idf)
pairs.each do |col|
  p col
end
 #_________________________K means_____________________________________
# tf_idf_kmeans = VSM.tf_idf_to_kmeans(tf, idf)
# myhash = K_means.hash(tf_idf_kmeans)
# p '-'*100
# p 'K means Results'
# K_means.k_means(myhash)
