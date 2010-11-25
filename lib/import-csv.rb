#!/usr/bin/env ruby

module CsvToArray
  def import_csv_to_array(data)
    format = detect_format(data.readline)
    result = eval("explode_#{format}(data)")
    result
  end

  def detect_format(line)
    format = "csv"
    format = "csv"   if line =~ /:/
    format = "comma" if line =~ /,/
    format
  end

  def explode_csv(data)
    #REKP41:1260026106
    result = []
    data.each { |line|
      (gameid, id) = line.split(/:/)
      result.push gameid.strip
    }
    result
  end

  def explode_comma(data)
    #Game Name, Disc ID, Region, Size on WBFS (GB)
    result = []
    data.each { |line|
      /.*, ([A-Z0-9]{6}),.*,.*/ =~ line 
      result.push "#$1"
    }
    result
  end
end
