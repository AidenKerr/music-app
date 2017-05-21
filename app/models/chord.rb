class Chord
  include ActiveModel::Model
  attr_accessor :notes, :root, :interval, :accidental, :chord
  
  def notesArray
    # Array of all notes.
    # Enharmonic notes are wriiten together and (todo) split when required
    ['A', 'A# Bb', 'B', 'C', 'C# Db', 'D', 'D# Eb', 'E', 'F', 'F# Gb', 'G', 'G# Ab']
  end
  
  def findInterval
    
    rootIndex = notesArray.index(root)
    
    # indexes greater than the length of the array to loop around to the beginning.
    notesArray[(rootIndex + interval) % notesArray.length]
  end
end