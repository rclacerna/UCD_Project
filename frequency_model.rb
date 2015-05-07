#################################################################
#                                                               #
#    Ryan Lacerna                                               #
#    Student number: 10276505                                   #
#    Final Year Project: VSMing Newgrange                       #
#    Supervisor/Mentor: Prof. Mark Keane                        #
#                                                               #
#################################################################

require 'csv'

class Frequency
  def self.read_file
    @csv_data = CSV.read('data.csv')
  end

  def self.country
    array_of_countries= ['Ireland','Scotland','Wales','England']
    country_frequency = []
    array_of_countries.each { country_frequency << Array.new(13,0)}

    @csv_data.each do |row|
      for i in 0..array_of_countries.count-1
        if row[2] == array_of_countries[i]
          for k in 3..14
            if row[k] == '1' || row[k] == '?'
              country_frequency[i][0] = array_of_countries[i]
              country_frequency[i][k-2] += 1
            end
          end
        end
      end
    end
    country_frequency
  end

  def self.site
    array_of_sites = ['Meath','Cavan','Antrim','Kildare','Cork','Anglesey','Argyll','Cumbria','Donegal','Down','Dublin',
                      'Fermanagh','Kilkenny','Liverpool','Louth','Meirionydd','Orcades','Sligo','Tyrone','Wicklow']
    site_frequency = []
    array_of_sites.each { site_frequency << Array.new(13,0)}

    @csv_data.each do |row|
      for i in 0..array_of_sites.count-1                # This for loop is to go through each tomb (name of tombs)
        if row[0] == array_of_sites[i]                  # compares the tombs from file with array of tombs
          for k in 3..14                                # for index row of signs (12 signs)
            if row[k] != nil# == '1' || row[k] == '?'
              site_frequency[i][0] = array_of_sites[i]  # adds the name of the tombs at the start of each array
              site_frequency[i][k-2] += 1               # add the frequencies on each column in the array
            end
          end
        end
      end
    end
    site_frequency
  end

  def self.tomb
    array_of_tombs = ['Ardmulchan','Ballinvally 4','Baltinglass','Baltinglass I','Baltinglass II','Banagher',
                      'Carnanmore','Castledermot','Clear Island','Clonasillagh', 'Cloverhill', 'Cregg', 'Dowth','Dowth N',
                      'Dowth S','Drumreagh', 'Dun Laoghaire', 'Fourknocks I', 'Hempstown', 'Killin', 'Kiltiernay',
                      'Kings Mountain','Knockmany', 'Knockroe enceinte','Knockroe E','Knockroe W', 'Knowth','Knowth E',
                      'Knowth W','Knowth 2','Knowth 3','Knowth 4','Knowth 5', 'Knowth 8','Knowth 12', 'Knowth 13','Knowth 14',
                      'Knowth 15','Knowth 16','Knowth 17','Knowth 18', 'Listoghil','Loughcrew F', 'Loughcrew H','Loughcrew I',
                      'Loughcrew J','Loughcrew K','Loughcrew L', 'Loughcrew O','Loughcrew R2','Loughcrew S',
                      'Loughcrew T','Loughcrew U','Loughcrew V','Loughcrew W', 'Loughcrew X1', 'Lyles Hill','Malin More',
                      'Millin Bay', 'Mountainstown','Moylough','Mullagharoy','Newgrange','Newgrange K','Newgrange L',
                      'Newgrange Z', 'Rathkenny', 'Seefin', 'Sess Kilgreen', 'Tara','Tibradden','Tournant','Barclodiad y Gawres',
                      'Bryn Celli Ddu','Llanbedr', 'Calderstones','Castlerigg','Glassonby','Temple Wood','Cuween Hill','Eday Manse',
                      'Frith','Holm of Papa Westray','Maeshowe','Pierowall','Quoyness', 'Wideford Hill']
    tomb_frequency = []    # output array for tombs
    array_of_tombs.each { tomb_frequency << Array.new(13,0)}

    @csv_data.each do |row|
      for i in 0..array_of_tombs.count-1                # This for loop is to go through each tomb (name of tombs)
        if row[1] == array_of_tombs[i]                  # compares the tombs from file with array of tombs
          for k in 3..14                                # for index row of signs (12 signs)
            if row[k] == '1' || row[k] == '?'                            # if the row has 1...do
              tomb_frequency[i][0] = array_of_tombs[i]  # adds the name of the tombs at the start of each array
              tomb_frequency[i][k-2] += 1               # add the frequencies on each column in the array
            end
          end
        end
      end
    end
    tomb_frequency
  end
end

Frequency.read_file


