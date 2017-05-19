class Chord
  include ActiveModel::Model
  attr_accessor :notes, :root, :intv, :chord
  
  def notesArray
    # Array of all notes.
    # Enharmonic notes are wriiten together and (todo) split when required
    ['A', 'A# Bb', 'B', 'C', 'C# Db', 'D', 'D# Eb', 'E', 'F', 'F# Gb', 'G', 'G# Ab']
  end
  
  # root - string - root of chord
  # intv - integer - interval in semitones
  def interval(root, intv)
    rootIndex = notesArray.index(root)
    
    # This fancy code will basically allow indexes greater than the length of
    # the array to loop around to the beginning.
    notesArray[(rootIndex + intv) % notesArray.length]
  end
  
  
end