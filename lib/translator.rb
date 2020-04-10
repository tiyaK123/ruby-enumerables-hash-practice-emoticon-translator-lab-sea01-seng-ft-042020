# require modules here
require 'yaml'


def load_library(path)
  
emoticon = YAML.load_file(path)
 hash = {"emoticon" => {}, "emoticon_symbols" => {}}
 emoticon.each do |k|
   hash[:emoticon]="#{k}"
     hash[:emoticon_symbols] = [k] 
 end
   emoticon.each do |english, japanese|
     
    hash["emoticon"][japanese[1]] = english  
    hash["emoticon_symbols"][japanese[0]] =japanese[1]
end
 hash
end

def get_japanese_emoticon(path, emoticons)
  # code goes here
  hash = load_library(path)
  result = hash["emoticon_symbols"][emoticons]
  if hash["emoticon_symbols"][emoticons]
    result
  else
     "Sorry, that emoticon was not found"
   end
end

def get_english_meaning(path, emoticon)
  # code goes 
  hash = load_library(path)
  result = hash["emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end